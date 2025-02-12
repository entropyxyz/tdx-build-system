;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>
;; Copyright © 2024 Entropy <hi@entropy.xyz>

(define-module (teeeee)
  #:use-module (teeeee packages linux)
  #:use-module (teeeee services entropy)
  #:use-module (gnu system)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services networking)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system shadow)
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)
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
