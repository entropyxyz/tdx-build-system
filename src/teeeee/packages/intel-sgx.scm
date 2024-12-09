;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>

(define-module (teeeee packages intel-sgx)
  #:use-module (gnu packages)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages python)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages file)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (guix gexp)
  #:use-module (nonguix build-system binary))

(define (hardcoded-patch patch)
  (display "WARNING: Trying to resolve hardcoded path! Change source you \
the code is not located in \"$HOME/src/git.poeticte.ch/nologies/teeeee.git\"!
"
           (current-error-port))
  (let ((sconf "/src/git.poeticte.ch/nologies/teeeee.git/channel/teeeee/packages/patches"))
    (string-append (string-append (getenv "HOME") sconf)
                   "/" patch)))

(define-record-type <intel-sgx-source-info>
  (make-intel-sgx-source-info version origin)
  intel-sgx-source-info?
  (version  intel-sgx-source-info-version)
  (origin   intel-sgx-source-info-origin))

(define %intel-sgx-source-info
  (let* ((canonical-version "2.22")
         (revision "0")
         (commit "8a223177093da64a5d071b36127d12b04c0d3397"))
    (make-intel-sgx-source-info
     (git-version canonical-version revision commit)
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/intel/linux-sgx")
             (commit (string-append "sgx_" canonical-version))
             #;(recursive? #t)))
       (sha256
        (base32 "1h838fbqhp5m634w690206kpnbk93lml98vk23y5kd4hn0lkmm20"))))))

