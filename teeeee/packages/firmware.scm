;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>

(define-module (teeeee packages firmware)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils))

;; TODO: Better naming
;; TODO: Refactor `bash -c' invocation
;; TODO: Add metadata and license
;; TODO: Hex-dump shows bunch of errors thought the build is completed without
;;       any issues.
(define-public tdx-ovmf
  (let ((commit "f80f052277c88a67c55e107b550f504eeea947d3")
        (revision "0"))
    (package
      (name "tdx-ovmf")
      (version (git-version "edk2-stable202302" revision commit))
      (home-page "https://github.com/tianocore/edk2")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tianocore/edk2")
               (commit commit)
               (recursive? #t)))
         (sha256
          (base32 "14x8i488g4jqk06fcr92s7s2a8sixk9cgkqjss6fvd4jsr6mp7i9"))
         (file-name (git-file-name name version))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:tests? #f
        #:make-flags
        #~(list (string-append "CC=" #$(cc-for-target))
                (string-append "BUILD_CC=" #$(cc-for-target)))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'set-cc-for-target
              (λ _
                ;; Substitute hard-coded "CC=cc"
                (substitute*
                    "BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile"
                  (("^BUILD_CC\\?=.*$")
                   (string-append "BUILD_CC?="  #$(cc-for-target) "\n")))))
            (delete 'configure)
            (replace 'build
              (λ _
                (invoke "make" "-C" "BaseTools")
                (invoke "bash" "-c"
                        "source ./edksetup.sh \
                         && build -p OvmfPkg/IntelTdx/IntelTdxX64.dsc \
                                  -a X64 -t GCC5 \
                                  -D SECURE_BOOT_ENABLE=TRUE")))
            (replace 'install
              (λ _
                (install-file "Build/IntelTdx/DEBUG_GCC5/FV/OVMF.fd"
                              #$output))))))
      (native-inputs
       (list nasm python-wrapper util-linux acpica))
      (inputs (list `(,util-linux "lib")))
      (synopsis "")
      (description "")
      (license #f))))
