(define-module (teeeee ci)
  #:use-module (teeeee packages linux)
  #:use-module (teeeee services entropy)
  #:use-module (gnu packages databases)
  #:use-module (gnu system)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services ssh)
  #:use-module (gnu services cuirass)
  #:use-module (gnu services databases)
  #:use-module (gnu services networking)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system shadow)
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)
  #:use-module (guix gexp)
  #:export (entropy-ci-node))

(define entopy-specs
  #~(list (specification
           (name 'entropy)
           (build '(channels 'entropy))
           (channels
            (append (list (channel
                           (name 'entropy)
                           (url "https://github.com/entropyxyz/tdx-build-system")
                           (branch "ci")))
                    %default-channels)))))

(define entropy-ci-node
  (let ((user-name "users"))
    (operating-system
      (host-name "entropy-ci")
      (timezone "Europe/Berlin")
      (locale "en_US.UTF-8")

      (bootloader (bootloader-configuration
                   (bootloader grub-efi-bootloader)
                   (targets '("/boot/efi"))
                   (timeout 0)
                   (serial-speed 115200)
                   (terminal-outputs '(serial))
                   (terminal-inputs '(serial))))

      (kernel-arguments '("console=ttyS0,115200"))

      (initrd-modules '("cirrus"
                        "virtio_pci"
                        "virtio_balloon"
                        "virtio_blk"
                        "virtio_net"
                        "virtio_console"
                        "virtio_scsi")) ;; gcp

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
              (service postgresql-service-type
                       (postgresql-configuration
                        (postgresql postgresql-15)))
              (service cuirass-service-type
                       (cuirass-configuration
                        (specifications entopy-specs)))
              (service openssh-service-type
                       (openssh-configuration
                        (port-number 22)
                        (password-authentication? #f))))
        %base-services)))))
