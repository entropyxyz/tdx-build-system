;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>

(define-module (teeeee packages intel)
  #:use-module (gnu packages)
  #:use-module (gnu packages virtualization)
  #:use-module (guix download)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (gnu packages assembly)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages admin)
  #:use-module (guix git-download)
  #:use-module (gnu packages tex)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-9)
  #:use-module (nongnu packages linux))

(define tdx-linux-patches
  (let ((commit "b15bc033e35475563a70f5c80d3161bc44ba466d"))
    (origin
      (method url-fetch)
      (uri (string-append "https://github.com/intel/tdx-linux/raw/"
                          commit
                          "/kernel-patch/kernel_patch-breakdown.tar.bz2"))
      (sha256
       (base32
        "1v90c3as3m9g4gjnwfclzhk6gsxpxgdychmnlmarym82cfcbafm9")))))

(define-public tdx-kvm-patches
  (let ((commit "9a08f8902435fb8b55130ced6b28a604733160d6"))
    (origin
      (method url-fetch)
      (uri (string-append "https://github.com/intel/tdx-linux/raw/"
                          commit
                          "/tdx-kvm/tdx_kvm_baseline_ee69eb746754.mbox"))
      (sha256
       (base32
        "1v90c3as3m9g4gjnw0clzhk6gsxpxgdychmnlmarym82cfcbafm9")))))

(define-public tdx-linux

  (define freedo
    (customize-linux
     #:name "linux"
     #:linux linux-libre-lts
     #:source (origin
                (method url-fetch)
                (uri url)
                (hash hash))
     #:configs configs
     #:defconfig defconfig))

  (corrupt-linux freedo
                 #:configs
                 (cons* "CONFIG_INTEL_TDX_HOST=y"
                        "CONFIG_KVM=y"
                        "CONFIG_KVM_INTEL=y"
                        "CONFIG_TDX_GUEST_DRIVER=y"
                        "CONFIG_HYPERV=y"
                        "CONFIG_IOMMUFD_DRIVER=y"
                        "CONFIG_VFIO_DEVICE_CDEV=y"
                        "CONFIG_IOMMUFD=y"

                        "CONFIG_KEXEC=n"
                        "CONFIG_CRASH_DUMP=n"

                        (nonguix-extra-linux-options freedo))))

(define-public tdx-ovmf
  (let ((commit "f80f052277c88a67c55e107b550f504eeea947d3")
        (revision "0"))
    (package
      (name "tdx-ovmf")
      (version (git-version "edk2-stable202302" revision commit))
      (home-page "https://github.com/tianocore/edk2")
      (source (origin
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
                (string-append "BUILD_CC=" #$(cc-for-target))
                #;(string-append "PREFIX=" (assoc-ref %outputs "out")))
        #:phases
        #~(modify-phases %standard-phases
            (delete 'configure)
            (replace 'build
              (λ _
                ;; Substitute hard-coded "CC=cc"
                (substitute*
                    "BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile"
                  (("^BUILD_CC\\?=.*$")
                   (string-append "BUILD_CC?="  #$(cc-for-target) "\n")))

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

(define-public qemu-tdx
  (let ((commit "97d7eee4450ca607d36acd2bb1d6137d193687cc")
        (revision "1"))
    (package
      (inherit qemu-minimal)
      (version (git-version "0" revision commit))
      (name "qemu-tdx")
      ;; NOTE: Guix package origin has patches applied
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/intel-staging/qemu-tdx")
                      (commit commit)))
                (sha256
                 (base32 "1n0xiql1si5d4jjzamzrxm1b743ni7casria4ri10kry3r0x5mra"))
                (file-name (git-file-name name version))))
      (arguments
       (substitute-keyword-arguments (package-arguments qemu-minimal)
         ((#:phases phases)
          #~(modify-phases #$phases
              (delete 'replace-firmwares)
              (add-after 'unpack 'include-subprojects
                (λ _
                  (for-each
                   (match-lambda
                     ((dir repo)
                      (copy-recursively repo dir)))
                   ;; TODO replace `version'
                   `(("subprojects/keycodemapdb"
                      ,#$(origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url "https://gitlab.com/qemu-project/keycodemapdb")
                                 (commit "f5772a62ec52591ff6870b7e8ef32482371f22c6")))
                           (file-name (git-file-name "keycodemapdb" version))
                           (sha256
                            (base32
                             "0zmcl67qx9sib0l44g0lqffhcdhk2743ms91aidmk1nh0l2ff2hi"))))
                     ("subprojects/berkeley-softfloat-3"
                      ,#$(origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url "https://gitlab.com/qemu-project/berkeley-softfloat-3")
                                 (commit "b64af41c3276f97f0e181920400ee056b9c88037")))
                           (file-name (git-file-name "berkeley-softfloat-3" version))
                           (sha256
                            (base32
                             "0h2lz7m3mnyccs0sbqg087hgd2csbpd990mqwn1wjlx3x73nkyb1"))))
                     ("subprojects/berkeley-testfloat-3"
                      ,#$(origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url "https://gitlab.com/qemu-project/berkeley-testfloat-3")
                                 (commit "e7af9751d9f9fd3b47911f51a5cfd08af256a9ab")))
                           (file-name (git-file-name "berkeley-testfloat-3" version))
                           (sha256
                            (base32
                             "11a5pv32n6c6g342nwxjkw46s6d4fapw9yvdcrnj9fk6i5wh0x4a"))))
                     ("subprojects/dtc"
                      ,#$(origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url "https://gitlab.com/qemu-project/dtc.git")
                                 (commit "b6910bec11614980a21e46fbccc35934b671bd81")))
                           (file-name (git-file-name "dtc" version))
                           (sha256
                            (base32
                             "1khn6fppnklvm63nga7ndvkmgvrsxcg3pfqr7yhxayixfldln7w3"))))
                     ("subprojects/libblkio"
                      ,#$(origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url "https://gitlab.com/libblkio/libblkio")
                                 (commit "f84cc963a444e4cb34813b2dcfc5bf8526947dc0")))
                           (file-name (git-file-name "libblkio" version))
                           (sha256
                            (base32
                             "1hagx18a7r8aybiah6diqf4laigjcma511wl3ixjs3kky4979qxj"))))
                     ("subprojects/libvfio-user"
                      ,#$(origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url "https://gitlab.com/qemu-project/libvfio-user.git")
                                 (commit "0b28d205572c80b568a1003db2c8f37ca333e4d7")))
                           (file-name (git-file-name "libvfio-user" version))
                           (sha256
                            (base32
                             "0vw4w4lb1gj3x1k50v8nxqnblgkf33s5xryyy0v4pwgkjsf6fkjp"))))
                     ("subprojects/libslirp"
                      ,#$(origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url "https://gitlab.freedesktop.org/slirp/libslirp")
                                 (commit "26be815b86e8d49add8c9a8b320239b9594ff03d")))
                           (file-name (git-file-name "libslirp" version))
                           (sha256
                            (base32
                             "1nwraildmzayp8cbm0bhzdfhxnb674xdan4pnlvyhharxa3ggdg8"))))))
                  ;; (substitute* '("subprojects/berkeley-softfloat-3.wrap"
                  ;;                "subprojects/berkeley-testfloat-3.wrap")
                  ;;   (("patch_directory = .*") ""))
                  (rename-file "subprojects/libslirp" "subprojects/slirp")))
              (add-before 'configure 'move-meson-files
                (λ _
                  (for-each
                   (λ (f)
                     (rename-file f
                                  (string-append "subprojects/" (basename (dirname f))
                                                 "/" (basename f))))
                   (find-files "subprojects/packagefiles" ".*")))))))))))