(define-public intel-sgx-optimized-libs
  (package
    (name "intel-sgx-optimized-libs")
    (version "2.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.01.org/intel-sgx/sgx-linux/"
                                  version
                                  "/optimized_libs_"
                                  version
                                  ".tar.gz"))
              (sha256
               (base32
                "1rani8lqyfjwqbiglh7q21kp0qdjnp7gxnkh0j0dnqm5cgxaz341"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux"))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

(define-public intel-sgx-prebuilt-ae
  (package
    (name "intel-sgx-prebuilt-ae")
    (version "2.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.01.org/intel-sgx/sgx-linux/"
                                  version
                                  "/prebuilt_ae_"
                                  version
                                  ".tar.gz"))
              (sha256
               (base32
                "1i0z2bzg86w7y9sgk5wiwp0i3670dk5dlww5aw0w9z8q9ia7sr90"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux"))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

(define-public intel-sgx-prebuilt-dcap
  (package
    (name "intel-sgx-prebuilt-dcap")
    (version "1.19")
    (source (origin
              (method url-fetch)
              (uri (string-append 
                    "https://download.01.org/intel-sgx/sgx-dcap/"
                    version
                    "/linux//prebuilt_dcap_" version ".tar.gz"))
              (sha256
               (base32
                "0s31ny3ni7k33jbh83vwcqkcgz5wbmrwx2ifzqg3yb5gdwvizcxv"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux"))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

(define-public intel-sgx-as.ld.objdump.r4
  (package
    (name "intel-sgx-as.ld.objdump.r4")
    (version "2.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.01.org/intel-sgx/sgx-linux/"
                                  version
                                  "/as.ld.objdump.r4.tar.gz"))
              (sha256
               (base32
                "1199x4cs754fjk2kypsy2aq33lcjbx02hqawk0b9brxi9n0vajhw"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux"))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

(define-public intel-sgx-openssl-source
  (package
    (name "intel-sgx-openssl-source")
    (version "3.0")
    (source (origin
              (method url-fetch/zipbomb)
              ;; there are also
              ;; https://github.com/intel/intel-sgx-ssl/archive/refs/tags/3.0_Rev1.zip
              ;; https://github.com/intel/intel-sgx-ssl/archive/refs/tags/3.0_Rev1.tar.gz
              (uri (string-append
                    "https://github.com/intel/intel-sgx-ssl/archive/" version "_Rev1.zip"))
              (sha256
               (base32
                "1djkrk4jjqi38lx5vgwv7dqzvvnjk9ahm2lpnaxs7ifdbbidnwb3"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("intel-sgx-ssl-3.0_Rev1" "."))))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

(define-public intel-sgx-common-headers
  (package
    (name "intel-sgx-sdk-common")
    (version (intel-sgx-source-info-version %intel-sgx-source-info))
    (source (intel-sgx-source-info-origin %intel-sgx-source-info))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("common/inc" "include"))))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public intel-sgx-emm-common-headers
  (package
    (name "intel-sgx-emm-common-headers")
    (version  "1.0.3")
    (source 
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/intel/sgx-emm")
             (commit (string-append "sgx-emm-" version))))
       (sha256
        (base32 "0r1blcr2zypj5jp3xcma1c1g7cvicv30zxscbg1gsakchxbkv78n"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("include/sgx_mm.h" "include/") 
          ("include/sgx_mm_primitives.h" "include/")
          ("include/sgx_mm_rt_abstraction.h" "include/"))))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public openmp-for-intel-sgx
  (let ((revision "0")
        (commit "c9e7fc8c97382d61565f7ed180e4ea1cc8895b95"))
    (package
      (name "openmp-for-intel-sgx")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/llvm-mirror/openmp")
               (commit commit)))
         (sha256
          (base32 "0hyc3j6n6lfragadcabns1lxx05f8nkga114chkzknkighc0a6sa"))
         (patches (list (hardcoded-patch "0001-Enable-OpenMP-in-SGX.patch")))
         (modules '((guix build utils)))
         (snippet
          '(begin (for-each delete-file-recursively
                            '("rc1" "rc2" "rc3" "rc4"))
                  (copy-recursively "final" ".")
                  (delete-file-recursively "final")))))
      (build-system cmake-build-system)
      (native-inputs (list perl))
      (inputs (list intel-sgx-common-headers 
                    intel-sgx-emm-common-headers))
      (synopsis "")
      (description "")
      (home-page "")
      (license #f))))

(define-public intel-sgx-sdk
  (package
    (name "intel-sgx-sdk")
    (version (intel-sgx-source-info-version %intel-sgx-source-info))
    (source (intel-sgx-source-info-origin %intel-sgx-source-info))
    (build-system trivial-build-system)
    (arguments
     (list
      #:builder
      (with-imported-modules '((guix build utils))
        #~(begin
            (use-modules (guix build utils))
            (mkdir #$output)
            (copy-recursively #$source "."
                              #:keep-permissions? #t)
            (copy-recursively #$source "external/dcap_source/QuoteVerification/sgxssl/"
                              #:keep-permissions? #t)))))
    (native-inputs
     (list gcc-toolchain
           coreutils
           bash
           gnu-make
           grep
           gawk
           sed
           automake
           autoconf
           libtool 
           cmake
           ocaml
           ocamlbuild
           python
           perl
           file
           intel-sgx-optimized-libs
           intel-sgx-prebuilt-ae
           intel-sgx-as.ld.objdump.r4))
    (inputs
     (list ))
    (home-page "")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

;; (define-public intel-sgx-sdk-dirty
;;   (package
;;     (name "intel-sgx-sdk-dirty")
;;     (version (intel-sgx-source-info-version %intel-sgx-source-info))
;;     (source (intel-sgx-source-info-origin %intel-sgx-source-info))
;;     (build-system trivial-build-system)
;;     (arguments
;;      (list
;;       #:builder
;;       (with-imported-modules '((guix build utils))
;;         #~(begin
;;             (use-modules (guix build utils))
;;             (mkdir #$output)
;;             (copy-recursively #$source "."
;;                               #:keep-permissions? #t)
;;             (copy-recursively #$ "."
;;                                  #:keep-permissions? #t)))))
;;     (native-inputs
;;      (list gcc-toolchain
;;            coreutils
;;            bash
;;            gnu-make
;;            grep
;;            gawk
;;            sed
;;            automake
;;            autoconf
;;            libtool
;;            cmake
;;            ocaml
;;            ocamlbuild
;;            python
;;            perl
;;            file
;;            intel-sgx-optimized-libs
;;            intel-sgx-prebuilt-ae
;;            intel-sgx-as.ld.objdump.r4
;;            intel-sgx-openssl-source))
;;     (inputs
;;      (list ))
;;     (home-page "")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))
