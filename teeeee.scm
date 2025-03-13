;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>
;; Copyright © 2024 Entropy <hi@entropy.xyz>

(define-module (teeeee)
  #:use-module (teeeee packages linux)
  #:use-module (teeeee services cloud-init)
  #:use-module (teeeee services entropy)
  #:use-module (gnu bootloader grub)
  #:use-module (gnu bootloader)
  #:use-module (gnu packages ssh)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:use-module (gnu services base)
  #:use-module (gnu services networking)
  #:use-module (gnu services ssh)
  #:use-module (gnu services sysctl)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system linux-initrd)
  #:use-module (gnu system shadow)
  #:use-module (gnu system)
  #:use-module (gnu system)
  #:use-module (guix gexp)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu system linux-initrd)
  #:export (entropy-tss-node
            example-entropy-tss-node))

(define* (entropy-tss-node
          #:key
          (host-name "tss-node")
          timezone
          (locale "en_US.utf8")
          (tss-config (entropy-tss-configuration (dev #t))))
  (operating-system
    (host-name host-name)
    (timezone timezone)
    (locale locale)
    (firmware '())
    (kernel linux-coco)
    (kernel-arguments '("kvm_intel.tdx=on" "nohibernate"))
    (initrd-modules '("virtio_pci"
                      "virtio_balloon"
                      "virtio_blk"
                      "virtio_net"
                      "virtio_console"))
    (bootloader (bootloader-configuration
                 (bootloader grub-bootloader)
                 (targets '("/dev/vda"))))
    (file-systems (cons (file-system
                          (mount-point "/")
                          (device "/dev/vda1")
                          (type "ext4"))
                        %base-file-systems))
    (users %base-user-accounts)
    (packages %base-packages)
    (services
     (append
      (list (service dhcp-client-service-type)
            (service entropy-tss-service-type tss-config))
      %base-services))))

(define example-entropy-tss-node
  (entropy-tss-node #:timezone "Europe/Berlin"))

(define %sysctl-settings
  '(;; Enable syn flood protection
    ("net.ipv4.tcp_syncookies" . "1")
    ;; Ignore source-routed packets
    ("net.ipv4.conf.all.accept_source_route" . "0")
    ;; Ignore source-routed packets
    ("net.ipv4.conf.default.accept_source_route" . "0")
    ;; Ignore ICMP redirects
    ("net.ipv4.conf.all.accept_redirects" . "0")
    ;; Ignore ICMP redirects
    ("net.ipv4.conf.default.accept_redirects" . "0")
    ;; Ignore ICMP redirects from non-GW hosts
    ("net.ipv4.conf.all.secure_redirects" . "1")
    ;; Ignore ICMP redirects from non-GW hosts
    ("net.ipv4.conf.default.secure_redirects" . "1")
    ;; Don't allow traffic between networks or act as a router
    ("net.ipv4.ip_forward" . "0")
    ;; Don't allow traffic between networks or act as a router
    ("net.ipv4.conf.all.send_redirects" . "0")
    ;; Don't allow traffic between networks or act as a router
    ("net.ipv4.conf.default.send_redirects" . "0")
    ;; Reverse path filtering&mdash;IP spoofing protection
    ("net.ipv4.conf.all.rp_filter" . "1")
    ;; Reverse path filtering&mdash;IP spoofing protection
    ("net.ipv4.conf.default.rp_filter" . "1")
    ;; Ignore ICMP broadcasts to avoid participating in Smurf attacks
    ("net.ipv4.icmp_echo_ignore_broadcasts" . "1")
    ;; Ignore bad ICMP errors
    ("net.ipv4.icmp_ignore_bogus_error_responses" . "1")
    ;; Log spoofed, source-routed, and redirect packets
    ("net.ipv4.conf.all.log_martians" . "1")
    ;; Log spoofed, source-routed, and redirect packets
    ("net.ipv4.conf.default.log_martians" . "1")
    ;; Randomize addresses of mmap base, heap, stack and VDSO page
    ("kernel.randomize_va_space" . "2")
    ;; Provide protection from ToCToU races
    ("fs.protected_hardlinks" . "1")
    ;; Provide protection frmo  ToCToU races
    ("fs.protected_symlinks". "1")
    ;; Make locating kernel addresses more difficult
    ("kernel.kptr_restrict" . "1")
    ;; Set ptrace protections
    ("kernel.yama.ptrace_scope" . "1")
    ;; Set perf only available to root
    ("kernel.perf_event_paranoid" . "2")))

(define-public (make-test-gcp-entropy-guest ssh-public-key)
  (let ((%root-file-system (file-system
                             (mount-point "/")
                             (device "/dev/nvme0n1p2")
                             (type "ext4"))))
    (operating-system
      (host-name "guix")
      (timezone "Europe/Berlin")

      (bootloader (bootloader-configuration
                   (bootloader grub-efi-bootloader)
                   (targets '("/boot/efi"))
                   (timeout 0)
                   (serial-speed 115200)
                   (terminal-outputs '(serial))
                   (terminal-inputs '(serial))))

      (kernel linux-tdx-gcp)

      (initrd (λ (file-systems . rest)
                (apply microcode-initrd file-systems
                       #:initrd base-initrd
                       #:microcode-packages (list intel-microcode)
                       rest)))
      (firmware (list linux-firmware))

      (kernel-arguments '("console=ttyS0,115200"
                          "kvm_intel.tdx=on"
                          "nohibernate"
                          "scsi_mod.use_blk_mq=Y"
                          "modprobe.blacklist=usbmouse"
                          "modprobe.blacklist=usbkbd"))

      (initrd-modules '("ahci" "hid-generic" "serpent_generic" "uas"
                        "usb-storage" "usbhid" "virtio-rng" "virtio_balloon"
                        "virtio_blk" "virtio_console" "virtio_net" "virtio_pci"
                        "virtio_scsi" "wp512" "xts"))

      (file-systems (cons* (file-system
                             (mount-point "/boot/efi")
                             (device "/dev/nvme0n1p1")
                             (type "vfat"))
                           %root-file-system
                           %base-file-systems))

      (swap-devices '())

      (users (cons (user-account
                    (name "guest")
                    (password "") ;; no password
                    (group "users")
                    (supplementary-groups '("wheel" "netdev"
                                            "audio" "video")))
                   %base-user-accounts))

      (services (cons* (service resize-file-system-service-type
                                (resize-file-system-configuration
                                 (file-system %root-file-system)))
                       (service dhcp-client-service-type)
                       (service ntp-service-type)
                       (service openssh-service-type
                                (openssh-configuration
                                 (openssh openssh-sans-x)
                                 (permit-root-login 'prohibit-password)
                                 (authorized-keys
                                  `(("guest"
                                     ,(local-file
                                       (canonicalize-path ssh-public-key)))))))
                       (service entropy-tss-service-type
                                (entropy-tss-configuration
                                 (chain-endpoint "ws://0.0.0.0:9944")
                                 (threshold-url "0.0.0.0:3001")
                                 (dev #t)))
                       (modify-services %base-services
                         (sysctl-service-type
                          config =>
                          (sysctl-configuration
                           (settings %sysctl-settings)))))))))

