(define-module (teeeee os)
  #:use-module (teeeee packages linux)
  #:use-module (teeeee services entropy)
  #:use-module (gnu system)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services ssh)
  #:use-module (gnu services networking)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system shadow)
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)
  #:use-module (guix gexp)
  #:export (entropy-tss-node
            example-entropy-tss-node
            test-tdx-host
            test-tdx-guest))

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
                      "virtio_console"
                      "cirrus"))
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

(define test-tdx-host
  (let ((user-name "users"))
    (operating-system
      (inherit (entropy-tss-node
                #:host-name "test-tdx-host"
                #:timezone "Europe/Berlin"))

      (users (cons* (user-account
                     (name user-name)
                     (group "users")
                     (supplementary-groups
                      '("wheel" "netdev" "audio" "video" "kvm")))
                    %base-user-accounts))

      (bootloader (bootloader-configuration
                   (bootloader grub-efi-bootloader)
                   (targets (list "/boot/efi"))))

      (file-systems (cons* (file-system
                             (mount-point "/boot/efi")
                             (device "/dev/nvme0n1p1")
                             (type "vfat"))
                           (file-system
                             (mount-point "/")
                             (device "/dev/nvme0n1p2")
                             (type "ext4"))
                           %base-file-systems))

      (initrd-modules '("virtio_pci"
                        "virtio_balloon"
                        "virtio_blk"
                        "virtio_net"
                        "virtio_console"
                        "cirrus"))
      (services
       (append
        (list (service dhcp-client-service-type)
              (service openssh-service-type
                       (openssh-configuration
                        (port-number 22)
                        (password-authentication? #f))))
        %base-services)))))

(define test-tdx-guest
  (let ((user-name "users"))
    (operating-system
      (inherit (entropy-tss-node
                #:host-name "test-tdx-guest"
                #:timezone "Europe/Berlin"))

      (bootloader (bootloader-configuration
                   (bootloader grub-efi-bootloader)
                   (targets '("/boot/efi"))
                   (timeout 0)
                   (serial-speed 115200)
                   (terminal-outputs '(serial))
                   (terminal-inputs '(serial))))

      (kernel-arguments '("console=ttyS0,115200"
                          "kvm_intel.tdx=on"
                          "nohibernate"))

      (initrd-modules '(;;"cirrus"
                        "virtio_pci"
                        "virtio_balloon"
                        "virtio_blk"
                        "virtio_net"
                        "virtio_console"
                        "virtio_scsi"))

      (file-systems (cons* (file-system
                             (device "/dev/nvme0n1p2")
                             (mount-point "/")
                             (type "ext4"))
                           (file-system
                             (device "/dev/nvme0n1p1")
                             (mount-point "/boot/efi")
                             (type "vfat"))
                           %base-file-systems))

      (users (cons* (user-account
                     (name user-name)
                     (group "users")
                     (supplementary-groups
                      '("wheel" "netdev" "audio" "video")))
                    %base-user-accounts))

      (services
       (append
        (list (service dhcp-client-service-type)
              (service openssh-service-type
                       (openssh-configuration
                        (port-number 22)
                        (password-authentication? #f))))
        %base-services)))))
