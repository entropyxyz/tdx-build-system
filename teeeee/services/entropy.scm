;; Copyright © 2024 Entropy <hi@entropy.xyz>

(define-module (teeeee services entropy)
  #:use-module (teeeee packages entropy)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services web)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages networking)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix records)
  #:use-module (guix utils)
  #:use-module (ice-9 match)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-35)
  #:export (entropy-tss-configuration
            entropy-tss-service-type))

(define-record-type* <entropy-tss-configuration>
  entropy-tss-configuration make-entropy-tss-configuration
  entropy-tss-configuration?
  (package entropy-tss-configuration-package
           (default entropy-tss))
  (chain-endpoint entropy-tss-configuration-chain-endpoint
                  (default "ws://127.0.0.1:944"))
  (threshold-url entropy-tss-threshold-url
                 (default "127.0.0.1:3001"))
  (menemonic-file entropy-tss-mnemonic-file
                  (default #f))
  (dev entropy-tss-dev
       (default #f)))

(define %entropy-tss-accounts
  (list (user-account
         (name "entropy-tss")
         (group "entropy-tss")
         (system? #t)
         (comment "entropy-tss daemon user")
         (home-directory "/var/lib/entropy-tss")
         (shell (file-append shadow "/sbin/nologin")))
        (user-group
         (name "entropy-tss")
         (system? #t))))

(define entropy-tss-shepherd-service
  (match-lambda
    (($ <entropy-tss-configuration> package
                                    chain-endpoint
                                    threshold-url
                                    menemonic-file
                                    dev)
     (shepherd-service
      (documentation "Entropy threshold signature scheme (TSS) server.")
      (provision '(entropy-tss))
      (requirement '(user-processes networking))
      (start #~(make-forkexec-constructor
                (list #$(file-append package "/bin/entropy-tss")
                      "--chain-endpoint" #$chain-endpoint
                      "--threshold-url" #$threshold-url
                      #$@(if dev
                             #~("--dev")
                             #~("--menemonic-file" #$menemonic-file)))))
      (stop #~(make-kill-destructor))))))

(define entropy-tss-service-type
  (service-type
   (name 'entropy-tss)
   (description "Run Entropy threshold signature scheme (TSS) server.")
   (extensions
    (list (service-extension account-service-type
                             (const %entropy-tss-accounts))
          (service-extension shepherd-root-service-type
                             (compose list entropy-tss-shepherd-service))))))
