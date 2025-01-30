;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>

(define-module (teeeee packages virtualization)
  #:use-module (gnu packages virtualization)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils))

;; TODO: Decompose into separate packages?
;; TODO: Remove ad-hoc subprojects patching
;; TODO: Check if the version should work with current linux-coco
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
                  (rename-file "subprojects/libslirp" "subprojects/slirp")))
              (add-before 'configure 'move-meson-files
                (λ _
                  (for-each
                   (λ (f)
                     (rename-file
                      f (string-append "subprojects/"
                                       (basename (dirname f))
                                       "/" (basename f))))
                   (find-files "subprojects/package files" ".*")))))))))))
