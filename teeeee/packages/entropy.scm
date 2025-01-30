;; Copyright © 2024 Entropy <hi@entropy.xyz>

;; TODO: Cleanup openssl inputs
(define-module (teeeee packages entropy)
  #:use-module (teeeee packages utils)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages crates-check)
  #:use-module (gnu packages crates-compression)
  #:use-module (gnu packages crates-crypto)
  #:use-module (gnu packages crates-database)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-tls)
  #:use-module (gnu packages crates-vcs)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages pkg-config)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages tls)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download))

;; No longer upstream
(define-public rust-impl-rlp-0.3
  (package
    (name "rust-impl-rlp")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "impl-rlp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "021869d5s47ili9kmhm9y80qpsbf0wwdap14qzfpb84pjbw210pj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rlp" ,rust-rlp-0.5))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "RLP serialization support for uint and fixed hash")
    (description "This package provides RLP serialization support for uint
and fixed hash.")
    (license (list license:expat license:asl2.0))))

;; No longer upstream
(define-public rust-gimli-0.28
  (package
    (inherit rust-gimli-0.31)
    (name "rust-gimli")
    (version "0.28.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lv23wc8rxvmjia3mcxc6hj9vkqnv1bqq0h8nzjcgf71mrxx6wa2"))))
    (arguments
     `(#:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
        ("rust-indexmap" ,rust-indexmap-2)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
        ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))
       #:cargo-development-inputs
       (("rust-test-assembler" ,rust-test-assembler-0.1))))))

;; No longer upstream
(define-public rust-gimli-0.27
  (package
    (inherit rust-gimli-0.28)
    (name "rust-gimli")
    (version "0.27.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "gimli" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0bpdnkyzi3vp2r0wglwrncbk451zhp46mdl83f6xj4gsmy20kj5n"))))
    (arguments
     `(#:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
        ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))
       #:cargo-development-inputs
       (("rust-crossbeam" ,rust-crossbeam-0.8)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-memmap2" ,rust-memmap2-0.6)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-object" ,rust-object-0.30)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-test-assembler" ,rust-test-assembler-0.1)
        ("rust-typed-arena" ,rust-typed-arena-2))))))

;; No longer upstream
(define-public rust-hmac-0.8
  (package
    (inherit rust-hmac-0.11)
    (name "rust-hmac")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hmac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0h48wc7iysh4xd6ci4prh8bb7nszijrh9w3blaaq8a6cilk8hs0j"))))
    (arguments
     `(#:cargo-inputs
       (("rust-crypto-mac" ,rust-crypto-mac-0.8)
        ("rust-digest" ,rust-digest-0.9))
       #:cargo-development-inputs
       (("rust-crypto-mac" ,rust-crypto-mac-0.8)
        ("rust-md-5" ,rust-md-5-0.9)
        ("rust-sha2" ,rust-sha2-0.9))))))

;; No longer upstream
(define-public rust-common-path-1
  (package
    (name "rust-common-path")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "common-path" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00firjly5xpb5hhmivnnhwakr1cwbqv8ckzyj0vbxczl89czg0i3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://gitlab.com/pwoolcoc/common-path")
    (synopsis "Find the common prefix between a set of paths")
    (description
     "Common path finds the common prefix between a set of paths.")
    (license (list license:expat license:asl2.0))))

;; No longer upstream
(define-public rust-matchers-0.0
  (package
    (name "rust-matchers")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "matchers" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q8ckqmkjqkznvdi9x0z769yz2bmvlqcwx51ad2lpk4mfmgpi6gh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-regex-automata" ,rust-regex-automata-0.1))))
    (home-page "https://github.com/hawkw/matchers")
    (synopsis "Regex matching on character and byte streams")
    (description
     "Use this crate to match on character and byte streams using regular
grammars.  It provides the subset of the regex crate that only deals with
matching, not parsing substrings.")
    (license license:expat)))

;; No longer upstream
(define-public rust-addr2line-0.21
  (package
    (inherit rust-addr2line-0.24)
    (name "rust-addr2line")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jx0k3iwyqr8klqbzk6kjvr496yd94aspis10vwsj5wy7gib4c4a"))))
    (arguments
     `(#:tests? #f      ; use of undeclared crate or module `auxiliary`
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
        ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
        ("rust-gimli" ,rust-gimli-0.28)
        ("rust-memmap2" ,rust-memmap2-0.5)
        ("rust-object" ,rust-object-0.32)
        ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
        ("rust-smallvec" ,rust-smallvec-1))
       #:cargo-development-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                                   ("rust-clap" ,rust-clap-4)
                                   ("rust-findshlibs" ,rust-findshlibs-0.10)
                                   ("rust-libtest-mimic" ,rust-libtest-mimic-0.6)
                                   ("rust-typed-arena" ,rust-typed-arena-2))))))

;; No longer upstream
(define-public rust-addr2line-0.19
  (package
    (inherit rust-addr2line-0.21)
    (name "rust-addr2line")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "addr2line" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "15ywmr5wx22q69ffnn79qp65ir5p1x0k2q06plcpv6v74c5xcvx7"))))
    (arguments
     `(#:tests? #f      ; use of undeclared crate or module `auxiliary`
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
        ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
        ("rust-gimli" ,rust-gimli-0.27)
        ("rust-object" ,rust-object-0.30)
        ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
        ("rust-smallvec" ,rust-smallvec-1))
       #:cargo-development-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-clap" ,rust-clap-3)
        ("rust-findshlibs" ,rust-findshlibs-0.10)
        ("rust-memmap2" ,rust-memmap2-0.5)
        ("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-typed-arena" ,rust-typed-arena-2))))))

;; No longer upstream
(define-public rust-nom-1
  (package
    (inherit rust-nom-4)
    (name "rust-nom")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kjh42w67z1hh1dw3jrilgqrf54jk2xcvhw4rcdm4wclzmbc5f55"))))
    (arguments
     ;; This is an ancient version and all inputs are optional.
     `(#:skip-build? #t))))

;; No longer upstream
;; XXX: Maybe relax rust-parity-bip39-2 instead?
(define-public rust-unicode-normalization-0.1.22
  (package
    (name "rust-unicode-normalization")
    (version "0.1.22")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-normalization" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08d95g7b1irc578b2iyhzv4xhsa4pfvwsqxcl9lbcpabzkq16msw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-tinyvec" ,rust-tinyvec-1))))
    (home-page "https://github.com/unicode-rs/unicode-normalization")
    (synopsis "Functions for normalization of Unicode strings")
    (description
     "This crate provides functions for normalization of Unicode strings,
including Canonical and Compatible Decomposition and Recomposition, as
described in Unicode Standard Annex #15.")
    (license (list license:expat license:asl2.0))))

(define-public rust-subxt-signer-0.35
  (package
    (name "rust-subxt-signer")
    (version "0.35.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-signer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y4xfxga2dc69654x1i976wjd1jy8ds62xa7aaszlmz3iyimkjvc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bip39" ,rust-bip39-2)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.12)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-secp256k1" ,rust-secp256k1-0.28)
                       ("rust-secrecy" ,rust-secrecy-0.8)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sp-crypto-hashing" ,rust-sp-crypto-hashing-0.1)
                       ("rust-subxt" ,rust-subxt-0.35)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Sign extrinsics to be submitted by Subxt")
    (description
     "This package provides Sign extrinsics to be submitted by Subxt.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-sp-keyring-34
  (package
    (name "rust-sp-keyring")
    (version "34.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-keyring" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kzkly72w4ba73f3dr0d17wd4zxgjyl89msq6hx5nw3db7d32ym0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-runtime" ,rust-sp-runtime-34)
                       ("rust-strum" ,rust-strum-0.24))))
    (home-page "https://substrate.io")
    (synopsis
     "Keyring support code for the runtime. A set of test accounts. (polkadot v1.15.0)")
    (description
     "This package provides Keyring support code for the runtime.  A set of test
accounts. (polkadot
v1.15.0).")
    (license license:asl2.0)))

(define-public rust-serial-test-derive-3
  (package
    (name "rust-serial-test-derive")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serial_test_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rrx13r2kdahbgs9qfvbx63zgzafrjjpiq42vsy1zvxw4nrrvzl2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/palfrey/serial_test/")
    (synopsis "Helper crate for serial_test")
    (description "This package provides Helper crate for serial_test.")
    (license license:expat)))

(define-public rust-sdd-3
  (package
    (name "rust-sdd")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sdd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17yj7hif7k6wpv6xx7h97jhyil32kcdd0s7b9cjyhbb7giby9584"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-loom" ,rust-loom-0.7))))
    (home-page "https://github.com/wvwwvwwv/scalable-delayed-dealloc/")
    (synopsis "Scalable lock-free delayed memory reclaimer")
    (description
     "This package provides Scalable lock-free delayed memory reclaimer.")
    (license license:asl2.0)))

(define-public rust-scc-2
  (package
    (name "rust-scc")
    (version "2.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dsaj6xjym8ayv22dfnij0rscl8xnw3raqr0g45bg59h4j3ardxf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-loom" ,rust-loom-0.7)
                       ("rust-sdd" ,rust-sdd-3)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/wvwwvwwv/scalable-concurrent-containers/")
    (synopsis
     "High performance containers and utilities for concurrent and asynchronous
programming")
    (description
     "This package provides High performance containers and utilities for concurrent
and asynchronous
programming.")
    (license license:asl2.0)))

(define-public rust-serial-test-3
  (package
    (name "rust-serial-test")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serial_test" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zfpzr8jl7dpf4m8dk8fr9w1wfwhnjrccmyg46h41wmcw9zlhjsb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-document-features" ,rust-document-features-0.2)
                       ("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-fslock" ,rust-fslock-0.2)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-scc" ,rust-scc-2)
                       ("rust-serial-test-derive" ,rust-serial-test-derive-3))))
    (home-page "https://github.com/palfrey/serial_test/")
    (synopsis "Allows for the creation of serialised Rust tests")
    (description
     "This package provides Allows for the creation of serialised Rust tests.")
    (license license:expat)))

(define-public rust-schemars-derive-0.8
  (package
    (name "rust-schemars-derive")
    (version "0.8.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "schemars_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03ncmrkldfmdc9skmlyysx2vqdlyyz91r5mbavw77zwaay4fbvmi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-serde-derive-internals" ,rust-serde-derive-internals-0.29)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://graham.cool/schemars/")
    (synopsis "Macros for #[derive(JsonSchema)], for use with schemars")
    (description
     "This package provides Macros for #[derive(@code{JsonSchema})], for use with
schemars.")
    (license license:expat)))

(define-public rust-schemars-0.8
  (package
    (name "rust-schemars")
    (version "0.8.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "schemars" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14lyx04388wgbilgcm0nl75w6359nw16glswfqv7x2rpi9329h09"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.5)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-bigdecimal" ,rust-bigdecimal-0.4)
                       ("rust-bigdecimal" ,rust-bigdecimal-0.3)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-dyn-clone" ,rust-dyn-clone-1)
                       ("rust-either" ,rust-either-1)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-rust-decimal" ,rust-rust-decimal-1)
                       ("rust-schemars-derive" ,rust-schemars-derive-0.8)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-smol-str" ,rust-smol-str-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-0.8)
                       ("rust-uuid" ,rust-uuid-1))))
    (home-page "https://graham.cool/schemars/")
    (synopsis "Generate JSON Schemas from Rust code")
    (description "This package provides Generate JSON Schemas from Rust code.")
    (license license:expat)))

(define-public rust-project-root-0.2
  (package
    (name "rust-project-root")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "project-root" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pv3ry35p9bn71y4ipzfxm0n3asjg8qdf83x1328kmjygpqbzk4b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/neilwashere/rust-project-root")
    (synopsis
     "Simple utility to return the absolute path to your project root")
    (description
     "This package provides Simple utility to return the absolute path to your project
root.")
    (license (list license:expat license:asl2.0))))

(define-public rust-open-fastrlp-derive-0.1
  (package
    (name "rust-open-fastrlp-derive")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "open-fastrlp-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "075vckvkh0616rx4b15nzq8d8p4iqfhvhf52n3z1qg65qvjjnfq0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/gakonst/open-fastrlp")
    (synopsis "Procedural macros for fastrlp")
    (description "This package provides Procedural macros for fastrlp.")
    (license license:asl2.0)))

(define-public rust-auto-impl-1
  (package
    (name "rust-auto-impl")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "auto_impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hmfcahj0vrnzq7rayk7r428zp54x9a8awgw6wil753pbvqz71rw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/auto-impl-rs/auto_impl/")
    (synopsis
     "Automatically implement traits for common smart pointers and closures")
    (description
     "This package provides Automatically implement traits for common smart pointers
and closures.")
    (license (list license:expat license:asl2.0))))

(define-public rust-open-fastrlp-0.1
  (package
    (name "rust-open-fastrlp")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "open-fastrlp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kmrx6f4qc6vhdiimgf4qsf11pali09x6gq4ysa5fi450kw96qvq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-auto-impl" ,rust-auto-impl-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-ethereum-types" ,rust-ethereum-types-0.14)
                       ("rust-ethnum" ,rust-ethnum-1)
                       ("rust-open-fastrlp-derive" ,rust-open-fastrlp-derive-0.1))))
    (home-page "https://github.com/gakonst/open-fastrlp")
    (synopsis
     "Fast RLP serialization library. This crate is a yanked version of FastRLP 0.1.2
which was Apache licensed")
    (description
     "This package provides Fast RLP serialization library.  This crate is a yanked
version of
@code{FastRLP} 0.1.2 which was Apache licensed.")
    (license license:asl2.0)))

(define-public rust-ethbloom-0.13
  (package
    (name "rust-ethbloom")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ethbloom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q0g286d1gb3ghs8fssf8fg77grjsaw9ycmrx3jjzamnhmc4nbf2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crunchy" ,rust-crunchy-0.2)
                       ("rust-fixed-hash" ,rust-fixed-hash-0.8)
                       ("rust-impl-codec" ,rust-impl-codec-0.6)
                       ("rust-impl-rlp" ,rust-impl-rlp-0.3)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-scale-info" ,rust-scale-info-1)
                       ("rust-tiny-keccak" ,rust-tiny-keccak-2))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Ethereum bloom filter")
    (description "This package provides Ethereum bloom filter.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ethereum-types-0.14
  (package
    (name "rust-ethereum-types")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ethereum-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vnqxmrz1l7wg4mh284f4q09vaw0zrr878wrpvy2wma0y35iblh2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ethbloom" ,rust-ethbloom-0.13)
                       ("rust-fixed-hash" ,rust-fixed-hash-0.8)
                       ("rust-impl-codec" ,rust-impl-codec-0.6)
                       ("rust-impl-rlp" ,rust-impl-rlp-0.3)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-scale-info" ,rust-scale-info-1)
                       ("rust-uint" ,rust-uint-0.9))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Ethereum types")
    (description "This package provides Ethereum types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ethabi-18
  (package
    (name "rust-ethabi")
    (version "18.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ethabi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1668rcninb2lrvg2z1khs95k7syb6slnb2ba70vyl0y99kvwa4vl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ethereum-types" ,rust-ethereum-types-0.14)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-uint" ,rust-uint-0.9))))
    (home-page "https://github.com/rust-ethereum/ethabi")
    (synopsis "Easy to use conversion of ethereum contract calls to bytecode")
    (description
     "This package provides Easy to use conversion of ethereum contract calls to
bytecode.")
    (license license:asl2.0)))

(define-public rust-const-hex-1
  (package
    (name "rust-const-hex")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "const-hex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ihbc6gc4yixrcpjzha4xb758rpyr4yk4hskskzy2dvdl8j8mywl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpufeatures" ,rust-cpufeatures-0.2)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-proptest" ,rust-proptest-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/danipopes/const-hex")
    (synopsis "Fast byte array to hex string conversion")
    (description
     "This package provides Fast byte array to hex string conversion.")
    (license (list license:expat license:asl2.0))))

;; added for rust-rlp-derive-0.5
#;(define-public rust-rlp-0.4
  (package
    (name "rust-rlp")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rlp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wrf5wkza61f92aifk8p9q2y2fbz9k4bi6yhyppg24m5qg4dr40i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-hex" ,rust-rustc-hex-2))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Recursive-length prefix encoding, decoding, and compression")
    (description
     "This package provides Recursive-length prefix encoding, decoding, and
compression.")
    (license (list license:expat license:asl2.0))))

;; added for rust-rlp-derive-0.5
(define-public rust-rlp-derive-0.1
  (package
    (name "rust-rlp-derive")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rlp-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ak73xi7zpw0zs5n30w6j2jmwfqdyb9hfagyjy3hsd0cpqm7ngg3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))
       #;#:cargo-development-inputs #;("rust-rlp" ,rust-rlp-0.4)))
    (home-page "http://parity.io")
    (synopsis "Derive macro for #[derive(RlpEncodable, RlpDecodable)]")
    (description
     "This package provides Derive macro for #[derive(@code{RlpEncodable},
@code{RlpDecodable})].")
    (license (list license:expat license:asl2.0))))

;; added
(define-public rust-rlp-derive-0.5
  (package
    (name "rust-rlp")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rlp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1da7b1hc4czlmsyr7ifs9bz9fv8hi5dw8q14xnmjlydfn2mhi5cr"))
       #;(patches (teeeee-patches "rust-rlp-add-derive-feature.patch"))
       (modules '((guix build utils)))
       (snippet
        #~(begin (use-modules (guix build utils))
                 (substitute* "Cargo.toml"
                   ;; rust-criterion-0.3
                   (("0\\.3\\.\\0") "0.3.6")
                   (("\\[features\\]")
                    (string-append
                     "[dependencies.rlp-derive]\n"
                     "version = \"0.1\"\n"
                     "optional = true\n"
                     "[features]\n"
                     "derive = [\"rlp-derive\"]")))))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:features '("derive")
       #:cargo-build-flags '("--release" "--features" "derive")
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-criterion" ,rust-criterion-0.3)
                       ("rust-rustc-hex" ,rust-rustc-hex-2)
                       ("rust-rlp-derive" ,rust-rlp-derive-0.1))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Recursive-length prefix encoding, decoding, and compression")
    (description "This package provides Recursive-length prefix encoding,
decoding, and compression.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ethers-core-2
  (package
    (name "rust-ethers-core")
    (version "2.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ethers-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07zv33picj1japynmh1zcal2hzxk6fpj6rbqmd44mc9hmp30rn42"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cargo-metadata" ,rust-cargo-metadata-0.18)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-const-hex" ,rust-const-hex-1)
                       ("rust-elliptic-curve" ,rust-elliptic-curve-0.13)
                       ("rust-ethabi" ,rust-ethabi-18)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-k256" ,rust-k256-0.13)
                       ("rust-num-enum" ,rust-num-enum-0.7)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-open-fastrlp" ,rust-open-fastrlp-0.1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rlp" ,rust-rlp-derive-0.5)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-strum" ,rust-strum-0.26)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tiny-keccak" ,rust-tiny-keccak-2)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/gakonst/ethers-rs")
    (synopsis "Ethereum data types, cryptography and utilities")
    (description
     "This package provides Ethereum data types, cryptography and utilities.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-worktree-state-0.11
  (package
    (name "rust-gix-worktree-state")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-worktree-state" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n2wv2fgdryxn1pa0rg2k43lqc7kpjx4665ihnj6f47mnl2n5v9r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-index" ,rust-gix-index-0.33)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.34)
                       ("rust-io-close" ,rust-io-close-0.3)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing setting the worktree to a particular
state")
    (description
     "This package provides a crate of the gitoxide project implementing setting the
worktree to a particular state.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-submodule-0.11
  (package
    (name "rust-gix-submodule")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-submodule" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b304hkx2r2b619n3lksvj08fkd7pdxzpr923dhvc55c4jcx874j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-config" ,rust-gix-config-0.37)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-refspec" ,rust-gix-refspec-0.23)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing git submodules")
    (description
     "This package provides a crate of the gitoxide project dealing git submodules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-status-0.10
  (package
    (name "rust-gix-status")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-status" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j5z44b80ybaxy34valibksasrd5gny52vqk9mahjf3ii7cp6hrg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-filetime" ,rust-filetime-0.2)
                       ("rust-gix-diff" ,rust-gix-diff-0.44)
                       ("rust-gix-dir" ,rust-gix-dir-0.5)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-index" ,rust-gix-index-0.33)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.34)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing with 'git status'-like functionality")
    (description
     "This package provides a crate of the gitoxide project dealing with git
status'-like functionality.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-revision-0.27
  (package
    (name "rust-gix-revision")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-revision" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kmd96vky58yf46g5nxqny8gl3df4447vb6x6w2lp30iq91kxc81"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing with finding names for revisions and
parsing specifications")
    (description
     "This package provides a crate of the gitoxide project dealing with finding names
for revisions and parsing specifications.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-refspec-0.23
  (package
    (name "rust-gix-refspec")
    (version "0.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-refspec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0drzc1p43mc8nprxlqm4s86y9b23rsz89dvqghgmsmb25v6zhs38"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-revision" ,rust-gix-revision-0.27)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project for parsing and representing refspecs")
    (description
     "This package provides a crate of the gitoxide project for parsing and
representing refspecs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-packetline-0.17
  (package
    (name "rust-gix-packetline")
    (version "0.17.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-packetline" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jay9kgy8fgc809xcipgwhz430a4pyywhcb7c0n25yp2bx6yyhwc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-faster-hex" ,rust-faster-hex-0.9)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing the pkt-line serialization format")
    (description
     "This package provides a crate of the gitoxide project implementing the pkt-line
serialization format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-transport-0.42
  (package
    (name "rust-gix-transport")
    (version "0.42.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-transport" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07s8lsq97r0hgg9znd2f0jaj49prm2bss9mjjxfs2h8vn35cq7a2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-curl" ,rust-curl-0.4)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-credentials" ,rust-gix-credentials-0.24)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-packetline" ,rust-gix-packetline-0.17)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-reqwest" ,rust-reqwest-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dedicated to implementing the git transport layer")
    (description
     "This package provides a crate of the gitoxide project dedicated to implementing
the git transport layer.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-protocol-0.45
  (package
    (name "rust-gix-protocol")
    (version "0.45.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-protocol" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gjf2s9ssch79jfyv7bpa8pxwgdqks6940x04bpfzd81dw0a2hyc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-gix-credentials" ,rust-gix-credentials-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.9)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-transport" ,rust-gix-transport-0.42)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-maybe-async" ,rust-maybe-async-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project for implementing git protocols")
    (description
     "This package provides a crate of the gitoxide project for implementing git
protocols.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-pack-0.51
  (package
    (name "rust-gix-pack")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-pack" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0aajbwpmfzg7a33yzqfjz2rmczvbask13hd19gwmvrgz3x4r819y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clru" ,rust-clru-0.6)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-chunk" ,rust-gix-chunk-0.4)
                       ("rust-gix-diff" ,rust-gix-diff-0.44)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-14)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.39)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-uluru" ,rust-uluru-3))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Implements git packs and related data structures")
    (description
     "This package implements git packs and related data structures.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-odb-0.61
  (package
    (name "rust-gix-odb")
    (version "0.61.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-odb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16xwwfjna9m3rd66hkhcyps6s3bq23r5wpbxpfixi4qxakz89lr0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arc-swap" ,rust-arc-swap-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-pack" ,rust-gix-pack-0.51)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Implements various git object databases")
    (description "This package implements various git object databases.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-negotiate-0.13
  (package
    (name "rust-gix-negotiate")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-negotiate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0962x6gxhwp55kyr26hzsswv8qbg9h1f16x8kd8n7fq7cgxpkj4y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing negotiation algorithms")
    (description
     "This package provides a crate of the gitoxide project implementing negotiation
algorithms.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-derive-1
  (package
    (name "rust-serde-derive")
    (version "1.0.209")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w114ksg1ymnmqdisd0g1j3g8jgz6pam45xg6yb47dfpkybip0x5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://serde.rs")
    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "This package provides Macros 1.1 implementation of #[derive(Serialize,
Deserialize)].")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-1
  (package
    (name "rust-serde")
    (version "1.0.209")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "029yqqbb3c8v3gc720fhxn49dhgvb88zbyprdg5621riwzzy1z4r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-derive" ,rust-serde-derive-1))))
    (home-page "https://serde.rs")
    (synopsis "generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jiff-tzdb-platform-0.1
  (package
    (name "rust-jiff-tzdb-platform")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jiff-tzdb-platform" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h396fsksidvhiwsc9aihrywbybd9lcjq4ic9jambwzabxykinpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jiff-tzdb" ,rust-jiff-tzdb-0.1))))
    (home-page
     "https://github.com/BurntSushi/jiff/tree/master/jiff-tzdb-platform")
    (synopsis
     "The entire Time Zone Database embedded into your binary for specific platforms.")
    (description
     "This package provides The entire Time Zone Database embedded into your binary
for specific platforms.")
    (license (list license:unlicense license:expat))))

(define-public rust-jiff-tzdb-0.1
  (package
    (name "rust-jiff-tzdb")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jiff-tzdb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rmbi5l6ssz6wfbdf5v06sgm8kkfw2vnray2lcc0y76znclc7yh5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/BurntSushi/jiff/tree/master/jiff-tzdb")
    (synopsis "The entire Time Zone Database embedded into your binary")
    (description
     "This package provides The entire Time Zone Database embedded into your binary.")
    (license (list license:unlicense license:expat))))

(define-public rust-jiff-0.1
  (package
    (name "rust-jiff")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jiff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16rsbjj433av3gqck20d9v5115f6ylasnm82sza00yd4dl952xj3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jiff-tzdb" ,rust-jiff-tzdb-0.1)
                       ("rust-jiff-tzdb-platform" ,rust-jiff-tzdb-platform-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/BurntSushi/jiff")
    (synopsis
     "date-time library that encourages you to jump into the pit of success.

This library is heavily inspired by the Temporal project.")
    (description
     "This package provides a date-time library that encourages you to jump into the
pit of success.  This library is heavily inspired by the Temporal project.")
    (license (list license:unlicense license:expat))))

(define-public rust-gix-date-0.9
  (package
    (name "rust-gix-date")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-date" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19f8qg9rcnis0r1iyvrjwhydnppzq44vk2xvlvvxls0yy1x4pj1m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-jiff" ,rust-jiff-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project parsing dates the way git does")
    (description
     "This package provides a crate of the gitoxide project parsing dates the way git
does.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-actor-0.31.6-yanked
  (package
    (name "rust-gix-actor")
    (version "0.31.6") ; This version was yanked!
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-actor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zihc4k49hgqnp22j763a38qwpf6px7x4z9q60qd3w61dvqmirnb"))))
    (properties '((crate-version-yanked? . #t)))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-date" ,rust-gix-date-0.9)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "way to identify git actors")
    (description "This package provides a way to identify git actors.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-mailmap-0.23
  (package
    (name "rust-gix-mailmap")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-mailmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jbz4nb3cixg3dxazln4i7sp7wyypsv3zac0wi0rhz5cnbcfgjhw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31.6-yanked)
                       ("rust-gix-date" ,rust-gix-date-0.9)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project for parsing mailmap files")
    (description
     "This package provides a crate of the gitoxide project for parsing mailmap files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-macros-0.1
  (package
    (name "rust-gix-macros")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05ycxnh5sxjsn4lvay309n6knr8ksvkb6zx6f50ik24zc4iyk74r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Proc-macro utilities for gix")
    (description "This package provides Proc-macro utilities for gix.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-pathspec-0.7
  (package
    (name "rust-gix-pathspec")
    (version "0.7.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-pathspec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ssw9k2kq7hcn5xn9nby4gvq2628clxapf331r6l3d1jjlivy8sx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing magical pathspecs")
    (description
     "This package provides a crate of the gitoxide project dealing magical pathspecs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-discover-0.32
  (package
    (name "rust-gix-discover")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-discover" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1grxby9mj5c9bs305wrf70x0rsdpq25nc00csm86p9ixnscwc9zw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-dunce" ,rust-dunce-1)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-ref" ,rust-gix-ref-0.44)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "Discover git repositories and check if a directory is a git repository")
    (description
     "This package provides Discover git repositories and check if a directory is a
git repository.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-dir-0.5
  (package
    (name "rust-gix-dir")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-dir" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x29x6qdj4nwma01qgqadi0dwix3rnv0mlj1wnmn7gasaj69zjb0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-discover" ,rust-gix-discover-0.32)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-ignore" ,rust-gix-ignore-0.11)
                       ("rust-gix-index" ,rust-gix-index-0.33)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.34)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing with directory walks")
    (description
     "This package provides a crate of the gitoxide project dealing with directory
walks.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-index-0.33
  (package
    (name "rust-gix-index")
    (version "0.33.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-index" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gyply1fzp0wbl8jvckiw4hyv34na7lq0jd4z14bp15xapml96ls"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-filetime" ,rust-filetime-0.2)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-gix-bitmap" ,rust-gix-bitmap-0.2)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-lock" ,rust-gix-lock-14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.39)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "work-in-progress crate of the gitoxide project dedicated implementing the git
index file")
    (description
     "This package provides a work-in-progress crate of the gitoxide project dedicated
implementing the git index file.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-ignore-0.11
  (package
    (name "rust-gix-ignore")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-ignore" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dzs6zlwj8105ynmbiszf319i7x3a3lpav0gda8gaq44b6bcsiz4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-unicode-bom" ,rust-unicode-bom-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing .gitignore files")
    (description
     "This package provides a crate of the gitoxide project dealing .gitignore files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-worktree-0.34
  (package
    (name "rust-gix-worktree")
    (version "0.34.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-worktree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19p7xzrl1i4jw2fhzywqkfd00dn58k9nksll0qi7548bprp35xr6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-ignore" ,rust-gix-ignore-0.11)
                       ("rust-gix-index" ,rust-gix-index-0.33)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project for shared worktree related types and utilities.")
    (description
     "This package provides a crate of the gitoxide project for shared worktree
related types and utilities.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-diff-0.44
  (package
    (name "rust-gix-diff")
    (version "0.44.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-diff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17bci0q2d4bhm6g1gx6ibzbxjj6ykxy6303x8q4rgd85lg4db5hr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-14)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.34)
                       ("rust-imara-diff" ,rust-imara-diff-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Calculate differences between various git objects")
    (description
     "This package provides Calculate differences between various git objects.")
    (license (list license:expat license:asl2.0))))

(define-public rust-url-2
  (package
    (name "rust-url")
    (version "2.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "url" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v2dx50mx7xzl9454cl5qmpjnhkbahmn59gd3apyipbgyyylsy12"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-form-urlencoded" ,rust-form-urlencoded-1)
                       ("rust-idna" ,rust-idna-0.5)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis "URL library for Rust, based on the WHATWG URL Standard")
    (description
     "This package provides URL library for Rust, based on the WHATWG URL Standard.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-url-0.27
  (package
    (name "rust-gix-url")
    (version "0.27.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-url" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "128c2rp6780qspiqasmyd6a3gdmcmq6kl19axllf28pvhig0qa7x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-home" ,rust-home-0.5)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project implementing parsing and serialization of gix-url")
    (description
     "This package provides a crate of the gitoxide project implementing parsing and
serialization of gix-url.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-sec-0.10
  (package
    (name "rust-gix-sec")
    (version "0.10.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-sec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pvs9viknryhjgi67y8dcp16s9wb79fsnvr7wpnbndx760pxbr0g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project providing a shared trust model")
    (description
     "This package provides a crate of the gitoxide project providing a shared trust
model.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-prompt-0.8
  (package
    (name "rust-gix-prompt")
    (version "0.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-prompt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cg6dw1an3bxwsz43gwwlg9riydwv62k6afivbc30sxlrmjyizbl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project for handling prompts in the terminal")
    (description
     "This package provides a crate of the gitoxide project for handling prompts in
the terminal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-config-value-0.14
  (package
    (name "rust-gix-config-value")
    (version "0.14.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-config-value" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "133gpqyrg22c2kxsiv4ncp0rwwyxzkbq63y6xaccbpm0z9ln3xq3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project providing git-config value parsing")
    (description
     "This package provides a crate of the gitoxide project providing git-config value
parsing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-credentials-0.24
  (package
    (name "rust-gix-credentials")
    (version "0.24.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-credentials" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y6f5g8ny3rh80vw12qxzzvisw6588yll71hmvqq51wn0p9r3qwc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-prompt" ,rust-gix-prompt-0.8)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project to interact with git credentials helpers")
    (description
     "This package provides a crate of the gitoxide project to interact with git
credentials helpers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-typesize-derive-0.1
  (package
    (name "rust-typesize-derive")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typesize-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1a0ypva9lwmyfgvng2iq87j2gw2ishhm2jbysmmnh9yclk18hplh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/GnomedDev/typesize")
    (synopsis "Internal proc-macro crate for typesize")
    (description
     "This package provides Internal proc-macro crate for typesize.")
    (license license:expat)))

(define-public rust-nonmax-0.5
  (package
    (name "rust-nonmax")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nonmax" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lfvyfz4falgmc9g1cbfi2wkys9wka2nfmdyga87zikf636ml2k1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/LPGhatguy/nonmax")
    (synopsis "Numeric types that cannot hold maximum values")
    (description
     "This package provides Numeric types that cannot hold maximum values.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tagptr-0.2
  (package
    (name "rust-tagptr")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tagptr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05r4mwvlsclx1ayj65hpzjv3dn4wpi8j4xm695vydccf9k7r683v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/oliver-giersch/tagptr.git")
    (synopsis "Strongly typed atomic and non-atomic tagged pointers")
    (description
     "This package provides Strongly typed atomic and non-atomic tagged pointers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mini-moka-0.10
  (package
    (name "rust-mini-moka")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mini-moka" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00yqhslppnrl2a54rrrp03xb65d2knbb1s5yvs3g6qgjcnmxy9f3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-dashmap" ,rust-dashmap-5)
                       ("rust-skeptic" ,rust-skeptic-0.13)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-tagptr" ,rust-tagptr-0.2)
                       ("rust-triomphe" ,rust-triomphe-0.1))))
    (home-page "https://github.com/moka-rs/mini-moka")
    (synopsis "lighter edition of Moka, a fast and concurrent cache library")
    (description
     "This package provides a lighter edition of Moka, a fast and concurrent cache
library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gat-lending-iterator-0.1
  (package
    (name "rust-gat-lending-iterator")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gat-lending-iterator" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1agx13403m08gk13sv8qhy9m4na97bm3lgpa1m0bdmdayawpncj2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Crazytieguy/gat-lending-iterator")
    (synopsis
     "library for iterators who's items can [mutably] reference the iterator.")
    (description
     "This package provides a library for iterators who's items can [mutably]
reference the iterator.")
    (license license:expat)))

(define-public rust-extract-map-0.1
  (package
    (name "rust-extract-map")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "extract_map" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0s695n5yzs7wwyvaphkkscr8lfv7h94xsczg49a9qa37nnd51xxb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gat-lending-iterator" ,rust-gat-lending-iterator-0.1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/GnomedDev/extract_map")
    (synopsis
     "HashMap for memory efficent storage of value types which contain their own keys.")
    (description
     "This package provides a @code{HashMap} for memory efficent storage of value
types which contain their own keys.")
    (license license:expat)))

(define-public rust-typesize-0.1
  (package
    (name "rust-typesize")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typesize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gxl12ss3fra37gp973r4faiwa271lwcd2iwpzx3bpsh1x0kfqb6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-dashmap" ,rust-dashmap-5)
                       ("rust-extract-map" ,rust-extract-map-0.1)
                       ("rust-halfbrown" ,rust-halfbrown-0.2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-mini-moka" ,rust-mini-moka-0.10)
                       ("rust-nonmax" ,rust-nonmax-0.5)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-secrecy" ,rust-secrecy-0.8)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-simd-json" ,rust-simd-json-0.13)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-typesize-derive" ,rust-typesize-derive-0.1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/GnomedDev/typesize")
    (synopsis
     "library to fetch an accurate estimate of the total memory usage of a value.")
    (description
     "This package provides a library to fetch an accurate estimate of the total
memory usage of a value.")
    (license license:expat)))

(define-public rust-dashmap-6
  (package
    (name "rust-dashmap")
    (version "6.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dashmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kvnw859xvrqyd1lk89na6797yvl5bri4wi9j0viz2a4j54wqhah"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-lock-api" ,rust-lock-api-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot-core" ,rust-parking-lot-core-0.9)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-typesize" ,rust-typesize-0.1))))
    (home-page "https://github.com/xacrimon/dashmap")
    (synopsis "Blazing fast concurrent HashMap for Rust")
    (description
     "This package provides Blazing fast concurrent @code{HashMap} for Rust.")
    (license license:expat)))

(define-public rust-gix-tempfile-14
  (package
    (name "rust-gix-tempfile")
    (version "14.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-tempfile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ah8y51fbx6x9m71ihxk3zhny0c05kka5kd0a2hida4zjqkljsq4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dashmap" ,rust-dashmap-6)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-signal-hook-registry" ,rust-signal-hook-registry-1)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "tempfile implementation with a global registry to assure cleanup")
    (description
     "This package provides a tempfile implementation with a global registry to assure
cleanup.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-lock-14
  (package
    (name "rust-gix-lock")
    (version "14.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-lock" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17g1sknpvjqaq2s29c693mbmkp8sign0174qfi3n3x7ijzi7zg73"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-tempfile" ,rust-gix-tempfile-14)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "git-style lock-file implementation")
    (description "This package provides a git-style lock-file implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-ref-0.44
  (package
    (name "rust-gix-ref")
    (version "0.44.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-ref" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0biy3y7src1wsx5prynvyg7wzyzf3ss8f6hyphpb5ijvgscs551k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-lock" ,rust-gix-lock-14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-14)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate to handle git references")
    (description "This package provides a crate to handle git references.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-config-0.37
  (package
    (name "rust-gix-config")
    (version "0.37.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-config" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h680yjj90hqch8x2bgnybx01smff2yvcrja6n7dj4byjm1gxyjk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-config-value" ,rust-gix-config-value-0.14)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-ref" ,rust-gix-ref-0.44)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-bom" ,rust-unicode-bom-2)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "git-config file parser and editor from the gitoxide project")
    (description
     "This package provides a git-config file parser and editor from the gitoxide
project.")
    (license (list license:expat license:asl2.0))))

(define-public rust-zstd-safe-7
  (package
    (name "rust-zstd-safe")
    (version "7.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zstd-safe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nch85m5cr493y26yvndm6a8j6sd9mxpr2awrim3dslcnr6sp8sl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zstd-sys" ,rust-zstd-sys-2))))
    (home-page "https://github.com/gyscos/zstd-rs")
    (synopsis "Safe low-level bindings for the zstd compression library")
    (description
     "This package provides Safe low-level bindings for the zstd compression library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-zstd-0.13
  (package
    (name "rust-zstd")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ygkr6wspm9clbp7ykyl0rv69cfsf9q4lic9wcqiwn34lrwbgwpw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zstd-safe" ,rust-zstd-safe-7))))
    (home-page "https://github.com/gyscos/zstd-rs")
    (synopsis "Binding for the zstd compression library")
    (description
     "This package provides Binding for the zstd compression library.")
    (license license:expat)))

(define-public rust-lockfree-object-pool-0.1
  (package
    (name "rust-lockfree-object-pool")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lockfree-object-pool" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bjm2g1g1avab86r02jb65iyd7hdi35khn1y81z4nba0511fyx4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/EVaillant/lockfree-object-pool")
    (synopsis
     "thread-safe object pool collection with automatic return and attach/detach
semantics.")
    (description
     "This package provides a thread-safe object pool collection with automatic return
and attach/detach semantics.")
    (license license:boost1.0)))

(define-public rust-zopfli-0.8
  (package
    (name "rust-zopfli")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zopfli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ip9azz9ldk19m0m1hdppz3n5zcz0cywbg1vx59g4p5c3cwry0g5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-lockfree-object-pool" ,rust-lockfree-object-pool-0.1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-simd-adler32" ,rust-simd-adler32-0.3))))
    (home-page "https://github.com/zopfli-rs/zopfli")
    (synopsis "Rust implementation of the Zopfli compression algorithm.")
    (description
     "This package provides a Rust implementation of the Zopfli compression algorithm.")
    (license license:asl2.0)))

(define-public rust-time-macros-0.2
  (package
    (name "rust-time-macros")
    (version "0.2.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "time-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kqwxvfh2jkpg38fy673d6danh1bhcmmbsmffww3mphgail2l99z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-conv" ,rust-num-conv-0.1)
                       ("rust-time-core" ,rust-time-core-0.1))))
    (home-page "https://github.com/time-rs/time")
    (synopsis
     "Procedural macros for the time crate.
    This crate is an implementation detail and should not be relied upon directly.")
    (description
     "This package provides Procedural macros for the time crate.  This crate is an
implementation detail
and should not be relied upon directly.")
    (license (list license:expat license:asl2.0))))

(define-public rust-time-0.3
  (package
    (name "rust-time")
    (version "0.3.36")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "time" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11g8hdpahgrf1wwl2rpsg5nxq3aj7ri6xr672v4qcij6cgjqizax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-deranged" ,rust-deranged-0.3)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-num-conv" ,rust-num-conv-0.1)
                       ("rust-num-threads" ,rust-num-threads-0.1)
                       ("rust-powerfmt" ,rust-powerfmt-0.2)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-time-core" ,rust-time-core-0.1)
                       ("rust-time-macros" ,rust-time-macros-0.2))))
    (home-page "https://time-rs.github.io")
    (synopsis
     "Date and time library. Fully interoperable with the standard library. Mostly
compatible with #![no_std]")
    (description
     "This package provides Date and time library.  Fully interoperable with the
standard library.  Mostly
compatible with #![no_std].")
    (license (list license:expat license:asl2.0))))

(define-public rust-memchr-2
  (package
    (name "rust-memchr")
    (version "2.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memchr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18z32bhxrax0fnjikv475z7ii718hq457qwmaryixfxsl2qrmjkq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/BurntSushi/memchr")
    (synopsis
     "Provides extremely fast (uses SIMD on x86_64, aarch64 and wasm32) routines for
1, 2 or 3 byte search and single substring search.")
    (description
     "This package provides extremely fast (uses SIMD on x86_64, aarch64 and wasm32)
routines for 1, 2 or 3 byte search and single substring search.")
    (license (list license:unlicense license:expat))))

(define-public rust-lzma-rs-0.3
  (package
    (name "rust-lzma-rs")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lzma-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0phif4pnjrn28zcxgz3a7z86hhx5gdajmkrndfw4vrkahd682zi9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-crc" ,rust-crc-3)
                       ("rust-env-logger" ,rust-env-logger-0.9)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/gendx/lzma-rs")
    (synopsis "codec for LZMA, LZMA2 and XZ written in pure Rust")
    (description
     "This package provides a codec for LZMA, LZMA2 and XZ written in pure Rust.")
    (license license:expat)))

(define-public rust-adler2-2
  (package
    (name "rust-adler2")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "adler2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09r6drylvgy8vv8k20lnbvwq8gp09h7smfn6h1rxsy15pgh629si"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/oyvindln/adler2")
    (synopsis "simple clean-room implementation of the Adler-32 checksum")
    (description
     "This package provides a simple clean-room implementation of the Adler-32
checksum.")
    (license (list license:bsd-0 license:expat license:asl2.0))))

(define-public rust-miniz-oxide-0.8
  (package
    (name "rust-miniz-oxide")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wadxkg6a6z4lr7kskapj5d8pxlx7cp1ifw4daqnkzqjxych5n72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-adler2" ,rust-adler2-2)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-simd-adler32" ,rust-simd-adler32-0.3))))
    (home-page "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
    (synopsis
     "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (description
     "This package provides DEFLATE compression and decompression library rewritten in
Rust based on miniz.")
    (license (list license:expat license:zlib license:asl2.0))))

(define-public rust-libz-rs-sys-0.2
  (package
    (name "rust-libz-rs-sys")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libz-rs-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rqvcv0g9digivmh2pm9x01z2vyzpkma4rr4wwahxv9r436k3hky"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zlib-rs" ,rust-zlib-rs-0.2))))
    (home-page "https://github.com/memorysafety/zlib-rs")
    (synopsis "memory-safe zlib implementation written in rust")
    (description
     "This package provides a memory-safe zlib implementation written in rust.")
    (license license:zlib)))

(define-public rust-libz-ng-sys-1
  (package
    (name "rust-libz-ng-sys")
    (version "1.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libz-ng-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0f54ffm7bzqdvmcxkv2as6ir9bgzhkaq0g1jgwkz2mns04d7adj4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cmake" ,rust-cmake-0.1)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/rust-lang/libz-sys")
    (synopsis
     "Low-level bindings to zlib-ng (libz-ng), a high-performance zlib library")
    (description
     "This package provides Low-level bindings to zlib-ng (libz-ng), a
high-performance zlib library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-flate2-1
  (package
    (name "rust-flate2")
    (version "1.0.33")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flate2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lzj9cmr1pcwrgr4nnxjihnksqhxmygcqqdqcjnhbvslh3k1njij"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cloudflare-zlib-sys" ,rust-cloudflare-zlib-sys-0.3)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-libz-ng-sys" ,rust-libz-ng-sys-1)
                       ("rust-libz-rs-sys" ,rust-libz-rs-sys-0.2)
                       ("rust-libz-sys" ,rust-libz-sys-1)
                       ("rust-miniz-oxide" ,rust-miniz-oxide-0.8))))
    (home-page "https://github.com/rust-lang/flate2-rs")
    (synopsis
     "DEFLATE compression and decompression exposed as Read/BufRead/Write streams.
Supports miniz_oxide and multiple zlib implementations. Supports zlib, gzip,
and raw deflate streams.")
    (description
     "This package provides DEFLATE compression and decompression exposed as
Read/@code{BufRead/Write}
streams.  Supports miniz_oxide and multiple zlib implementations.  Supports
zlib, gzip, and raw deflate streams.")
    (license (list license:expat license:asl2.0))))

(define-public rust-displaydoc-0.2
  (package
    (name "rust-displaydoc")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "displaydoc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/yaahc/displaydoc")
    (synopsis
     "derive macro for implementing the display Trait via a doc comment and string
interpolation")
    (description
     "This package provides a derive macro for implementing the display Trait via a
doc comment and string interpolation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-deflate64-0.1
  (package
    (name "rust-deflate64")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deflate64" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06scix17pa7wzzfsnhkycpcc6s04shs49cdaxx2k1sl0226jnsfs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/anatawa12/deflate64-rs#readme")
    (synopsis "Deflate64 implementation based on .NET's implementation")
    (description
     "This package provides Deflate64 implementation based on .NET's implementation.")
    (license license:expat)))

(define-public rust-crossbeam-utils-0.8
  (package
    (name "rust-crossbeam-utils")
    (version "0.8.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "100fksq5mm1n7zj242cclkw6yf7a4a8ix3lvpfkhxvdhbda9kv12"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-loom" ,rust-loom-0.7))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-utils")
    (synopsis "Utilities for concurrent programming")
    (description "This package provides Utilities for concurrent programming.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crc32fast-1
  (package
    (name "rust-crc32fast")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crc32fast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1czp7vif73b8xslr3c9yxysmh9ws2r8824qda7j47ffs9pcnjxx9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/srijs/rust-crc32fast")
    (synopsis "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation")
    (description
     "This package provides Fast, SIMD-accelerated CRC32 (IEEE) checksum computation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-chrono-0.4
  (package
    (name "rust-chrono")
    (version "0.4.38")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chrono" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "009l8vc5p8750vn02z30mblg4pv2qhkbfizhfwmzc6vpy5nr67x2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-android-tzdata" ,rust-android-tzdata-0.1)
                       ("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-iana-time-zone" ,rust-iana-time-zone-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-pure-rust-locales" ,rust-pure-rust-locales-0.8)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/chronotope/chrono")
    (synopsis "Date and time library for Rust")
    (description "This package provides Date and time library for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-zip-2
  (package
    (name "rust-zip")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zip" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "151lrzswjkhwzlr6dkmgbi4s51sa8dr496n6mwiswms0xa444pnw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aes" ,rust-aes-0.8)
                       ("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-bzip2" ,rust-bzip2-0.4)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-constant-time-eq" ,rust-constant-time-eq-0.3)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-deflate64" ,rust-deflate64-0.1)
                       ("rust-displaydoc" ,rust-displaydoc-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-lzma-rs" ,rust-lzma-rs-0.3)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-zeroize" ,rust-zeroize-1)
                       ("rust-zopfli" ,rust-zopfli-0.8)
                       ("rust-zstd" ,rust-zstd-0.13))))
    (home-page "https://github.com/zip-rs/zip2.git")
    (synopsis "Library to support the reading and writing of zip files.")
    (description
     "This package provides Library to support the reading and writing of zip files.")
    (license license:expat)))

(define-public rust-gix-revwalk-0.13
  (package
    (name "rust-gix-revwalk")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-revwalk" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q23mcf4ji5q8qi3g86vxxgz4x4ykgqja0kyacgi9bvimg50q0qv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate providing utilities for walking the revision graph")
    (description
     "This package provides a crate providing utilities for walking the revision
graph.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-commitgraph-0.24
  (package
    (name "rust-gix-commitgraph")
    (version "0.24.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-commitgraph" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y7wc0y0xb0kh3c22pj3ns04zdqglqb22gj71kn3cn2ngzv0cfqk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-chunk" ,rust-gix-chunk-0.4)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Read-only access to the git commitgraph file format")
    (description
     "This package provides Read-only access to the git commitgraph file format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-traverse-0.39
  (package
    (name "rust-gix-traverse")
    (version "0.39.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-traverse" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h48bbjym6fkdhy9q7p8v6rn9ksvkwxp8fs1415cyw8ya66a36g4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project")
    (description "This package provides a crate of the gitoxide project.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fastrand-2
  (package
    (name "rust-fastrand")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fastrand" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19nyzdq3ha4g173364y2wijmd6jlyms8qx40daqkxsnl458jmh78"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-getrandom" ,rust-getrandom-0.2))))
    (home-page "https://github.com/smol-rs/fastrand")
    (synopsis "simple and fast random number generator")
    (description
     "This package provides a simple and fast random number generator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-gix-fs-0.11
  (package
    (name "rust-gix-fs")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-fs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xc5z6w5s9rr0rgf7aab8hqg0dnblhk543crw30d19pykhjfdgzj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fastrand" ,rust-fastrand-2)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate providing file system specific utilities to `gitoxide`")
    (description
     "This package provides a crate providing file system specific utilities to
`gitoxide`.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-utils-0.1
  (package
    (name "rust-gix-utils")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1p6lschmdrg1j9cd3rm6q96dyrvivzi2305d7ck1588gzpvjs69m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-fastrand" ,rust-fastrand-2)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate with `gitoxide` utilities that don't need feature toggles")
    (description
     "This package provides a crate with `gitoxide` utilities that don't need feature
toggles.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-trace-0.1
  (package
    (name "rust-gix-trace")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-trace" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zhm2lwqr070rq3bdn4b1zjs7mn7bhlkfgwfap6xspwi11s2c97r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-document-features" ,rust-document-features-0.2)
                       ("rust-tracing-core" ,rust-tracing-core-0.1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate to provide minimal `tracing` support that can be turned off to zero cost")
    (description
     "This package provides a crate to provide minimal `tracing` support that can be
turned off to zero cost.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-packetline-blocking-0.17
  (package
    (name "rust-gix-packetline-blocking")
    (version "0.17.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-packetline-blocking" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h3bansw7mp2p6id78lwlrs4pm8nclmql07qbxpxv657p822705r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-faster-hex" ,rust-faster-hex-0.9)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "duplicate of `gix-packetline` with the `blocking-io` feature pre-selected")
    (description
     "This package provides a duplicate of `gix-packetline` with the `blocking-io`
feature pre-selected.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-command-0.3
  (package
    (name "rust-gix-command")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-command" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rwjxaw0lyiipr8f879i39amdzd3dh006267hs9g1g3bnf9fdwnz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-shell-words" ,rust-shell-words-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project handling internal git command execution")
    (description
     "This package provides a crate of the gitoxide project handling internal git
command execution.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-filter-0.11
  (package
    (name "rust-gix-filter")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-filter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06m6ph3b67696ckq5gfn9pwm77sh507km7sfzx6my9r8v8w7fm76"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-packetline-blocking" ,rust-gix-packetline-blocking-0.17)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project implementing git filters")
    (description
     "This package provides a crate of the gitoxide project implementing git filters.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-glob-0.16
  (package
    (name "rust-gix-glob")
    (version "0.16.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-glob" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04gijbam0k2vdshm2m0d6hg0hvv7ky4dgr9p4y2l02hapi5qp43l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing with pattern matching")
    (description
     "This package provides a crate of the gitoxide project dealing with pattern
matching.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-attributes-0.22
  (package
    (name "rust-gix-attributes")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-attributes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "048k2c9kgh6bv7d1d2iyca8cmvb9mw090jjnab9kv5sam8jvzk7b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-quote" ,rust-gix-quote-0.4)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-kstring" ,rust-kstring-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-bom" ,rust-unicode-bom-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project dealing .gitattributes files")
    (description
     "This package provides a crate of the gitoxide project dealing .gitattributes
files.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-worktree-stream-0.13
  (package
    (name "rust-gix-worktree-stream")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-worktree-stream" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08gd3fca4jjaygsawpm7s6f3p7rvb3br87ap8ipqahcs4jb4hpg3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.39)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "generate a byte-stream from a git-tree")
    (description
     "This package provides generate a byte-stream from a git-tree.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-path-0.10
  (package
    (name "rust-gix-path")
    (version "0.10.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-path" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "111ll2rh9610bmwq5k2ndjghwfw3pj08fa9mf6l2zyhj45rbim9q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-home" ,rust-home-0.5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate of the gitoxide project dealing paths and their conversions")
    (description
     "This package provides a crate of the gitoxide project dealing paths and their
conversions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-validate-0.8
  (package
    (name "rust-gix-validate")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-validate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kqad8a2wdz69ma7hspi21pazgpkrc5hg4iw37gsvca99b9pvhl2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Validation functions for various kinds of names in git")
    (description
     "This package provides Validation functions for various kinds of names in git.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-features-0.38
  (package
    (name "rust-gix-features")
    (version "0.38.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-features" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sfw6zs3qgmlqjkj4cvyfz6q6dgdlw1d16c7yckwgyg5kyn4aw5c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-bytesize" ,rust-bytesize-1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-jwalk" ,rust-jwalk-0.8)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-prodash" ,rust-prodash-28)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-sha1-smol" ,rust-sha1-smol-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "crate to integrate various capabilities using compile-time feature flags")
    (description
     "This package provides a crate to integrate various capabilities using
compile-time feature flags.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-object-0.42
  (package
    (name "rust-gix-object")
    (version "0.42.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11p3pynmriglj5j3hzh5qa4sz7pnhzxxzr1w85xzmhp7ni32zni5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis
     "Immutable and mutable git objects with decoding and encoding support")
    (description
     "This package provides Immutable and mutable git objects with decoding and
encoding support.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-archive-0.13
  (package
    (name "rust-gix-archive")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-archive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m4nwxcfrivnf74kx38sxgcalba8nbl2fq4xlvad28q2vzmvpdk3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-worktree-stream" ,rust-gix-worktree-stream-0.13)
                       ("rust-tar" ,rust-tar-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-zip" ,rust-zip-2))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "archive generation from of a worktree stream")
    (description
     "This package provides archive generation from of a worktree stream.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-date-0.8
  (package
    (name "rust-gix-date")
    (version "0.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-date" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h5qygjxr8p2g2vdrzpvx0plnyy9gsym29wjxc5fx48ly8qnkvcy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-time" ,rust-time-0.3))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "crate of the gitoxide project parsing dates the way git does")
    (description
     "This package provides a crate of the gitoxide project parsing dates the way git
does.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-actor-0.31
  (package
    (name "rust-gix-actor")
    (version "0.31.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix-actor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wm3i9g69hkfhwiw1c4z9fr1hkfxsfxyzdh07b637f1lgqsm9r50"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "way to identify git actors")
    (description "This package provides a way to identify git actors.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gix-0.63
  (package
    (name "rust-gix")
    (version "0.63.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01jbkflpr570inbdjv1xgfsimqf6xfrr0yg6mlv4aypsmlc50k4q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-gix-actor" ,rust-gix-actor-0.31)
                       ("rust-gix-archive" ,rust-gix-archive-0.13)
                       ("rust-gix-attributes" ,rust-gix-attributes-0.22)
                       ("rust-gix-command" ,rust-gix-command-0.3)
                       ("rust-gix-commitgraph" ,rust-gix-commitgraph-0.24)
                       ("rust-gix-config" ,rust-gix-config-0.37)
                       ("rust-gix-credentials" ,rust-gix-credentials-0.24)
                       ("rust-gix-date" ,rust-gix-date-0.8)
                       ("rust-gix-diff" ,rust-gix-diff-0.44)
                       ("rust-gix-dir" ,rust-gix-dir-0.5)
                       ("rust-gix-discover" ,rust-gix-discover-0.32)
                       ("rust-gix-features" ,rust-gix-features-0.38)
                       ("rust-gix-filter" ,rust-gix-filter-0.11)
                       ("rust-gix-fs" ,rust-gix-fs-0.11)
                       ("rust-gix-glob" ,rust-gix-glob-0.16)
                       ("rust-gix-hash" ,rust-gix-hash-0.14)
                       ("rust-gix-hashtable" ,rust-gix-hashtable-0.5)
                       ("rust-gix-ignore" ,rust-gix-ignore-0.11)
                       ("rust-gix-index" ,rust-gix-index-0.33)
                       ("rust-gix-lock" ,rust-gix-lock-14)
                       ("rust-gix-macros" ,rust-gix-macros-0.1)
                       ("rust-gix-mailmap" ,rust-gix-mailmap-0.23)
                       ("rust-gix-negotiate" ,rust-gix-negotiate-0.13)
                       ("rust-gix-object" ,rust-gix-object-0.42)
                       ("rust-gix-odb" ,rust-gix-odb-0.61)
                       ("rust-gix-pack" ,rust-gix-pack-0.51)
                       ("rust-gix-path" ,rust-gix-path-0.10)
                       ("rust-gix-pathspec" ,rust-gix-pathspec-0.7)
                       ("rust-gix-prompt" ,rust-gix-prompt-0.8)
                       ("rust-gix-protocol" ,rust-gix-protocol-0.45)
                       ("rust-gix-ref" ,rust-gix-ref-0.44)
                       ("rust-gix-refspec" ,rust-gix-refspec-0.23)
                       ("rust-gix-revision" ,rust-gix-revision-0.27)
                       ("rust-gix-revwalk" ,rust-gix-revwalk-0.13)
                       ("rust-gix-sec" ,rust-gix-sec-0.10)
                       ("rust-gix-status" ,rust-gix-status-0.10)
                       ("rust-gix-submodule" ,rust-gix-submodule-0.11)
                       ("rust-gix-tempfile" ,rust-gix-tempfile-14)
                       ("rust-gix-trace" ,rust-gix-trace-0.1)
                       ("rust-gix-transport" ,rust-gix-transport-0.42)
                       ("rust-gix-traverse" ,rust-gix-traverse-0.39)
                       ("rust-gix-url" ,rust-gix-url-0.27)
                       ("rust-gix-utils" ,rust-gix-utils-0.1)
                       ("rust-gix-validate" ,rust-gix-validate-0.8)
                       ("rust-gix-worktree" ,rust-gix-worktree-0.34)
                       ("rust-gix-worktree-state" ,rust-gix-worktree-state-0.11)
                       ("rust-gix-worktree-stream" ,rust-gix-worktree-stream-0.13)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-prodash" ,rust-prodash-28)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Byron/gitoxide")
    (synopsis "Interact with git repositories just like git would")
    (description
     "This package provides Interact with git repositories just like git would.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libgit2-sys-0.17
  (package
    (name "rust-libgit2-sys")
    (version "0.17.0+1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libgit2-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "093jxfl2i9vxdlgf7vk9d040sjwy0nq4fid640y7qix6m0k26iqh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libssh2-sys" ,rust-libssh2-sys-0.3)
                       ("rust-libz-sys" ,rust-libz-sys-1)
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Native bindings to the libgit2 library")
    (description
     "This package provides Native bindings to the libgit2 library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-git2-0.19
  (package
    (name "rust-git2")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "091pv7866z1qjq800ys0wjv8n73wrv7fqdrddxcnq36w8lzbf0xr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libgit2-sys" ,rust-libgit2-sys-0.17)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-openssl-probe" ,rust-openssl-probe-0.1)
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9)
                       ("rust-url" ,rust-url-2))))
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis
     "Bindings to libgit2 for interoperating with git repositories. This library is
both threadsafe and memory safe and allows both reading and writing git
repositories.")
    (description
     "This package provides Bindings to libgit2 for interoperating with git
repositories.  This library is both threadsafe and memory safe and allows both
reading and writing git repositories.")
    (license (list license:expat license:asl2.0))))

(define-public rust-vergen-8
  (package
    (name "rust-vergen")
    (version "8.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vergen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ri5n4k1g4z6gnllkjx9zny3vaa2bjma84zlrjh6w9k7b7mdk419"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cargo-metadata" ,rust-cargo-metadata-0.18)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-git2" ,rust-git2-0.19)
                       ("rust-gix" ,rust-gix-0.63)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-sysinfo" ,rust-sysinfo-0.30)
                       ("rust-time" ,rust-time-0.3))))
    (home-page "https://github.com/rustyhorde/vergen")
    (synopsis
     "Generate 'cargo:rustc-env' instructions via 'build.rs' for use in your code via
the 'env!' macro")
    (description
     "This package provides Generate cargo:rustc-env instructions via build.rs for use
in your code via the env! macro.")
    (license (list license:expat license:asl2.0))))

(define-public rust-uuid-macro-internal-1
  (package
    (name "rust-uuid-macro-internal")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid-macro-internal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0flsk6rxdif2hx5dirfwfn6r5vrp6my9zvnn43lw98iyz13d077f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis "Private implementation details of the uuid! macro")
    (description
     "This package provides Private implementation details of the uuid! macro.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-uuid-1
  (package
    (name "rust-uuid")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0503gvp08dh5mnm3f0ffqgisj6x3mbs53dmnn1lm19pga43a1pw1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-atomic" ,rust-atomic-0.6)
                       ("rust-borsh" ,rust-borsh-1)
                       ("rust-borsh-derive" ,rust-borsh-derive-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-md-5" ,rust-md-5-0.10)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha1-smol" ,rust-sha1-smol-1)
                       ("rust-slog" ,rust-slog-2)
                       ("rust-uuid-macro-internal" ,rust-uuid-macro-internal-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-zerocopy" ,rust-zerocopy-0.7))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis "library to generate and parse UUIDs.")
    (description
     "This package provides a library to generate and parse UUIDs.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-loki-api-0.1
  (package
    (name "rust-loki-api")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "loki-api" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16dkbvxzks37y0x07ibl0nlvwd37qlj1fc6lmb1qlnbkhalq6j37"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-prost" ,rust-prost-0.9)
                       ("rust-prost-types" ,rust-prost-types-0.10))))
    (home-page "https://github.com/hrxi/tracing-loki")
    (synopsis "Protobuf types used by the Grafana Loki HTTP API")
    (description
     "This package provides Protobuf types used by the Grafana Loki HTTP API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracing-loki-0.2
  (package
    (name "rust-tracing-loki")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-loki" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hsz78cigg02fbqa1fidz32l674k7lh7vvfkrikr5dp4kwzh59py"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-loki-api" ,rust-loki-api-0.1)
                       ("rust-reqwest" ,rust-reqwest-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-snap" ,rust-snap-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1)
                       ("rust-tracing-log" ,rust-tracing-log-0.1)
                       ("rust-tracing-serde" ,rust-tracing-serde-0.1)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/hrxi/tracing-loki")
    (synopsis "tracing layer for shipping logs to Grafana Loki")
    (description
     "This package provides a tracing layer for shipping logs to Grafana Loki.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracing-bunyan-formatter-0.3
  (package
    (name "rust-tracing-bunyan-formatter")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-bunyan-formatter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wvkxjw2n7g5prjp17i6j6adirj9958pibc50c7dzpl3mjwndhmm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-gethostname" ,rust-gethostname-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1)
                       ("rust-tracing-log" ,rust-tracing-log-0.1)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3)
                       ("rust-valuable" ,rust-valuable-0.1)
                       ("rust-valuable-serde" ,rust-valuable-serde-0.1))))
    (home-page "https://github.com/LukeMathWalker/tracing-bunyan-formatter")
    (synopsis "Bunyan formatter for the tracing crate")
    (description
     "This package provides a Bunyan formatter for the tracing crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tower-http-0.5
  (package
    (name "rust-tower-http")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xakj3x0anp55gjqibiwvzma5iz0w9pcjsr7qk97sx4qm4sd970y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-compression" ,rust-async-compression-0.4)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1)
                       ("rust-http-range-header" ,rust-http-range-header-0.4)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-iri-string" ,rust-iri-string-0.7)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-uuid" ,rust-uuid-1))))
    (home-page "https://github.com/tower-rs/tower-http")
    (synopsis "Tower middleware and utilities for HTTP clients and servers")
    (description
     "This package provides Tower middleware and utilities for HTTP clients and
servers.")
    (license license:expat)))

(define-public rust-eventsource-stream-0.2
  (package
    (name "rust-eventsource-stream")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "eventsource-stream" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1awhkl4xh9f66j9m770qvn2l74cr4l59ssqmv4lz99a7j9bg9zkl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
    (home-page "https://github.com/jpopesculian/eventsource-stream")
    (synopsis
     "basic building block for building an Eventsource from a Stream of bytes")
    (description
     "This package provides a basic building block for building an Eventsource from a
Stream of bytes.")
    (license (list license:expat license:asl2.0))))

(define-public rust-reqwest-eventsource-0.6
  (package
    (name "rust-reqwest-eventsource")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "reqwest-eventsource" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pkbxjk0vjdfialjm155q4nnmh87r507n3k4j5b2fi5vdms5ab33"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-eventsource-stream" ,rust-eventsource-stream-0.2)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-timer" ,rust-futures-timer-3)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-reqwest" ,rust-reqwest-0.12)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/jpopesculian/reqwest-eventsource")
    (synopsis "Helper to build an Eventsource using reqwest")
    (description
     "This package provides Helper to build an Eventsource using reqwest.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hostname-0.4
  (package
    (name "rust-hostname")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hostname" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fpjr3vgi64ly1ci8phdqjbha4k22c65c94a9drriiqnmk4cgizr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-windows" ,rust-windows-0.52))))
    (home-page "https://github.com/svartalf/hostname")
    (synopsis "Cross-platform system's host name functions")
    (description
     "This package provides Cross-platform system's host name functions.")
    (license license:expat)))

(define-public rust-winch-codegen-0.10
  (package
    (name "rust-winch-codegen")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winch-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "082sfb50q434l31z8bnpl5bnczf50x68wgy2ijmirsp307bga8lp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.99)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmparser" ,rust-wasmparser-0.110)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Winch code generation library")
    (description "This package provides Winch code generation library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-winch-12
  (package
    (name "rust-wasmtime-winch")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-winch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wgxg8scff62mblxkk92js6aaka8fwng8cnxqvgy8qqg82xvvpxw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.99)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-object" ,rust-object-0.31)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmparser" ,rust-wasmparser-0.110)
                       ("rust-wasmtime-cranelift-shared" ,rust-wasmtime-cranelift-shared-12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-12)
                       ("rust-winch-codegen" ,rust-winch-codegen-0.10))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Wasmtime and Winch")
    (description
     "This package provides Integration between Wasmtime and Winch.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-runtime-12
  (package
    (name "rust-wasmtime-runtime")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-runtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d3xg5y2d4bdlgg2qjs0k8r67b19zwd3jnj592i6rfz5ial8gdff"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mach" ,rust-mach-0.3)
                       ("rust-memfd" ,rust-memfd-0.6)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-sptr" ,rust-sptr-0.3)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.31)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-12)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-12)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-12)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-12)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-12)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Runtime library support for Wasmtime")
    (description "This package provides Runtime library support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-jit-icache-coherence-12
  (package
    (name "rust-wasmtime-jit-icache-coherence")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-icache-coherence" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qzfxws0d3ygib1yakfn9f6g3vas1gi6i4a1clsqf8cj82q997xm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Utilities for JIT icache maintenance")
    (description "This package provides Utilities for JIT icache maintenance.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-jit-debug-12
  (package
    (name "rust-wasmtime-jit-debug")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-debug" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cjvbwjc87g4wghsifzv15b7mwkyzqvh0mhm1l1qiy2fqfk7xwmf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.31)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT debug interfaces support for Wasmtime")
    (description
     "This package provides JIT debug interfaces support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-addr2line-0.20
  (package
    (name "rust-addr2line")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qv590hm40lz2q77p7s3lghaa5gdbrxcvpiaj1gf1z34ikhpiypl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-object" ,rust-object-0.31)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/gimli-rs/addr2line")
    (synopsis
     "cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust,
using `gimli`.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-jit-12
  (package
    (name "rust-wasmtime-jit")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b2v1xmvzc2bbk7byglwga9yy6bi8i1ka01854kxf8f3jarhdrnc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-addr2line" ,rust-addr2line-0.20)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.3)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-ittapi" ,rust-ittapi-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.31)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-12)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-12)
                       ("rust-wasmtime-jit-icache-coherence" ,rust-wasmtime-jit-icache-coherence-12)
                       ("rust-wasmtime-runtime" ,rust-wasmtime-runtime-12)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT-style execution for WebAsssembly code in Cranelift")
    (description
     "This package provides JIT-style execution for @code{WebAsssembly} code in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-asm-macros-12
  (package
    (name "rust-wasmtime-asm-macros")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-asm-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pa4dl1qs5pvmqa2j493856cyl0vv1wyxwi0w4b0081iv1l4zn4n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining asm functions in Wasmtime")
    (description
     "This package provides Macros for defining asm functions in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-fiber-12
  (package
    (name "rust-wasmtime-fiber")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-fiber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w1zdisb76bvf2rb6innddj4r1d47pgcq1k8l0z0fy9sq088937w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-12)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-12)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-12)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Fiber support for Wasmtime")
    (description "This package provides Fiber support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-versioned-export-macros-12
  (package
    (name "rust-wasmtime-versioned-export-macros")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-versioned-export-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0l2hz39zps5g06zaxlr3av8h82yifni0grimg28c8xg87sxzjyna"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining versioned exports in Wasmtime")
    (description
     "This package provides Macros for defining versioned exports in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-environ-12
  (package
    (name "rust-wasmtime-environ")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-environ" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1isfjs2ldy2nbb1mrzdwwsalip5rspqnpxz04pqry8h121xj5fg8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.99)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.31)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.31)
                       ("rust-wasmparser" ,rust-wasmparser-0.110)
                       ("rust-wasmprinter" ,rust-wasmprinter-0.2)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-12)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Standalone environment support for WebAssembly code in Cranelift")
    (description
     "This package provides Standalone environment support for @code{WebAssembly} code
in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cranelift-shared-12
  (package
    (name "rust-wasmtime-cranelift-shared")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d32l271lnyp9sq25kqpaw3da5w94l0q3n1l2r41q2ijz6cp1cc6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.99)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.99)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.99)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-object" ,rust-object-0.31)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Base-level integration with Wasmtime and Cranelift")
    (description
     "This package provides Base-level integration with Wasmtime and Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-types-12
  (package
    (name "rust-wasmtime-types")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ji4mf5vmlrzflkfmpzcfn2ziiaxj5l622wdir9l2qdlshlkg53p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.99)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.110))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WebAssembly type definitions for Cranelift")
    (description
     "This package provides @code{WebAssembly} type definitions for Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-wasm-0.99
  (package
    (name "rust-cranelift-wasm")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-wasm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xdnzqnqdb3vdzwcd3yr7jakcfql06iq7xin4hiisks2ig43b1hd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.99)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.99)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.99)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.110)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Translator from WebAssembly to Cranelift IR")
    (description
     "This package provides Translator from @code{WebAssembly} to Cranelift IR.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-native-0.99
  (package
    (name "rust-cranelift-native")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-native" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "180420mshsb4nvqqqps6z94v5jc5dab4kgk3msirc7lgl1nrdmcs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.99)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for targeting the host with Cranelift")
    (description
     "This package provides Support for targeting the host with Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-frontend-0.99
  (package
    (name "rust-cranelift-frontend")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-frontend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jj78cjsw6brs304m6p548rl5dwl0qrdbyas29z41dq8am64radp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.99)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-isle-0.99
  (package
    (name "rust-cranelift-isle")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-isle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01d5z8bik3p35h3x9ifmpsakv3rhv3cr2nv29nzddp25126qh7zg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language
for instruction selection in Cranelift")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A
domain-specific language for instruction selection in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-control-0.99
  (package
    (name "rust-cranelift-control")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-control" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wpgapvcrs5axz7q7w30v71f01x6jg0hs6l7q7gdykbj1yp8q40v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "White-box fuzz testing framework")
    (description "This package provides White-box fuzz testing framework.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-shared-0.99
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vyl5j6y95b1fy6mmndqzv9ww1mmarp299gcqifx4z4fn5d218c6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "This package provides For code shared between cranelift-codegen-meta and
cranelift-codegen.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-meta-0.99
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-meta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "069lpbc7nbvzfk99x4d13nh2nggdhc72qvgnxvbfc6gga4vvk1il"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.99))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-entity-0.99
  (package
    (name "rust-cranelift-entity")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-entity" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nf6qdkm57355ykgshm3dmaysblf2yl6mz2vcsc2fqj0c804813j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description
     "This package provides Data structures using entity references as mapping keys.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-bforest-0.99
  (package
    (name "rust-cranelift-bforest")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bforest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13xg3kv2ziw0l2gf7jsrqlg5pwkr44ggbcidfh42hxzvyv6a34as"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.99))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-0.99
  (package
    (name "rust-cranelift-codegen")
    (version "0.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "001dkk2h0xwdr7asf804grj0jmjirjsmnn7ws57zy6vrayjb378n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-capstone" ,rust-capstone-0.9)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.99)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.99)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.99)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.99)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.99)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.99)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "This package provides Low-level code generator library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cranelift-12
  (package
    (name "rust-wasmtime-cranelift")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06ndd6bi55d6vi02sbx00ddl80zs8czz705dn7k2pwj591xfvs4a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.99)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.99)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.99)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.99)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.99)
                       ("rust-cranelift-wasm" ,rust-cranelift-wasm-0.99)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.31)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.110)
                       ("rust-wasmtime-cranelift-shared" ,rust-wasmtime-cranelift-shared-12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-12)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Cranelift and Wasmtime")
    (description
     "This package provides Integration between Cranelift and Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-parser-0.9
  (package
    (name "rust-wit-parser")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "060kfybml9zqy43f3jb00f27jc76k5i2y7nsm59xwi758qhgl7jl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.9)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-url" ,rust-url-2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-parser")
    (synopsis
     "Tooling for parsing `*.wit` files and working with their contents.")
    (description
     "This package provides Tooling for parsing `*.wit` files and working with their contents.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-wit-bindgen-12
  (package
    (name "rust-wasmtime-wit-bindgen")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wit-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w9sc0lyyqdwpxyw6cs676qcpfn3gkwsx1wrvmnahszm4040sxql"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-wit-parser" ,rust-wit-parser-0.9))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Internal `*.wit` support for the `wasmtime` crate's macros")
    (description
     "This package provides Internal `*.wit` support for the `wasmtime` crate's macros.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-component-util-12
  (package
    (name "rust-wasmtime-component-util")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1869j8zz4k3c0sh8n3gl2pgmm4gjl0l1jq1r9v9dqly7b6y23x3l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Utility types and functions to support the component model in Wasmtime")
    (description
     "This package provides Utility types and functions to support the component model in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-component-macro-12
  (package
    (name "rust-wasmtime-component-macro")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h1yfqfym89kzypzbi1ai8wldica40kj02ac1j3qx0r3vaw0fzlf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-12)
                       ("rust-wasmtime-wit-bindgen" ,rust-wasmtime-wit-bindgen-12)
                       ("rust-wit-parser" ,rust-wit-parser-0.9))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for deriving component interface types from Rust types")
    (description
     "This package provides Macros for deriving component interface types from Rust types.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-file-per-thread-logger-0.2
  (package
    (name "rust-file-per-thread-logger")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "file-per-thread-logger" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ww3yqf7mdpdwb9b75rcbmxw3zg6wnny9jn8604sz2dg6cfc4g4a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/bnjbvr/file-per-thread-logger")
    (synopsis "logging implementation that writes logs in one file per thread")
    (description
     "This package provides a logging implementation that writes logs in one file per
thread.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cache-12
  (package
    (name "rust-wasmtime-cache")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cache" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08vhin6kbwdmhrf75birxjmg8sql06bbqh39d51c1lw6maxiymii"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-directories-next" ,rust-directories-next-2)
                       ("rust-file-per-thread-logger" ,rust-file-per-thread-logger-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-windows-sys" ,rust-windows-sys-0.48)
                       ("rust-zstd" ,rust-zstd-0.11))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for automatic module caching with Wasmtime")
    (description
     "This package provides Support for automatic module caching with Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmparser-0.110
  (package
    (name "rust-wasmparser")
    (version "0.110.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g214qyjbgrbmcdk0dy3snmdnfs2ww103wkbbg4fc0bgv5rdpz0x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasm-encoder-0.31
  (package
    (name "rust-wasm-encoder")
    (version "0.31.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05nyajlmqgvyq7ynqhs1hbsmkafkjrj4dyqszygkklgyx8h3yxj1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-ruzstd-0.3
  (package
    (name "rust-ruzstd")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ruzstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zkz8s4ws2h1ccmjrlm22v0hm31klqimvzll6hgw5npry1hyc5cs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://github.com/KillingSpark/zstd-rs")
    (synopsis "decoder for the zstd compression format")
    (description
     "This package provides a decoder for the zstd compression format.")
    (license license:expat)))

(define-public rust-object-0.31
  (package
    (name "rust-object")
    (version "0.31.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lb670wallm2i6rzrx2hz1afya4bfjzz6n9zhfw52l1bkxyndnlb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-ruzstd" ,rust-ruzstd-0.3)
                       ("rust-wasmparser" ,rust-wasmparser-0.102))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file
formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-12
  (package
    (name "rust-wasmtime")
    (version "12.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z6h5y0qps8jfbwyxfnj1v191zlnhmqg9bvl6yddnq2prhlp1s64"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-fxprof-processed-profile" ,rust-fxprof-processed-profile-0.6)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.31)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-psm" ,rust-psm-0.1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.31)
                       ("rust-wasmparser" ,rust-wasmparser-0.110)
                       ("rust-wasmtime-cache" ,rust-wasmtime-cache-12)
                       ("rust-wasmtime-component-macro" ,rust-wasmtime-component-macro-12)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-12)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-12)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-12)
                       ("rust-wasmtime-jit" ,rust-wasmtime-jit-12)
                       ("rust-wasmtime-runtime" ,rust-wasmtime-runtime-12)
                       ("rust-wasmtime-winch" ,rust-wasmtime-winch-12)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "High-level API to expose the Wasmtime runtime")
    (description
     "This package provides High-level API to expose the Wasmtime runtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-syn-file-expand-0.2
  (package
    (name "rust-syn-file-expand")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn-file-expand" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qrcciscdq8kqzj4ipc8i4diz1rdaiiqgh070qj1qwarlnz1q65n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-im-rc" ,rust-im-rc-15)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/vi/syn-file-expand")
    (synopsis "Library to load full source code of multi-file crates")
    (description
     "This package provides Library to load full source code of multi-file crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wast-33
  (package
    (name "rust-wast")
    (version "33.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06qwh49bqkalljihc8h96vkh8f37fn47sgi9f54j2y3zbhbzw10x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-aha-wit-parser-0.2
  (package
    (name "rust-aha-wit-parser")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aha-wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wgi7grrns8hs3piv4p20nq41mpi2kgxr87slpqy5b7ap1d56vmz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.8)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-wast" ,rust-wast-33))))
    (home-page "https://github.com/ahalabs/wit-bindgen")
    (synopsis "Published mirror of wit-parser")
    (description "This package provides Published mirror of wit-parser.")
    (license license:asl2.0)))

(define-public rust-witgen-macro-helper-0.15
  (package
    (name "rust-witgen-macro-helper")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "witgen_macro_helper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i73bwfd2ng3kc7rsjgardysj5l6rlgsxql5k24iig27ddhcj6ky"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aha-wit-parser" ,rust-aha-wit-parser-0.2)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-syn-file-expand" ,rust-syn-file-expand-0.2))))
    (home-page "https://github.com/bnjjj/witgen")
    (synopsis
     "Macros helpers for witgen which is a library to help you generate wit definitions in a wit file for WebAssembly")
    (description
     "This package provides Macros helpers for witgen which is a library to help you generate wit
definitions in a wit file for @code{WebAssembly}.")
    (license #f #;unknown-license!)))

(define-public rust-witgen-macro-0.15
  (package
    (name "rust-witgen-macro")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "witgen_macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x5xfcav42s6dmiac80zvd5cxm92aygg8ilhkf8nf1qnp6z27f0n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-witgen-macro-helper" ,rust-witgen-macro-helper-0.15))))
    (home-page "https://github.com/bnjjj/witgen")
    (synopsis
     "Macros for witgen which is a library to help you generate wit definitions in a wit file for WebAssembly")
    (description
     "This package provides Macros for witgen which is a library to help you generate wit definitions in a
wit file for @code{WebAssembly}.")
    (license #f #;unknown-license!)))

(define-public rust-witgen-0.15
  (package
    (name "rust-witgen")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "witgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yss8d1rbh4xnqs4n111y35sakww6mcgfizqd9y7nkjv6hfcx9pw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-witgen-macro" ,rust-witgen-macro-0.15))))
    (home-page "https://github.com/bnjjj/witgen")
    (synopsis
     "witgen is a library to help you generate wit definitions in a wit file for WebAssembly")
    (description
     "This package provides witgen is a library to help you generate wit definitions in a wit file for
@code{WebAssembly}.")
    (license #f #;unknown-license!)))

(define-public rust-wit-bindgen-rust-lib-0.7
  (package
    (name "rust-wit-bindgen-rust-lib")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-bindgen-rust-lib" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16mq9cj3p407k7zhyrwvv9cf37q5ghqy1kyfrnhz2sfjrssmhgcx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-wit-bindgen-core" ,rust-wit-bindgen-core-0.7))))
    (home-page "https://github.com/bytecodealliance/wit-bindgen")
    (synopsis
     "Shared support for generating Rust code with wit-bindgen-style code generators.")
    (description
     "This package provides Shared support for generating Rust code with wit-bindgen-style code generators.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-bindgen-rust-0.7
  (package
    (name "rust-wit-bindgen-rust")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-bindgen-rust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pxamc0si9kpm9w1sk275ligxk8l07pmr0k7r4zy7y7j1i62fl4s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-4)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-wasm-metadata" ,rust-wasm-metadata-0.8)
                       ("rust-wit-bindgen-core" ,rust-wit-bindgen-core-0.7)
                       ("rust-wit-bindgen-rust-lib" ,rust-wit-bindgen-rust-lib-0.7)
                       ("rust-wit-component" ,rust-wit-component-0.11))))
    (home-page "https://github.com/bytecodealliance/wit-bindgen")
    (synopsis
     "Rust bindings generator for WIT and the component model, typically used through
the `wit-bindgen` crate's `generate!` macro.")
    (description
     "This package provides Rust bindings generator for WIT and the component model, typically used through
the `wit-bindgen` crate's `generate!` macro.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-parser-0.8
  (package
    (name "rust-wit-parser")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w2hy3byzgwvr8dg9cc61kkvnyrjrqpbkvj383ls1bnvjgqckbkd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.8)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-url" ,rust-url-2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-parser")
    (synopsis
     "Tooling for parsing `*.wit` files and working with their contents.")
    (description
     "This package provides Tooling for parsing `*.wit` files and working with their contents.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmparser-0.107
  (package
    (name "rust-wasmparser")
    (version "0.107.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jvs1ps5iixn16r9s725wg37qw6nsbbaalksmh6dlz8cg2dsrqr9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-1)
                       ("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasm-metadata-0.8
  (package
    (name "rust-wasm-metadata")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jfdlswwgj8j7xvilpyi66j3qmj7ag4afk640lj30jpzh5jibr9n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.29)
                       ("rust-wasmparser" ,rust-wasmparser-0.107))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-metadata")
    (synopsis "Read and manipulate WebAssembly metadata")
    (description
     "This package provides Read and manipulate @code{WebAssembly} metadata.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasm-encoder-0.29
  (package
    (name "rust-wasm-encoder")
    (version "0.29.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1098j622k5mgcjqfdgdr3j3pqdxq81jk3gir59hz7szajayivi0q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-component-0.11
  (package
    (name "rust-wit-component")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-component" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p2pncdqii8gcl6naq0lws4phjw4fgrp31f8hb22f0s0ixzlrgbw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.29)
                       ("rust-wasm-metadata" ,rust-wasm-metadata-0.8)
                       ("rust-wasmparser" ,rust-wasmparser-0.107)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-wit-parser" ,rust-wit-parser-0.8))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-component")
    (synopsis "Tooling for working with `*.wit` and component files together.")
    (description
     "This package provides Tooling for working with `*.wit` and component files together.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-bindgen-core-0.7
  (package
    (name "rust-wit-bindgen-core")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-bindgen-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "021bgslyfxdmjgay9kflhpn54kczi458hm8fq5dcncsgkjk9m89l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-wit-component" ,rust-wit-component-0.11)
                       ("rust-wit-parser" ,rust-wit-parser-0.8))))
    (home-page "https://github.com/bytecodealliance/wit-bindgen")
    (synopsis
     "Low-level support for bindings generation based on WIT files for use with
`wit-bindgen-cli` and other languages.")
    (description
     "This package provides Low-level support for bindings generation based on WIT files for use with
`wit-bindgen-cli` and other languages.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-bindgen-rust-macro-0.7
  (package
    (name "rust-wit-bindgen-rust-macro")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-bindgen-rust-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wwa1pam5a6bgqyr74vg14j5bl3kxcjy405avd2sy1w0s0ny7k3q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wit-bindgen-core" ,rust-wit-bindgen-core-0.7)
                       ("rust-wit-bindgen-rust" ,rust-wit-bindgen-rust-0.7)
                       ("rust-wit-component" ,rust-wit-component-0.11))))
    (home-page "https://github.com/bytecodealliance/wit-bindgen")
    (synopsis "Procedural macro paired with the `wit-bindgen` crate.")
    (description
     "This package provides Procedural macro paired with the `wit-bindgen` crate.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-bindgen-0.7
  (package
    (name "rust-wit-bindgen")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gf457n6pcl6j0slqpxg35mm87mgnbimvxv2cj48wch574dmja56"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-wit-bindgen-rust-macro" ,rust-wit-bindgen-rust-macro-0.7))))
    (home-page "https://github.com/bytecodealliance/wit-bindgen")
    (synopsis
     "Rust bindings generator and runtime support for WIT and the component model.
Used when compiling Rust programs to the component model.")
    (description
     "This package provides Rust bindings generator and runtime support for WIT and the component model.
Used when compiling Rust programs to the component model.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-entropy-programs-core-0.10
  (package
    (name "rust-entropy-programs-core")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-programs-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f9cgzwss5fahlp389952ckl2krz8zxasr2kyvfz4g27s57d1df5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-wit-bindgen" ,rust-wit-bindgen-0.7)
                       ("rust-witgen" ,rust-witgen-0.15))))
    (home-page "https://entropy.xyz/")
    (synopsis
     "Core traits and types for building programs on the Entropy network")
    (description
     "This package provides Core traits and types for building programs on the Entropy network.")
    (license license:agpl3+)))

(define-public rust-entropy-programs-runtime-0.10
  (package
    (name "rust-entropy-programs-runtime")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-programs-runtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g2dlj2jlkv4j69chqc8z3jnsy98fi7rkipbid6z0ji2wziw0l3a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-entropy-programs-core" ,rust-entropy-programs-core-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmtime" ,rust-wasmtime-12))))
    (home-page "https://entropy.xyz/")
    (synopsis "Webassembly runtime for running Entropy programs")
    (description
     "This package provides Webassembly runtime for running Entropy programs.")
    (license license:agpl3+)))

(define-public rust-rio-0.9
  (package
    (name "rust-rio")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nv8wrnkd41flb32lmxb412l6m1790j12c3lg305764hcmbc564y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/spacejam/rio")
    (synopsis
     "GPL-3.0 nice bindings for io_uring. MIT/Apache-2.0 license is available for spacejam's github sponsors")
    (description
     "This package provides GPL-3.0 nice bindings for io_uring.  MIT/Apache-2.0 license is available for
spacejam's github sponsors.")
    (license license:gpl3)))

(define-public rust-sled-0.34
  (package
    (name "rust-sled")
    (version "0.34.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sled" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dcr2s7cylj5mb33ci3kpx7fz797jwvysnl5airrir9cgirv95kz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-color-backtrace" ,rust-color-backtrace-0.5)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-crossbeam-epoch" ,rust-crossbeam-epoch-0.9)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-fs2" ,rust-fs2-0.4)
                       ("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-rio" ,rust-rio-0.9)
                       ("rust-zstd" ,rust-zstd-0.9))))
    (home-page "https://github.com/spacejam/sled")
    (synopsis
     "Lightweight high-performance pure-rust transactional embedded database")
    (description
     "This package provides Lightweight high-performance pure-rust transactional embedded database.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rpassword-7
  (package
    (name "rust-rpassword")
    (version "7.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rpassword" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gvy3lcpph9vv1rl0cjfn72ylvmgbw2vklmj6w0iv4cpr3ijniw0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-rtoolbox" ,rust-rtoolbox-0.0.1)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/conradkleinespel/rpassword")
    (synopsis "Read passwords in console applications")
    (description
     "This package provides Read passwords in console applications.")
    (license license:asl2.0)))

(define-public rust-entropy-kvdb-0.2
  (package
    (name "rust-entropy-kvdb")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-kvdb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09r18h2l2im3zklf42988ibqpmaxkp6nfzldql901i4sx959fm28"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode" ,rust-bincode-1)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.9)
                       ("rust-entropy-protocol" ,rust-entropy-protocol-0.2)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rpassword" ,rust-rpassword-7)
                       ("rust-scrypt" ,rust-scrypt-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sled" ,rust-sled-0.34)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-synedrion" ,rust-synedrion-0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://entropy.xyz/")
    (synopsis
     "Encrypted key-value database for the Entropy Theshold Signing Server")
    (description
     "This package provides Encrypted key-value database for the Entropy Theshold Signing Server.")
    (license license:agpl3+)))

(define-public rust-windows-strings-0.1
  (package
    (name "rust-windows-strings")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-strings" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "042dxvi3133f7dyi2pgcvknwkikk47k8bddwxbq5s0l6qhjv3nac"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-result" ,rust-windows-result-0.2)
                       ("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-result-0.2
  (package
    (name "rust-windows-result")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-result" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03mf2z1xcy2slhhsm15z24p76qxgm2m74xdjp8bihyag47c4640x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Windows error handling")
    (description "This package provides Windows error handling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-registry-0.2
  (package
    (name "rust-windows-registry")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-registry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c04923fq0rbvl3z0h67xr6rh2fgwkizhclhqv0j79i0nwdh0074"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-result" ,rust-windows-result-0.2)
                       ("rust-windows-strings" ,rust-windows-strings-0.1)
                       ("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Windows registry")
    (description "This package provides Windows registry.")
    (license (list license:expat license:asl2.0))))

(define-public rust-system-configuration-sys-0.6
  (package
    (name "rust-system-configuration-sys")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "system-configuration-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i5sqrmgy58l4704hibjbl36hclddglh73fb3wx95jnmrq81n7cf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/mullvad/system-configuration-rs")
    (synopsis "Low level bindings to SystemConfiguration framework for macOS")
    (description
     "This package provides Low level bindings to @code{SystemConfiguration} framework for @code{macOS}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-system-configuration-0.6
  (package
    (name "rust-system-configuration")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "system-configuration" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sxslml567zm0v8g732314vd2gk9sd3k4xj22xk6p64xir29v1rw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-core-foundation" ,rust-core-foundation-0.9)
                       ("rust-system-configuration-sys" ,rust-system-configuration-sys-0.6))))
    (home-page "https://github.com/mullvad/system-configuration-rs")
    (synopsis "Bindings to SystemConfiguration framework for macOS")
    (description
     "This package provides Bindings to @code{SystemConfiguration} framework for @code{macOS}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-slab-0.4
  (package
    (name "rust-slab")
    (version "0.4.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slab" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rxvsgir0qw5lkycrqgb1cxsvxzjv9bmx73bk5y42svnzfba94lg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-autocfg" ,rust-autocfg-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/tokio-rs/slab")
    (synopsis "Pre-allocated storage for a uniform data type")
    (description
     "This package provides Pre-allocated storage for a uniform data type.")
    (license license:expat)))

(define-public rust-rustls-native-certs-0.8
  (package
    (name "rust-rustls-native-certs")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls-native-certs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12izz1ahwj3yr9fkd39q1w535577z9wsapsahz6jcwxyyaj1ibzw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-openssl-probe" ,rust-openssl-probe-0.1)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-2)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-schannel" ,rust-schannel-0.1)
                       ("rust-security-framework" ,rust-security-framework-2))))
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (home-page "https://github.com/rustls/rustls-native-certs")
    (synopsis
     "rustls-native-certs allows rustls to use the platform native certificate store")
    (description
     "This package provides rustls-native-certs allows rustls to use the platform native certificate store.")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-hyper-rustls-0.27
  (package
    (name "rust-hyper-rustls")
    (version "0.27.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cxkph8hsmbz693a8ih2ciy7h0xbac844rpm981y6c0iqfsxpbq8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-hyper" ,rust-hyper-1)
                       ("rust-hyper-util" ,rust-hyper-util-0.1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.8)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-rustls-platform-verifier" ,rust-rustls-platform-verifier-0.3)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.26)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/rustls/hyper-rustls")
    (synopsis "Rustls+hyper integration for pure rust HTTPS")
    (description
     "This package provides Rustls+hyper integration for pure rust HTTPS.")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-libc-0.2
  (package
    (name "rust-libc")
    (version "0.2.158")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fb4qldw1jrxljrwz6bsjn8lv4rqizlqmab41q3j98q332xw9bfq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.")
    (description
     "This package provides Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-quinn-udp-0.5
  (package
    (name "rust-quinn-udp")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quinn-udp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02qlqjsbmfgwin9jpb652d0hkjyzz7wvsgb833i384hskqp8rrjg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-socket2" ,rust-socket2-0.5)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/quinn-rs/quinn")
    (synopsis
     "UDP sockets with ECN information for the QUIC transport protocol")
    (description
     "This package provides UDP sockets with ECN information for the QUIC transport protocol.")
    (license (list license:expat license:asl2.0))))

(define-public rust-security-framework-sys-2
  (package
    (name "rust-security-framework-sys")
    (version "2.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "security-framework-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1byfpx39sbmndfjrlqqylcxdpn3mpjyb9d92dffzw24vkgz2knkm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://lib.rs/crates/security-framework-sys")
    (synopsis "Apple `Security.framework` low-level FFI bindings")
    (description
     "This package provides Apple `Security.framework` low-level FFI bindings.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bitflags-2
  (package
    (name "rust-bitflags")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pkidwzn3hnxlsl8zizh0bncgbjnw7c41cx7bby26ncbzmiznj5h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bitflags/bitflags")
    (synopsis "macro to generate structures which behave like bitflags.")
    (description
     "This package provides a macro to generate structures which behave like bitflags.")
    (license (list license:expat license:asl2.0))))

(define-public rust-security-framework-2
  (package
    (name "rust-security-framework")
    (version "2.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "security-framework" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00ldclwx78dm61v7wkach9lcx76awlrv0fdgjdwch4dmy12j4yw9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-core-foundation" ,rust-core-foundation-0.9)
                       ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-security-framework-sys" ,rust-security-framework-sys-2))))
    (home-page "https://lib.rs/crates/security_framework")
    (synopsis "Security.framework bindings for macOS and iOS")
    (description
     "This package provides Security.framework bindings for @code{macOS} and @code{iOS}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustls-platform-verifier-android-0.1
  (package
    (name "rust-rustls-platform-verifier-android")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls-platform-verifier-android" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13vq6sxsgz9547xm2zbdxiw8x7ad1g8n8ax6xvxsjqszk7q6awgq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rustls/rustls-platform-verifier")
    (synopsis
     "The internal JVM support component of the rustls-platform-verifier crate. You shouldn't depend on this directly")
    (description
     "This package provides The internal JVM support component of the rustls-platform-verifier crate.  You
shouldn't depend on this directly.")
    (license (list license:expat license:asl2.0))))

(define-public rust-android-log-sys-0.3
  (package
    (name "rust-android-log-sys")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "android_log-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dwrvwkx2xxqys6nrhfavbbqfx2rs61nq8akrlnqkfbapxb81k2y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-mobile/android_log-sys-rs")
    (synopsis "FFI bindings to Android log Library.")
    (description "This package provides FFI bindings to Android log Library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-android-logger-0.13
  (package
    (name "rust-android-logger")
    (version "0.13.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "android_logger" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bvp6lf39q0zykn70lys562kdb14r9dfm91m79jxq53cfi7i7564"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-android-log-sys" ,rust-android-log-sys-0.3)
                       ("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1))))
    (home-page "https://github.com/rust-mobile/android_logger-rs")
    (synopsis
     "logging implementation for `log` which hooks to android log output.")
    (description
     "This package provides a logging implementation for `log` which hooks to android
log output.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustls-platform-verifier-0.3
  (package
    (name "rust-rustls-platform-verifier")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls-platform-verifier" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "145lhjn9w5khp0fn4lagaa8qqyjyhfqn2dg6llva6qyzvy5qgfxg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-android-logger" ,rust-android-logger-0.13)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-core-foundation" ,rust-core-foundation-0.9)
                       ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
                       ("rust-jni" ,rust-jni-0.19)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-platform-verifier-android" ,rust-rustls-platform-verifier-android-0.1)
                       ("rust-rustls-webpki" ,rust-rustls-webpki-0.102)
                       ("rust-security-framework" ,rust-security-framework-2)
                       ("rust-security-framework-sys" ,rust-security-framework-sys-2)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rustls/rustls-platform-verifier")
    (synopsis
     "rustls-platform-verifier supports verifying TLS certificates in rustls with the operating system verifier")
    (description
     "This package provides rustls-platform-verifier supports verifying TLS certificates in rustls with the
operating system verifier.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustc-hash-2
  (package
    (name "rust-rustc-hash")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-hash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lni0lf846bzrf3jvci6jaf4142n1mdqxvcpczk5ch9pfgyk8c2q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/rust-lang/rustc-hash")
    (synopsis "speedy, non-cryptographic hashing algorithm used by rustc")
    (description
     "This package provides a speedy, non-cryptographic hashing algorithm used by
rustc.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-quinn-proto-0.11
  (package
    (name "rust-quinn-proto")
    (version "0.11.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quinn-proto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19m4219ybsma7kkz79j721lzhy3vgfqfwwxvc40rsf3zrp9axpzs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-rustc-hash" ,rust-rustc-hash-2)
                       ("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-platform-verifier" ,rust-rustls-platform-verifier-0.3)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tinyvec" ,rust-tinyvec-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/quinn-rs/quinn")
    (synopsis "State machine for the QUIC transport protocol")
    (description
     "This package provides State machine for the QUIC transport protocol.")
    (license (list license:expat license:asl2.0))))

(define-public rust-quinn-0.11
  (package
    (name "rust-quinn")
    (version "0.11.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quinn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1146h9wkn5bb8l1mllnw7s1hkvg0iykg1i3x881p5bndwgfmyz4c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-io" ,rust-async-io-2)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-quinn-proto" ,rust-quinn-proto-0.11)
                       ("rust-quinn-udp" ,rust-quinn-udp-0.5)
                       ("rust-rustc-hash" ,rust-rustc-hash-2)
                       ("rust-rustls" ,rust-rustls-0.23)
                       ("rust-smol" ,rust-smol-2)
                       ("rust-socket2" ,rust-socket2-0.5)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/quinn-rs/quinn")
    (synopsis "Versatile QUIC transport protocol implementation")
    (description
     "This package provides Versatile QUIC transport protocol implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-h3-quinn-0.0.7
  (package
    (name "rust-h3-quinn")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "h3-quinn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mfq4kf97vir2kcqh8k5basz8kq85w9xii1na98fmvpw2gs9kiqp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-h3" ,rust-h3-0.0.6)
                       ("rust-quinn" ,rust-quinn-0.11)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/hyperium/h3")
    (synopsis "QUIC transport implementation based on Quinn")
    (description
     "This package provides QUIC transport implementation based on Quinn.")
    (license license:expat)))

(define-public rust-h3-0.0.6
  (package
    (name "rust-h3")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "h3" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ay6bfnj49wdyhvsqf78msdv3zxl32cjfk745z8scirvjsh7axjy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-fastrand" ,rust-fastrand-2)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/hyperium/h3")
    (synopsis "An async HTTP/3 implementation")
    (description "This package provides An async HTTP/3 implementation.")
    (license license:expat)))

(define-public rust-cookie-store-0.21
  (package
    (name "rust-cookie-store")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cookie_store" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1akbrsgvb66zmbi5kzbanmh10mpqg8khv5anxyv4i4a1x2vycd29"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cookie" ,rust-cookie-0.18)
                       ("rust-idna" ,rust-idna-0.5)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-publicsuffix" ,rust-publicsuffix-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/pfernie/cookie_store")
    (synopsis "Implementation of Cookie storage and retrieval")
    (description
     "This package provides Implementation of Cookie storage and retrieval.")
    (license (list license:expat license:asl2.0))))

(define-public rust-reqwest-0.12
  (package
    (name "rust-reqwest")
    (version "0.12.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "reqwest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qsymmmgam6whjcymnlpf5kvk3ylc4bs92lygz63hp7g95b9bx7q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-compression" ,rust-async-compression-0.4)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cookie" ,rust-cookie-0.18)
                       ("rust-cookie-store" ,rust-cookie-store-0.21)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-h2" ,rust-h2-0.4)
                       ("rust-h3" ,rust-h3-0.0.6)
                       ("rust-h3-quinn" ,rust-h3-quinn-0.0.7)
                       ("rust-hickory-resolver" ,rust-hickory-resolver-0.24)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1)
                       ("rust-hyper" ,rust-hyper-1)
                       ("rust-hyper-rustls" ,rust-hyper-rustls-0.27)
                       ("rust-hyper-tls" ,rust-hyper-tls-0.6)
                       ("rust-hyper-util" ,rust-hyper-util-0.1)
                       ("rust-ipnet" ,rust-ipnet-2)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-quinn" ,rust-quinn-0.11)
                       ("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-2)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-sync-wrapper" ,rust-sync-wrapper-1)
                       ("rust-system-configuration" ,rust-system-configuration-0.6)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.26)
                       ("rust-tokio-socks" ,rust-tokio-socks-0.5)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-url" ,rust-url-2)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-wasm-streams" ,rust-wasm-streams-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26)
                       ("rust-windows-registry" ,rust-windows-registry-0.2))))
    (home-page "https://github.com/seanmonstar/reqwest")
    (synopsis "higher level HTTP client library")
    (description "This package provides higher level HTTP client library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-rational-0.4
  (package
    (name "rust-num-rational")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-rational" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "093qndy02817vpgcqjnj139im3jl7vkq4h68kykdqqh577d18ggq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-num/num-rational")
    (synopsis "Rational numbers implementation for Rust")
    (description
     "This package provides Rational numbers implementation for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-bigint-0.4
  (package
    (name "rust-num-bigint")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-bigint" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f903zd33i6hkjpsgwhqwi2wffnvkxbn6rv4mkgcjcqi7xr4zr55"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-num/num-bigint")
    (synopsis "Big integer implementation for Rust")
    (description "This package provides Big integer implementation for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-0.4
  (package
    (name "rust-num")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08yb2fc1psig7pkzaplm495yp7c30m4pykpkwmi5bxrgid705g9m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-complex" ,rust-num-complex-0.4)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-iter" ,rust-num-iter-0.1)
                       ("rust-num-rational" ,rust-num-rational-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/rust-num/num")
    (synopsis
     "collection of numeric types and traits for Rust, including bigint,
complex, rational, range iterators, generic integers, and more!")
    (description
     "This package provides a collection of numeric types and traits for Rust,
including bigint, complex, rational, range iterators, generic integers, and
more!")
    (license (list license:expat license:asl2.0))))

(define-public rust-zeroize-1
  (package
    (name "rust-zeroize")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zeroize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pjdrmjwmszpxfd7r860jx54cyk94qk59x13sc307cvr5256glyf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-zeroize-derive" ,rust-zeroize-derive-1))))
    (home-page "https://github.com/RustCrypto/utils/tree/master/zeroize")
    (synopsis "Securely clear secrets from memory with a simple trait built on
stable Rust primitives which guarantee memory is zeroed using an
operation will not be 'optimized away' by the compiler.
Uses a portable pure Rust implementation that works everywhere,
even WASM!")
    (description
     "This package provides Securely clear secrets from memory with a simple trait built on stable Rust
primitives which guarantee memory is zeroed using an operation will not be
optimized away by the compiler.  Uses a portable pure Rust implementation that
works everywhere, even WASM!")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasm-bindgen-derive-macro-0.3
  (package
    (name "rust-wasm-bindgen-derive-macro")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-derive-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1isckfv102bcsm0d3dgcm4jljb8ccdjaxfsjgm28zcswy60c1yzj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/fjarri/wasm-bindgen-derive")
    (synopsis "Proc-macro backend for wasm-bindgen-derive")
    (description
     "This package provides Proc-macro backend for wasm-bindgen-derive.")
    (license license:expat)))

(define-public rust-wasm-bindgen-derive-0.3
  (package
    (name "rust-wasm-bindgen-derive")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fn98bvyzpaihkl82c4b7z8kanqki4f32z168dyv5nh8fjwgvf4a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-derive-macro" ,rust-wasm-bindgen-derive-macro-0.3))))
    (home-page "https://github.com/fjarri/wasm-bindgen-derive")
    (synopsis "Trait derivation macros for wasm-bindgen")
    (description
     "This package provides Trait derivation macros for wasm-bindgen.")
    (license license:expat)))

(define-public rust-tungstenite-0.23
  (package
    (name "rust-tungstenite")
    (version "0.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j6rxlcdky8lrwkl1qsyvnmlr38033vch11vsi7rklkywkhjqbkf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-data-encoding" ,rust-data-encoding-2)
                       ("rust-http" ,rust-http-1)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-url" ,rust-url-2)
                       ("rust-utf-8" ,rust-utf-8-0.7)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/snapview/tungstenite-rs")
    (synopsis "Lightweight stream-based WebSocket implementation")
    (description
     "This package provides Lightweight stream-based @code{WebSocket} implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-rustls-0.26
  (package
    (name "rust-tokio-rustls")
    (version "0.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m00czrmk8x7pdjnz10a3da3i1d0sdf9j9vfp5dnk5ss1q6w8yqc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/rustls/tokio-rustls")
    (synopsis "Asynchronous TLS/SSL streams for Tokio using Rustls")
    (description
     "This package provides Asynchronous TLS/SSL streams for Tokio using Rustls.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libz-sys-1
  (package
    (name "rust-libz-sys")
    (version "1.1.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libz-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wp4i6zl385ilmcqafv61jwsk1mpk6yb8gpws9nwza00x19n9lfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-cmake" ,rust-cmake-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page "https://github.com/rust-lang/libz-sys")
    (synopsis
     "Low-level bindings to the system libz library (also known as zlib)")
    (description
     "This package provides Low-level bindings to the system libz library (also known as zlib).")
    (license (list license:expat license:asl2.0))))

(define-public rust-zlib-rs-0.2
  (package
    (name "rust-zlib-rs")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zlib-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04a8iasrpjshw2xm6qch0zfzh4m5659pv5qzf2dyagjmaf2bnhp9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-libz-sys" ,rust-libz-sys-1)
                       ("rust-quickcheck" ,rust-quickcheck-1))))
    (home-page "https://github.com/memorysafety/zlib-rs")
    (synopsis "memory-safe zlib implementation written in rust")
    (description
     "This package provides a memory-safe zlib implementation written in rust.")
    (license license:zlib)))

(define-public rust-rustls-webpki-0.102
  (package
    (name "rust-rustls-webpki")
    (version "0.102.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls-webpki" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mmfwr5pkwrn5bi36sk43fgh9yqf9nlxfghq2nsg5valpn380rw4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aws-lc-rs" ,rust-aws-lc-rs-1)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-untrusted" ,rust-untrusted-0.9))))
    (home-page "https://github.com/rustls/webpki")
    (synopsis "Web PKI X.509 Certificate Verification")
    (description
     "This package provides Web PKI X.509 Certificate Verification.")
    (license license:isc)))

(define-public rust-brotli-decompressor-4
  (package
    (name "rust-brotli-decompressor")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "brotli-decompressor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qn39c7n6wm40i2bm0d3q2qslmaavlh804iv0ccbba4m80pbsics"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-alloc-no-stdlib" ,rust-alloc-no-stdlib-2)
                       ("rust-alloc-stdlib" ,rust-alloc-stdlib-0.2))))
    (home-page "https://github.com/dropbox/rust-brotli-decompressor")
    (synopsis
     "brotli decompressor that with an interface avoiding the rust stdlib. This makes it suitable for embedded devices and kernels. It is designed with a pluggable allocator so that the standard lib's allocator may be employed. The default build also includes a stdlib allocator and stream interface. Disable this with --features=no-stdlib. Alternatively, --features=unsafe turns off array bounds checks and memory initialization but provides a safe interface for the caller.  Without adding the --features=unsafe argument, all included code is safe. For compression in addition to this library, download https://github.com/dropbox/rust-brotli")
    (description
     "This package provides a brotli decompressor that with an interface avoiding the
rust stdlib.  This makes it suitable for embedded devices and kernels.  It is
designed with a pluggable allocator so that the standard lib's allocator may be
employed.  The default build also includes a stdlib allocator and stream
interface.  Disable this with --features=no-stdlib.  Alternatively,
--features=unsafe turns off array bounds checks and memory initialization but
provides a safe interface for the caller.  Without adding the --features=unsafe
argument, all included code is safe.  For compression in addition to this
library, download https://github.com/dropbox/rust-brotli.")
    (license (list license:bsd-3 license:expat))))

(define-public rust-brotli-6
  (package
    (name "rust-brotli")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "brotli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0swvf6cgbwhwrpd5y23vq6wipb6q2wqvi2j0hy0xa9lkplfrgxvl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-alloc-no-stdlib" ,rust-alloc-no-stdlib-2)
                       ("rust-alloc-stdlib" ,rust-alloc-stdlib-0.2)
                       ("rust-brotli-decompressor" ,rust-brotli-decompressor-4)
                       ("rust-sha2" ,rust-sha2-0.10))))
    (home-page "https://github.com/dropbox/rust-brotli")
    (synopsis
     "brotli compressor and decompressor that with an interface avoiding the rust stdlib. This makes it suitable for embedded devices and kernels. It is designed with a pluggable allocator so that the standard lib's allocator may be employed. The default build also includes a stdlib allocator and stream interface. Disable this with --features=no-stdlib. All included code is safe.")
    (description
     "This package provides a brotli compressor and decompressor that with an
interface avoiding the rust stdlib.  This makes it suitable for embedded devices
and kernels.  It is designed with a pluggable allocator so that the standard
lib's allocator may be employed.  The default build also includes a stdlib
allocator and stream interface.  Disable this with --features=no-stdlib.  All
included code is safe.")
    (license (list license:bsd-3 license:expat))))

(define-public rust-aws-lc-sys-0.20
  (package
    (name "rust-aws-lc-sys")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aws-lc-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00q73wwzbcp9v1sn155d5gajj5ki9mqlpj9d1hj2vbf6529283hg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.69)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cmake" ,rust-cmake-0.1)
                       ("rust-dunce" ,rust-dunce-1)
                       ("rust-fs-extra" ,rust-fs-extra-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-paste" ,rust-paste-1))))
    (home-page "https://github.com/aws/aws-lc-rs")
    (synopsis
     "AWS-LC is a general-purpose cryptographic library maintained by the AWS Cryptography team for AWS and their customers. It Ñs based on code from the Google BoringSSL project and the OpenSSL project")
    (description
     "This package provides AWS-LC is a general-purpose cryptographic library maintained by the AWS
Cryptography team for AWS and their customers.  It Ñs based on code from the
Google @code{BoringSSL} project and the @code{OpenSSL} project.")
    (license (list license:isc #;unknown-license! #;unknown-license!
                   license:openssl))))

(define-public rust-aws-lc-rs-1
  (package
    (name "rust-aws-lc-rs")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aws-lc-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xxdyn1zcc4jiy0n3bfn56486djbsfd76w0pzn50wlx7s2dlvrsa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aws-lc-fips-sys" ,rust-aws-lc-fips-sys-0.12)
                       ("rust-aws-lc-sys" ,rust-aws-lc-sys-0.20)
                       ("rust-mirai-annotations" ,rust-mirai-annotations-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-untrusted" ,rust-untrusted-0.7)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/awslabs/aws-lc-rs")
    (synopsis
     "aws-lc-rs is a cryptographic library using AWS-LC for its cryptographic operations. This library strives to be API-compatible with the popular Rust library named ring")
    (description
     "This package provides aws-lc-rs is a cryptographic library using AWS-LC for its cryptographic
operations.  This library strives to be API-compatible with the popular Rust
library named ring.")
    (license (list license:isc #;unknown-license! #;unknown-license!))))

(define-public rust-rustls-0.23
  (package
    (name "rust-rustls")
    (version "0.23.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i5h0sw8j6bly8rilidb0snd5czpkyjhzqfcd890mz1f7628r3y5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aws-lc-rs" ,rust-aws-lc-rs-1)
                       ("rust-brotli" ,rust-brotli-6)
                       ("rust-brotli-decompressor" ,rust-brotli-decompressor-4)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-rustls-webpki" ,rust-rustls-webpki-0.102)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1)
                       ("rust-zlib-rs" ,rust-zlib-rs-0.2))))
    (home-page "https://github.com/rustls/rustls")
    (synopsis "Rustls is a modern TLS library written in Rust")
    (description
     "This package provides Rustls is a modern TLS library written in Rust.")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-tokio-tungstenite-0.23
  (package
    (name "rust-tokio-tungstenite")
    (version "0.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k9ijv208hsps5qhq2ii2cl8lwik7lpasssfy6m9016irr09b666"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rustls" ,rust-rustls-0.23)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.26)
                       ("rust-tungstenite" ,rust-tungstenite-0.23)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://github.com/snapview/tokio-tungstenite")
    (synopsis
     "Tokio binding for Tungstenite, the Lightweight stream-based WebSocket implementation")
    (description
     "This package provides Tokio binding for Tungstenite, the Lightweight stream-based @code{WebSocket}
implementation.")
    (license license:expat)))

(define-public rust-tokio-macros-2
  (package
    (name "rust-tokio-macros")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lnpg14h1v3fh2jvnc8cz7cjf0m7z1xgkwfpcyy632g829imjgb9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://tokio.rs")
    (synopsis "Tokio's proc macros.")
    (description "This package provides Tokio's proc macros.")
    (license license:expat)))

(define-public rust-hermit-abi-0.3
  (package
    (name "rust-hermit-abi")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hermit-abi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "092hxjbjnq5fmz66grd9plxd0sh6ssg5fhgwwwqbrzgzkjwdycfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/hermit-os/hermit-rs")
    (synopsis "Hermit system calls definitions")
    (description "This package provides Hermit system calls definitions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mio-1
  (package
    (name "rust-mio")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v1cnnn44awxbcfm4zlavwgkvbyg7gp5zzjm8mqf1apkrwflvq40"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hermit-abi" ,rust-hermit-abi-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-wasi" ,rust-wasi-0.11)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/tokio-rs/mio")
    (synopsis "Lightweight non-blocking I/O")
    (description "This package provides Lightweight non-blocking I/O.")
    (license license:expat)))

(define-public rust-tokio-1
  (package
    (name "rust-tokio")
    (version "1.40.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "166rllhfkyqp0fs7sxn6crv74iizi4wzd3cvxkcpmlk52qip1c72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-signal-hook-registry" ,rust-signal-hook-registry-1)
                       ("rust-socket2" ,rust-socket2-0.5)
                       ("rust-tokio-macros" ,rust-tokio-macros-2)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://tokio.rs")
    (synopsis
     "An event-driven, non-blocking I/O platform for writing asynchronous I/O
backed applications.")
    (description
     "This package provides An event-driven, non-blocking I/O platform for writing asynchronous I/O backed
applications.")
    (license license:expat)))

(define-public rust-crypto-primes-0.5
  (package
    (name "rust-crypto-primes")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crypto-primes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bsq7227076lynw6m38l4hmnl817hri6121c4jagqv38m2qfx94p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crypto-bigint" ,rust-crypto-bigint-0.5)
                       ("rust-openssl" ,rust-openssl-0.10)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-rug" ,rust-rug-1))))
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (home-page "https://github.com/entropyxyz/crypto-primes")
    (synopsis "Random prime number generation and primality checking library")
    (description
     "This package provides Random prime number generation and primality checking library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-crypto-bigint-0.5
  (package
    (name "rust-crypto-bigint")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crypto-bigint" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xmbdff3g6ii5sbxjxc31xfkv9lrmyril4arh3dzckd4gjsjzj8d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-der" ,rust-der-0.7)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-rlp" ,rust-rlp-0.5)
                       ("rust-serdect" ,rust-serdect-0.2)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/crypto-bigint")
    (synopsis
     "Pure Rust implementation of a big integer library which has been designed from
the ground-up for use in cryptographic applications. Provides constant-time,
no_std-friendly implementations of modern formulas using const generics.")
    (description
     "This package provides Pure Rust implementation of a big integer library which has been designed from
the ground-up for use in cryptographic applications.  Provides constant-time,
no_std-friendly implementations of modern formulas using const generics.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-synedrion-0.1
  (package
    (name "rust-synedrion")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synedrion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vbby4dklfm1vdqwx50v5ym6fv3cfvhr32ms4l704l01mmxdi6vi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.21)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-crypto-bigint" ,rust-crypto-bigint-0.5)
                       ("rust-crypto-primes" ,rust-crypto-primes-0.5)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-itertools" ,rust-itertools-0.11)
                       ("rust-k256" ,rust-k256-0.13)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-signature" ,rust-signature-2))))
    (home-page "https://github.com/entropyxyz/synedrion")
    (synopsis
     "Threshold signing library based on Canetti-Gennaro-Goldfeder-Makriyannis-Peled '21 scheme")
    (description
     "This package provides Threshold signing library based on Canetti-Gennaro-Goldfeder-Makriyannis-Peled
21 scheme.")
    (license license:agpl3+)))

(define-public rust-libsodium-sys-0.2
  (package
    (name "rust-libsodium-sys")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libsodium-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zcjka23grayr8kjrgbada6vwagp0kkni9m45v0gpbanrn3r6xvb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/sodiumoxide/sodiumoxide.git")
    (synopsis "FFI binding to libsodium")
    (description "This package provides FFI binding to libsodium.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sodiumoxide-0.2
  (package
    (name "rust-sodiumoxide")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sodiumoxide" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a00rcp2vphrs8qh0477rzs6lhsng1m5i0l4qamagnf2nsnf6sz2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ed25519" ,rust-ed25519-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libsodium-sys" ,rust-libsodium-sys-0.2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/sodiumoxide/sodiumoxide")
    (synopsis "Fast cryptographic library for Rust (bindings to libsodium)")
    (description
     "This package provides Fast cryptographic library for Rust (bindings to libsodium).")
    (license (list license:expat license:asl2.0))))

(define-public rust-pqcrypto-traits-0.3
  (package
    (name "rust-pqcrypto-traits")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pqcrypto-traits" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fsigdrjrwkyc00da0y2z1n626lnak268wfjsxl9xvafcp3m3s4l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rustpq/")
    (synopsis "Shared traits for post-quantum cryptographic primitives")
    (description
     "This package provides Shared traits for post-quantum cryptographic primitives.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pqcrypto-internals-0.2
  (package
    (name "rust-pqcrypto-internals")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pqcrypto-internals" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ipv96543y0g71qkwzir0cigl7rd565vcj3pvvk868mydbn4plyr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-dunce" ,rust-dunce-1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "")
    (synopsis "bindings to common cryptography")
    (description "This package provides bindings to common cryptography.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pqcrypto-kyber-0.8
  (package
    (name "rust-pqcrypto-kyber")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pqcrypto-kyber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00503fds71zjqzyp6g162avrmmjg0n456ibiqz85k249ry9h5h0m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-glob" ,rust-glob-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-pqcrypto-internals" ,rust-pqcrypto-internals-0.2)
                       ("rust-pqcrypto-traits" ,rust-pqcrypto-traits-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-big-array" ,rust-serde-big-array-0.5))))
    (home-page "https://github.com/rustpq/")
    (synopsis "Post-Quantum Key-Encapsulation Mechanism kyber")
    (description
     "This package provides Post-Quantum Key-Encapsulation Mechanism kyber.")
    (license (list license:expat license:asl2.0))))

(define-public rust-snow-0.9
  (package
    (name "rust-snow")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "snow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "119g3wk6pw27h7yj3dn3nim6f2fiqjny23w6mfw17rv8w2z4h2c5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aes-gcm" ,rust-aes-gcm-0.10)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.10)
                       ("rust-curve25519-dalek" ,rust-curve25519-dalek-4)
                       ("rust-pqcrypto-kyber" ,rust-pqcrypto-kyber-0.8)
                       ("rust-pqcrypto-traits" ,rust-pqcrypto-traits-0.3)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-ring" ,rust-ring-0.17)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sodiumoxide" ,rust-sodiumoxide-0.2)
                       ("rust-subtle" ,rust-subtle-2))))
    (home-page "https://github.com/mcginty/snow")
    (synopsis "pure-rust implementation of the Noise Protocol Framework")
    (description
     "This package provides a pure-rust implementation of the Noise Protocol
Framework.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-hpke-rs-rust-crypto-0.2
  (package
    (name "rust-hpke-rs-rust-crypto")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hpke-rs-rust-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kx1n8cicvfllfnd3xhxjjfxnar111fm3lr3cxsfvb7hp804b3d0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aes-gcm" ,rust-aes-gcm-0.10)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.10)
                       ("rust-hkdf" ,rust-hkdf-0.12)
                       ("rust-hpke-rs-crypto" ,rust-hpke-rs-crypto-0.2)
                       ("rust-p256" ,rust-p256-0.13)
                       ("rust-p384" ,rust-p384-0.13)
                       ("rust-rand-chacha" ,rust-rand-chacha-0.3)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-2))))
    (home-page "https://github.com/franziskuskiefer/hpke-rs")
    (synopsis "Crypto backend for HPKE using native Rust crypto")
    (description
     "This package provides Crypto backend for HPKE using native Rust crypto.")
    (license license:mpl2.0)))

(define-public rust-hpke-rs-crypto-0.2
  (package
    (name "rust-hpke-rs-crypto")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hpke-rs-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rsv0m7bsq5wankhjjr498f2cmk02cbi5nvhk93dc63clbh1lgqw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/franziskuskiefer/hpke-rs")
    (synopsis "Traits and types for HPKE crypto backends")
    (description
     "This package provides Traits and types for HPKE crypto backends.")
    (license license:mpl2.0)))

(define-public rust-hpke-rs-0.2
  (package
    (name "rust-hpke-rs")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hpke-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11fln9ybip68iwmzbxy3kqlqg73jrj4q9vvj1s1a37xp4zpd86z1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hpke-rs-crypto" ,rust-hpke-rs-crypto-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tls-codec" ,rust-tls-codec-0.4)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/franziskuskiefer/hpke-rs")
    (synopsis "HPKE Implementation")
    (description "This package provides HPKE Implementation.")
    (license license:mpl2.0)))

(define-public rust-subxt-metadata-0.35
  (package
    (name "rust-subxt-metadata")
    (version "0.35.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zmbnxbiv5508q9jn6h3s3cgzr99rl3qf635pvqsjyfh510ca46c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-frame-metadata" ,rust-frame-metadata-16)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-sp-crypto-hashing" ,rust-sp-crypto-hashing-0.1))))
    (home-page "https://www.parity.io/")
    (synopsis
     "Command line utilities for checking metadata compatibility between nodes")
    (description
     "This package provides Command line utilities for checking metadata compatibility between nodes.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-subxt-codegen-0.35
  (package
    (name "rust-subxt-codegen")
    (version "0.35.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ngj7aac7hrch3lwiq69fzavfkllzp5vjkp454k1mlvidcjjp7lx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-frame-metadata" ,rust-frame-metadata-16)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-jsonrpsee" ,rust-jsonrpsee-0.22)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-scale-typegen" ,rust-scale-typegen-0.2)
                       ("rust-subxt-metadata" ,rust-subxt-metadata-0.35)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://www.parity.io/")
    (synopsis
     "Generate an API for interacting with a substrate node from FRAME metadata")
    (description
     "This package provides Generate an API for interacting with a substrate node from FRAME metadata.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-scale-typegen-0.2
  (package
    (name "rust-scale-typegen")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-typegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zircrh2a1ndr81lf1d2mcyiz2a9pk2as4s198jb64hvwxszlw6l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/paritytech/scale-typegen")
    (synopsis "Type Generation for SCALE encoded Rust Types")
    (description
     "This package provides Type Generation for SCALE encoded Rust Types.")
    (license license:asl2.0)))

(define-public rust-darling-macro-0.20
  (package
    (name "rust-darling-macro")
    (version "0.20.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling_macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01kq3ibbn47czijj39h3vxyw0c2ksd0jvc097smcrk7n2jjs4dnk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling-core" ,rust-darling-core-0.20)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
     "Internal support for a proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.")
    (description
     "This package provides Internal support for a proc-macro library for reading attributes into structs
when implementing custom derives.  Use https://crates.io/crates/darling in your
code.")
    (license license:expat)))

(define-public rust-strsim-0.11
  (package
    (name "rust-strsim")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strsim" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rapidfuzz/strsim-rs")
    (synopsis
     "Implementations of string similarity metrics. Includes Hamming, Levenshtein,
OSA, Damerau-Levenshtein, Jaro, Jaro-Winkler, and SÃ¸rensen-Dice.")
    (description
     "This package provides Implementations of string similarity metrics.  Includes Hamming, Levenshtein,
OSA, Damerau-Levenshtein, Jaro, Jaro-Winkler, and SÃ¸rensen-Dice.")
    (license license:expat)))

(define-public rust-darling-core-0.20
  (package
    (name "rust-darling-core")
    (version "0.20.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rgr9nci61ahnim93yh3xy6fkfayh7sk4447hahawah3m1hkh4wm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fnv" ,rust-fnv-1)
                       ("rust-ident-case" ,rust-ident-case-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-strsim" ,rust-strsim-0.11)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
     "Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.")
    (description
     "This package provides Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives.  Use https://crates.io/crates/darling in your code.")
    (license license:expat)))

(define-public rust-darling-0.20
  (package
    (name "rust-darling")
    (version "0.20.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1299h2z88qn71mizhh05j26yr3ik0wnqmw11ijds89l8i9nbhqvg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling-core" ,rust-darling-core-0.20)
                       ("rust-darling-macro" ,rust-darling-macro-0.20))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis "proc-macro library for reading attributes into structs when
implementing custom derives.")
    (description
     "This package provides a proc-macro library for reading attributes into structs
when implementing custom derives.")
    (license license:expat)))

(define-public rust-subxt-macro-0.35
  (package
    (name "rust-subxt-macro")
    (version "0.35.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01mm39yp2h4njzxwyq4ld57h0n3x1pv0pkkw83nxgax0wvbq9p4q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.20)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-scale-typegen" ,rust-scale-typegen-0.2)
                       ("rust-subxt-codegen" ,rust-subxt-codegen-0.35)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://www.parity.io/")
    (synopsis
     "Generate types and helpers for interacting with Substrate runtimes")
    (description
     "This package provides Generate types and helpers for interacting with Substrate runtimes.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-wasm-bindgen-futures-0.4
  (package
    (name "rust-wasm-bindgen-futures")
    (version "0.4.43")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-futures" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vf8kmaj95xn5893y1bdlav47y5niq85q5bms9pfj8d6cc7k1sb1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Bridging the gap between Rust Futures and JavaScript Promises")
    (description
     "This package provides Bridging the gap between Rust Futures and @code{JavaScript} Promises.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-impl-1
  (package
    (name "rust-thiserror-impl")
    (version "1.0.63")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qd21l2jjrkvnpr5da3l3b58v4wmrkn6aa0h1z5dg6kb8rc8nmd4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "Implementation detail of the `thiserror` crate")
    (description
     "This package provides Implementation detail of the `thiserror` crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-1
  (package
    (name "rust-thiserror")
    (version "1.0.63")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "092p83mf4p1vkjb2j6h6z96dan4raq2simhirjv12slbndq26d60"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-thiserror-impl" ,rust-thiserror-impl-1))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "derive(Error)")
    (description "This package provides derive(Error).")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.93")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1104bny0hv40jfap3hp8jhs0q4ya244qcrvql39i38xlghq0lan6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (description
     "This package provides Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.93")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-backend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yypblaf94rdgqs5xw97499xfwgs1096yx026d6h88v563d9dqwx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Backend code generation of the wasm-bindgen tool")
    (description
     "This package provides Backend code generation of the wasm-bindgen tool.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.93")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro-support" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dp8w6jmw44srym6l752nkr3hkplyw38a2fxz5f3j1ch9p3l1hxg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasm-bindgen-backend" ,rust-wasm-bindgen-backend-0.2)
                       ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate")
    (description
     "This package provides The part of the implementation of the `#[wasm_bindgen]` attribute that is not in
the shared backend crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.93")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kycd1xfx4d9xzqknvzbiqhwb5fzvjqrrn88x692q1vblj8lqp2q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-quote" ,rust-quote-1)
                       ("rust-wasm-bindgen-macro-support" ,rust-wasm-bindgen-macro-support-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (description
     "This package provides Definition of the `#[wasm_bindgen]` attribute, an internal dependency.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.93")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dfr7pka5kwvky2fx82m9d060p842hc5fyyw8igryikcdb0xybm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-wasm-bindgen-macro" ,rust-wasm-bindgen-macro-0.2))))
    (home-page "https://rustwasm.github.io/")
    (synopsis "Easy support for interacting between JS and Rust.")
    (description
     "This package provides Easy support for interacting between JS and Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-js-sys-0.3
  (package
    (name "rust-js-sys")
    (version "0.3.70")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "js-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yp3rz7vrn9mmqdpkds426r1p9vs6i8mkxx8ryqdfadr0s2q0s0q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (description
     "This package provides Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-subxt-lightclient-0.35
  (package
    (name "rust-subxt-lightclient")
    (version "0.35.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-lightclient" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wf6jwkgl7q8crb9awww5qpz593xllq7f0sdxappmgp32ang2l8x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures" ,rust-futures-0.3)
                       ("rust-futures-timer" ,rust-futures-timer-3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-instant" ,rust-instant-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-send-wrapper" ,rust-send-wrapper-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smoldot" ,rust-smoldot-0.16)
                       ("rust-smoldot-light" ,rust-smoldot-light-0.14)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://www.parity.io/")
    (synopsis "Light Client for chain interaction")
    (description "This package provides Light Client for chain interaction.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-sp-weights-30
  (package
    (name "rust-sp-weights")
    (version "30.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-weights" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11xss1qmhki15nbr34csab15rzq2yh08098xksgv4rihzrhwdxls"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bounded-collections" ,rust-bounded-collections-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sp-arithmetic" ,rust-sp-arithmetic-25)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis
     "Types and traits for interfacing between the host and the wasm runtime. (polkadot v1.10.0)")
    (description
     "This package provides Types and traits for interfacing between the host and the wasm runtime.
(polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-sp-arithmetic-25
  (package
    (name "rust-sp-arithmetic")
    (version "25.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-arithmetic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0571wx13a8l00wp5jw22q7ddy5rjbp5svm7xf5rby81v4vx0f34i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-integer-sqrt" ,rust-integer-sqrt-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://substrate.io")
    (synopsis
     "Minimal fixed point arithmetic primitives and types for runtime. (polkadot v1.10.0)")
    (description
     "This package provides Minimal fixed point arithmetic primitives and types for runtime. (polkadot
v1.10.0).")
    (license license:asl2.0)))

(define-public rust-sp-trie-32
  (package
    (name "rust-sp-trie")
    (version "32.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-trie" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "197sss41ka26i0s9jr88mm5rqi84pmzcxyb57vbr6ay64snr3api"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-memory-db" ,rust-memory-db-0.32)
                       ("rust-nohash-hasher" ,rust-nohash-hasher-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schnellru" ,rust-schnellru-0.2)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.27)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-trie-db" ,rust-trie-db-0.28)
                       ("rust-trie-root" ,rust-trie-root-0.18))))
    (home-page "https://substrate.io")
    (synopsis
     "Patricia trie stuff using a parity-scale-codec node format (polkadot v1.15.0)")
    (description
     "This package provides Patricia trie stuff using a parity-scale-codec node format (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-state-machine-0.38
  (package
    (name "rust-sp-state-machine")
    (version "0.38.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-state-machine" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ib7bviv26kqpcyy278hdnj9i4spdwrnc8vpgr1i9filh2n0xbhy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.27)
                       ("rust-sp-panic-handler" ,rust-sp-panic-handler-13)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-trie" ,rust-sp-trie-32)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-trie-db" ,rust-trie-db-0.28))))
    (home-page "https://substrate.io")
    (synopsis "Substrate State Machine (polkadot v1.15.0)")
    (description
     "This package provides Substrate State Machine (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-keystore-0.37
  (package
    (name "rust-sp-keystore")
    (version "0.37.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-keystore" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sr3ysfgbjj2rnd42i9lbpjkp8nmnm9mgix04n35y7fn3fvbifmx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.27))))
    (home-page "https://substrate.io")
    (synopsis "Keystore primitives. (polkadot v1.13.0)")
    (description
     "This package provides Keystore primitives. (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-polkavm-common-0.9
  (package
    (name "rust-polkavm-common")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-common" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14lby101cxf73jjq50bn7lbx00mqqhc6ljzwp7bwb1fcryjji50x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The common crate for PolkaVM")
    (description "This package provides The common crate for @code{PolkaVM}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-polkavm-derive-impl-0.9
  (package
    (name "rust-polkavm-derive-impl")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-derive-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0366jv4im8rk26qkx01c98wynr671f7d59bldqcrmyqpjz2dyksw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-polkavm-common" ,rust-polkavm-common-0.9)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The derive crate for PolkaVM guest programs (implementation)")
    (description
     "This package provides The derive crate for @code{PolkaVM} guest programs (implementation).")
    (license (list license:expat license:asl2.0))))

(define-public rust-polkavm-derive-impl-macro-0.9
  (package
    (name "rust-polkavm-derive-impl-macro")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-derive-impl-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0adlxhjskpn87djikyhgiq0b22wy7ipql5dnir91xj5abxxiza4b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-polkavm-derive-impl" ,rust-polkavm-derive-impl-0.9)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The derive crate for PolkaVM guest programs (proc-macro)")
    (description
     "This package provides The derive crate for @code{PolkaVM} guest programs (proc-macro).")
    (license (list license:expat license:asl2.0))))

(define-public rust-polkavm-derive-0.9
  (package
    (name "rust-polkavm-derive")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01lnl62sjs5dhp2d36rr2m0a5n8bq7ddvg0qpf4ws49ydzm4p35f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-polkavm-derive-impl-macro" ,rust-polkavm-derive-impl-macro-0.9))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The derive crate for PolkaVM guest programs")
    (description
     "This package provides The derive crate for @code{PolkaVM} guest programs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sp-io-33
  (package
    (name "rust-sp-io")
    (version "33.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-io" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wkp44yraraa75qz6vs28p7sdr1i99jqzkbrg7kdjnxmh2kvn29y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-ed25519-dalek" ,rust-ed25519-dalek-2)
                       ("rust-libsecp256k1" ,rust-libsecp256k1-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-polkavm-derive" ,rust-polkavm-derive-0.9)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-secp256k1" ,rust-secp256k1-0.28)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-crypto-hashing" ,rust-sp-crypto-hashing-0.1)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.27)
                       ("rust-sp-keystore" ,rust-sp-keystore-0.37)
                       ("rust-sp-runtime-interface" ,rust-sp-runtime-interface-26)
                       ("rust-sp-state-machine" ,rust-sp-state-machine-0.38)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-tracing" ,rust-sp-tracing-16)
                       ("rust-sp-trie" ,rust-sp-trie-32)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1))))
    (home-page "https://substrate.io")
    (synopsis "I/O for Substrate runtimes (polkadot v1.15.0)")
    (description
     "This package provides I/O for Substrate runtimes (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-application-crypto-33
  (package
    (name "rust-sp-application-crypto")
    (version "33.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-application-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p6777c3hhc3ihz2mvwv2mxhvz81j53mrw71vk8x72rcq8hn3jhk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-io" ,rust-sp-io-33)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis
     "Provides facilities for generating application specific crypto wrapper types. (polkadot v1.15.0)")
    (description
     "This package provides facilities for generating application specific crypto
wrapper types. (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-runtime-34
  (package
    (name "rust-sp-runtime")
    (version "34.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n1c6h7j764mjnhzq30qqwwc9106fk73s1gqzkqb4z8yjwkb2g7c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-docify" ,rust-docify-0.2)
                       ("rust-either" ,rust-either-1)
                       ("rust-hash256-std-hasher" ,rust-hash256-std-hasher-0.15)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-simple-mermaid" ,rust-simple-mermaid-0.1)
                       ("rust-sp-application-crypto" ,rust-sp-application-crypto-33)
                       ("rust-sp-arithmetic" ,rust-sp-arithmetic-25)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-io" ,rust-sp-io-33)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-weights" ,rust-sp-weights-30))))
    (home-page "https://substrate.io")
    (synopsis "Runtime Modules shared primitive types. (polkadot v1.15.0)")
    (description
     "This package provides Runtime Modules shared primitive types. (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-substrate-bip39-0.5
  (package
    (name "rust-substrate-bip39")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "substrate-bip39" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08gi9pdhci3crx2ziis343khvxlrrdml6lif4a5lw6g6jg169dd2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hmac" ,rust-hmac-0.12)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.12)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/paritytech/polkadot-sdk.git")
    (synopsis
     "Converting BIP39 entropy to valid Substrate (sr25519) SecretKeys (polkadot v1.10.0)")
    (description
     "This package provides Converting BIP39 entropy to valid Substrate (sr25519) @code{SecretKeys}
(polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-proc-macro2-1
  (package
    (name "rust-proc-macro2")
    (version "1.0.86")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xrv22p8lqlfdf1w0pj4si8n2ws4aw0kilmziwf0vpv5ys6rwway"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/proc-macro2")
    (synopsis
     "substitute implementation of the compiler's `proc_macro` API to decouple token-based libraries from the procedural macro use case.")
    (description
     "This package provides a substitute implementation of the compiler's `proc_macro`
API to decouple token-based libraries from the procedural macro use case.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syn-2
  (package
    (name "rust-syn")
    (version "2.0.77")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vbkwfp9ymmi0fsyyjsqfvnv7gm8vjgl4pzprbk7p3pxc7gvqdcz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "This package provides Parser for Rust source code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sp-runtime-interface-proc-macro-18
  (package
    (name "rust-sp-runtime-interface-proc-macro")
    (version "18.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime-interface-proc-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1532q07xf5mqm1igxacxb3rqbsih5bjygwmvvzhkrvlgc8ng7581"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-expander" ,rust-expander-2)
                       ("rust-inflector" ,rust-inflector-0.11)
                       ("rust-proc-macro-crate" ,rust-proc-macro-crate-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://substrate.io")
    (synopsis
     "This crate provides procedural macros for usage within the context of the Substrate runtime interface")
    (description
     "This crate provides procedural macros for usage within the context of the
Substrate runtime interface.")
    (license license:asl2.0)))

(define-public rust-polkavm-common-0.8
  (package
    (name "rust-polkavm-common")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-common" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05qqrf2yjavd7wf0003wkgwbm37fs1dgdvipp91vxrwlxrz9zjcj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The common crate for PolkaVM")
    (description "This package provides The common crate for @code{PolkaVM}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-polkavm-derive-impl-0.8
  (package
    (name "rust-polkavm-derive-impl")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-derive-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "173cvskfvq49sdjlmfaa94bh1kv2nabkxfdzc31862m1m1a2c2y1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-polkavm-common" ,rust-polkavm-common-0.8)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The derive crate for PolkaVM guest programs (implementation)")
    (description
     "This package provides The derive crate for @code{PolkaVM} guest programs (implementation).")
    (license (list license:expat license:asl2.0))))

(define-public rust-polkavm-derive-impl-macro-0.8
  (package
    (name "rust-polkavm-derive-impl-macro")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-derive-impl-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rpg5mrw02km9njdsp50fyvmykw0w03jdii1y34rs4nml0cm7s0m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-polkavm-derive-impl" ,rust-polkavm-derive-impl-0.8)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The derive crate for PolkaVM guest programs (proc-macro)")
    (description
     "This package provides The derive crate for @code{PolkaVM} guest programs (proc-macro).")
    (license (list license:expat license:asl2.0))))

(define-public rust-polkavm-derive-0.8
  (package
    (name "rust-polkavm-derive")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "polkavm-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09b1ivjhhc9az6ygv82idk46ypk704sahr8spg8qnd32g5pr3ykr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-polkavm-derive-impl-macro" ,rust-polkavm-derive-impl-macro-0.8))))
    (home-page "https://github.com/koute/polkavm")
    (synopsis "The derive crate for PolkaVM guest programs")
    (description
     "This package provides The derive crate for @code{PolkaVM} guest programs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sp-runtime-interface-26
  (package
    (name "rust-sp-runtime-interface")
    (version "26.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime-interface" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15928psnllcd899mkhgy6jm780bqxparx2amsza370w5lig6g2p4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-polkavm-derive" ,rust-polkavm-derive-0.8)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.27)
                       ("rust-sp-runtime-interface-proc-macro" ,rust-sp-runtime-interface-proc-macro-18)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-20)
                       ("rust-sp-tracing" ,rust-sp-tracing-16)
                       ("rust-sp-wasm-interface" ,rust-sp-wasm-interface-20)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://substrate.io")
    (synopsis "Substrate runtime interface (polkadot v1.13.0)")
    (description
     "This package provides Substrate runtime interface (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-sp-externalities-0.27
  (package
    (name "rust-sp-externalities")
    (version "0.27.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-externalities" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11rpcmvsqrm3615mfxjy1hd509gl1chrll4jzwyadm5d5rbs9mm1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-environmental" ,rust-environmental-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-20))))
    (home-page "https://substrate.io")
    (synopsis "Substrate externalities abstraction (polkadot v1.13.0)")
    (description
     "This package provides Substrate externalities abstraction (polkadot v1.13.0).")
    (license license:asl2.0)))

;; added for rust-bitcoin-hashes-0.13
(define-public rust-hex-conservative-0.1
  (package
    (name "rust-hex-conservative")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-conservative" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "085xvjs4fzq7kdf67s298f9l10byi5n0098074clhjrm08hbjai1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-core2" ,rust-core2-0.3)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/hex-conservative")
    (synopsis
     "hex encoding and decoding crate with a conservative MSRV and dependency policy.")
    (description
     "This package provides a hex encoding and decoding crate with a conservative MSRV
and dependency policy.")
    (license license:cc0)))

;; added for rust-bitcoin-hashes-0.13
(define-public rust-bitcoin-internals-0.2
  (package
    (name "rust-bitcoin-internals")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin-internals" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yxv9v37nkmm8p4gi7vz3js77kiwa5adw15frgx87jc9f2zw69cl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/rust-bitcoin/")
    (synopsis "Internal types and macros used by rust-bitcoin ecosystem")
    (description
     "This package provides Internal types and macros used by rust-bitcoin ecosystem.")
    (license license:cc0)))

;; added
(define-public rust-bitcoin-hashes-0.13
  (package
    (name "rust-bitcoin-hashes")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin_hashes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fr9vqg97pv8s5pj1asz6056z1z27az8xc9dk7cxgf7bpzda8c0r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitcoin-io" ,rust-bitcoin-io-0.1)
                       ("rust-hex-conservative" ,rust-hex-conservative-0.1)
                       ;; was rust-hex-conservative-0.2
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-bitcoin-internals" ,rust-bitcoin-internals-0.2))))
    (home-page "https://github.com/rust-bitcoin/rust-bitcoin")
    (synopsis "Hash functions used by the rust-bitcoin eccosystem")
    (description
     "This package provides Hash functions used by the rust-bitcoin eccosystem.")
    (license license:cc0)))

(define-public rust-parity-bip39-2
  (package
    (name "rust-parity-bip39")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parity-bip39" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sfk5kfkc7jr308sr2h8p612rry2y5y3yz9sspvyy1n4dl0vysaf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitcoin-hashes" ,rust-bitcoin-hashes-0.13)
                       ;; was rust-bitcoin-hashes-0.14
                       ("rust-rand" ,rust-rand-0.6)
                       ("rust-rand-core" ,rust-rand-core-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1.22)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/michalkucharczyk/rust-bip39")
    (synopsis "Library for BIP-39 Bitcoin mnemonic codes")
    (description
     "This package provides Library for BIP-39 Bitcoin mnemonic codes.")
    (license license:cc0)))

(define-public rust-sp-core-31
  (package
    (name "rust-sp-core")
    (version "31.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rlka01gg8d6ldrbqjdp6wxq4bw72az87z4q25vc7p0nizys1mr6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-array-bytes" ,rust-array-bytes-6)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-bounded-collections" ,rust-bounded-collections-0.2)
                       ("rust-bs58" ,rust-bs58-0.5)
                       ("rust-dyn-clonable" ,rust-dyn-clonable-0.9)
                       ("rust-ed25519-zebra" ,rust-ed25519-zebra-3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-hash256-std-hasher" ,rust-hash256-std-hasher-0.15)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-k256" ,rust-k256-0.13)
                       ("rust-libsecp256k1" ,rust-libsecp256k1-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-merlin" ,rust-merlin-3)
                       ("rust-parity-bip39" ,rust-parity-bip39-2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-secp256k1" ,rust-secp256k1-0.28)
                       ("rust-secrecy" ,rust-secrecy-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-crypto-hashing" ,rust-sp-crypto-hashing-0.1)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.27)
                       ("rust-sp-runtime-interface" ,rust-sp-runtime-interface-26)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-20)
                       ("rust-ss58-registry" ,rust-ss58-registry-1)
                       ("rust-substrate-bip39" ,rust-substrate-bip39-0.5)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-w3f-bls" ,rust-w3f-bls-0.1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://substrate.io")
    (synopsis "Shareable Substrate types. (polkadot v1.13.0)")
    (description
     "This package provides Shareable Substrate types. (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-scale-value-0.14
  (package
    (name "rust-scale-value")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-value" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a2akv5c8x8z7zr2schnj5bfi6vl1rxqpbqsjxf3611ijvpcyz60"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base58" ,rust-base58-0.2)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-either" ,rust-either-1)
                       ("rust-frame-metadata" ,rust-frame-metadata-15)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-bits" ,rust-scale-bits-0.5)
                       ("rust-scale-decode" ,rust-scale-decode-0.11)
                       ("rust-scale-encode" ,rust-scale-encode-0.6)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-scale-type-resolver" ,rust-scale-type-resolver-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-yap" ,rust-yap-0.11))))
    (home-page "https://www.parity.io/")
    (synopsis "Encode and decode values of arbitrary shapes to SCALE bytes")
    (description
     "This package provides Encode and decode values of arbitrary shapes to SCALE bytes.")
    (license license:asl2.0)))

(define-public rust-scale-encode-derive-0.6
  (package
    (name "rust-scale-encode-derive")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-encode-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g13cgdfl4q5s6ri9p6svvn8rk2n2ir15c089sifgyydywd4wc3s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.14)
                       ("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Derive macro for scale-encode")
    (description "This package provides Derive macro for scale-encode.")
    (license license:asl2.0)))

(define-public rust-scale-encode-0.6
  (package
    (name "rust-scale-encode")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-encode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1iy50zgbhrrqc5immbz9xh7i6kg1nn1vi0bp72slyy9kba901232"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-scale-bits" ,rust-scale-bits-0.5)
                       ("rust-scale-encode-derive" ,rust-scale-encode-derive-0.6)
                       ("rust-scale-type-resolver" ,rust-scale-type-resolver-0.1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Encode types to SCALE bytes given a desired target type")
    (description
     "This package provides Encode types to SCALE bytes given a desired target type.")
    (license license:asl2.0)))

(define-public rust-scale-decode-derive-0.11
  (package
    (name "rust-scale-decode-derive")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-decode-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19fpm8hki36rxgs97xmmlzhkzsfavam86jdckd0wp8xyqyrzv62k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.14)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Derive macro for scale-decode")
    (description "This package provides Derive macro for scale-decode.")
    (license license:asl2.0)))

(define-public rust-scale-decode-0.11
  (package
    (name "rust-scale-decode")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-decode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yzach9i6vxc5ic582lgh5z1zxgdyc0ih7zdxrd2yx0wdajrpixg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-scale-bits" ,rust-scale-bits-0.5)
                       ("rust-scale-decode-derive" ,rust-scale-decode-derive-0.11)
                       ("rust-scale-type-resolver" ,rust-scale-type-resolver-0.1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Decode SCALE encoded bytes into arbitrary types at runtime")
    (description
     "This package provides Decode SCALE encoded bytes into arbitrary types at runtime.")
    (license license:asl2.0)))

(define-public rust-scale-type-resolver-0.1
  (package
    (name "rust-scale-type-resolver")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-type-resolver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hv8qwk0za5y8fn63nfn2v5s50k8skh57xln1x73fhzxkc301f0h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-scale-info" ,rust-scale-info-2)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://www.parity.io/")
    (synopsis
     "low level trait to be generic over how to resolve SCALE type information")
    (description
     "This package provides a low level trait to be generic over how to resolve SCALE
type information.")
    (license license:asl2.0)))

(define-public rust-scale-bits-0.5
  (package
    (name "rust-scale-bits")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-bits" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pri535f59xcc7cjm4zal6nlg5xh3zvniky984y2l73vspf10bb6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-scale-type-resolver" ,rust-scale-type-resolver-0.1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://www.parity.io/")
    (synopsis "SCALE compatible representation of a collection of bits")
    (description
     "This package provides a SCALE compatible representation of a collection of bits.")
    (license license:asl2.0)))

(define-public rust-tokio-retry-0.3
  (package
    (name "rust-tokio-retry")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-retry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kr1hnm5dmb9gfkby88yg2xj8g6x4i4gipva0c8ca3xyxhvfnmvz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/srijs/rust-tokio-retry")
    (synopsis "Extensible, asynchronous retry behaviours for futures/tokio")
    (description
     "This package provides Extensible, asynchronous retry behaviours for futures/tokio.")
    (license license:expat)))

(define-public rust-subxt-metadata-0.34
  (package
    (name "rust-subxt-metadata")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lhbiw7vr0csi0zz1kn1xl7n22nkawaxi3rszxgwbxm1766wlan0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-frame-metadata" ,rust-frame-metadata-16)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-sp-core-hashing" ,rust-sp-core-hashing-15)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://www.parity.io/")
    (synopsis
     "Command line utilities for checking metadata compatibility between nodes")
    (description
     "This package provides Command line utilities for checking metadata compatibility between nodes.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-subxt-codegen-0.34
  (package
    (name "rust-subxt-codegen")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sj30ycp8r6172s0x8i3x6i0dy45185awax5dbrcylc6z31mh3id"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-frame-metadata" ,rust-frame-metadata-16)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-jsonrpsee" ,rust-jsonrpsee-0.21)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-scale-typegen" ,rust-scale-typegen-0.1)
                       ("rust-subxt-metadata" ,rust-subxt-metadata-0.34)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://www.parity.io/")
    (synopsis
     "Generate an API for interacting with a substrate node from FRAME metadata")
    (description
     "This package provides Generate an API for interacting with a substrate node from FRAME metadata.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-scale-typegen-0.1
  (package
    (name "rust-scale-typegen")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-typegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04dbzrrb5zpjq3695d8kh1jnl3ggkf86484phyn91i8s921hk1h0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/paritytech/scale-typegen")
    (synopsis "Type Generation for SCALE encoded Rust Types")
    (description
     "This package provides Type Generation for SCALE encoded Rust Types.")
    (license license:asl2.0)))

(define-public rust-subxt-macro-0.34
  (package
    (name "rust-subxt-macro")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mgbmyfncmq7chwkdqr8ig6ndhvvgj6ay9rlh1j30chkhrk52lin"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.20)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-scale-typegen" ,rust-scale-typegen-0.1)
                       ("rust-subxt-codegen" ,rust-subxt-codegen-0.34)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://www.parity.io/")
    (synopsis
     "Generate types and helpers for interacting with Substrate runtimes")
    (description
     "This package provides Generate types and helpers for interacting with Substrate runtimes.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-windows-x86-64-msvc-0.52
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnullvm-0.52
  (package
    (name "rust-windows-x86-64-gnullvm")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.52
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.52
  (package
    (name "rust-windows-i686-msvc")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnullvm-0.52
  (package
    (name "rust-windows-i686-gnullvm")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.52
  (package
    (name "rust-windows-i686-gnu")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.52
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-gnullvm-0.52
  (package
    (name "rust-windows-aarch64-gnullvm")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_gnullvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-targets-0.52
  (package
    (name "rust-windows-targets")
    (version "0.52.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-targets" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-aarch64-gnullvm" ,rust-windows-aarch64-gnullvm-0.52)
                       ("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.52)
                       ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.52)
                       ("rust-windows-i686-gnullvm" ,rust-windows-i686-gnullvm-0.52)
                       ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.52)
                       ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.52)
                       ("rust-windows-x86-64-gnullvm" ,rust-windows-x86-64-gnullvm-0.52)
                       ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import libs for Windows")
    (description "This package provides Import libs for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.59
  (package
    (name "rust-windows-sys")
    (version "0.59.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-portable-atomic-util-0.2
  (package
    (name "rust-portable-atomic-util")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "portable-atomic-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kbh4ik8cqr4bdbpyfh8n4xcwip93yciccvv815darif0wh89pgw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-portable-atomic" ,rust-portable-atomic-1))))
    (home-page "https://github.com/taiki-e/portable-atomic")
    (synopsis "Synchronization primitives built with portable-atomic.")
    (description
     "This package provides Synchronization primitives built with portable-atomic.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-event-listener-5
  (package
    (name "rust-event-listener")
    (version "5.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "event-listener" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fkm6q4hjn61wl52xyqyyxai0x9w0ngrzi0wf1qsf8vhsadvwck0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-concurrent-queue" ,rust-concurrent-queue-2)
                       ("rust-loom" ,rust-loom-0.7)
                       ("rust-parking" ,rust-parking-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-portable-atomic" ,rust-portable-atomic-1)
                       ("rust-portable-atomic-util" ,rust-portable-atomic-util-0.2))))
    (home-page "https://github.com/smol-rs/event-listener")
    (synopsis "Notify async tasks or threads")
    (description "This package provides Notify async tasks or threads.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-task-4
  (package
    (name "rust-async-task")
    (version "4.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-task" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pp3avr4ri2nbh7s6y9ws0397nkx1zymmcr14sq761ljarh3axcb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-portable-atomic" ,rust-portable-atomic-1))))
    (home-page "https://github.com/smol-rs/async-task")
    (synopsis "Task abstraction for building executors")
    (description
     "This package provides Task abstraction for building executors.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-process-2
  (package
    (name "rust-async-process")
    (version "2.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-process" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x3305pq0fzaqmw7q4c93sgabq97zhkr32xig5dkhkcscn4pg858"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-channel" ,rust-async-channel-2)
                       ("rust-async-io" ,rust-async-io-2)
                       ("rust-async-lock" ,rust-async-lock-3)
                       ("rust-async-signal" ,rust-async-signal-0.2)
                       ("rust-async-task" ,rust-async-task-4)
                       ("rust-blocking" ,rust-blocking-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-event-listener" ,rust-event-listener-5)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/smol-rs/async-process")
    (synopsis "Async interface for working with processes")
    (description
     "This package provides Async interface for working with processes.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-fs-2
  (package
    (name "rust-async-fs")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-fs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jp0p7lg9zqy2djgdmivbzx0yqmfn9sm2s9dkhaws3zlharhkkgb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-lock" ,rust-async-lock-3)
                       ("rust-blocking" ,rust-blocking-1)
                       ("rust-futures-lite" ,rust-futures-lite-2))))
    (home-page "https://github.com/smol-rs/async-fs")
    (synopsis "Async filesystem primitives")
    (description "This package provides Async filesystem primitives.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-smol-2
  (package
    (name "rust-smol")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smol" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19y8v6byi4g464j65d87irsps7x63n3wvx7lcynfd417750lzlma"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-channel" ,rust-async-channel-2)
                       ("rust-async-executor" ,rust-async-executor-1)
                       ("rust-async-fs" ,rust-async-fs-2)
                       ("rust-async-io" ,rust-async-io-2)
                       ("rust-async-lock" ,rust-async-lock-3)
                       ("rust-async-net" ,rust-async-net-2)
                       ("rust-async-process" ,rust-async-process-2)
                       ("rust-blocking" ,rust-blocking-1)
                       ("rust-futures-lite" ,rust-futures-lite-2))))
    (home-page "https://github.com/smol-rs/smol")
    (synopsis "small and fast async runtime")
    (description "This package provides a small and fast async runtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-smoldot-light-0.14
  (package
    (name "rust-smoldot-light")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smoldot-light" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1iyqr49fmj8llrj1lfv3f232n5yx8wifqf8hdd99l0dp2v8z55jl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-channel" ,rust-async-channel-2)
                       ("rust-async-lock" ,rust-async-lock-3)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-blake2-rfc" ,rust-blake2-rfc-0.2)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-either" ,rust-either-1)
                       ("rust-event-listener" ,rust-event-listener-4)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-itertools" ,rust-itertools-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-lru" ,rust-lru-0.12)
                       ("rust-no-std-net" ,rust-no-std-net-0.6)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rand-chacha" ,rust-rand-chacha-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-siphasher" ,rust-siphasher-1)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-smol" ,rust-smol-2)
                       ("rust-smoldot" ,rust-smoldot-0.16)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/smol-dot/smoldot")
    (synopsis
     "Browser bindings to a light client for Substrate-based blockchains")
    (description
     "This package provides Browser bindings to a light client for Substrate-based blockchains.")
    (license (list license:gpl3+ #;unknown-license!))))

(define-public rust-winch-codegen-0.14
  (package
    (name "rust-winch-codegen")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winch-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v09fqpfdchk6d8c35v8m0vsikqnkvrb8lj58nmxkgbad8iqrraq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.103)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmparser" ,rust-wasmparser-0.118)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Winch code generation library")
    (description "This package provides Winch code generation library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-winch-16
  (package
    (name "rust-wasmtime-winch")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-winch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12ncnrj7bbkkrgkm1wnvi9y657y1jgqp8gcpd456xndsz5gr8vrc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.103)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-object" ,rust-object-0.32)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmparser" ,rust-wasmparser-0.118)
                       ("rust-wasmtime-cranelift-shared" ,rust-wasmtime-cranelift-shared-16)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-16)
                       ("rust-winch-codegen" ,rust-winch-codegen-0.14))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Wasmtime and Winch")
    (description
     "This package provides Integration between Wasmtime and Winch.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-wmemcheck-16
  (package
    (name "rust-wasmtime-wmemcheck")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wmemcheck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qjxwhab9a3rqfzspkz9gykan2x4215jfmj3sfji6g0bij7isxk7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Memcheck implementation for Wasmtime")
    (description "This package provides Memcheck implementation for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-runtime-16
  (package
    (name "rust-wasmtime-runtime")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-runtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14pz8a615kpck4zhn9pvdl1l3771lwdzxn8dzwi87vwrkfqjnjvr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mach" ,rust-mach-0.3)
                       ("rust-memfd" ,rust-memfd-0.6)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-psm" ,rust-psm-0.1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-sptr" ,rust-sptr-0.3)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.38)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-16)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-16)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-16)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-16)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-16)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-16)
                       ("rust-wasmtime-wmemcheck" ,rust-wasmtime-wmemcheck-16)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Runtime library support for Wasmtime")
    (description "This package provides Runtime library support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-jit-icache-coherence-16
  (package
    (name "rust-wasmtime-jit-icache-coherence")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-icache-coherence" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12hz5hr5gd5mw7g337b9v5vz7lapzm99a7qf8knk5b9lrizijvbb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Utilities for JIT icache maintenance")
    (description "This package provides Utilities for JIT icache maintenance.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-jit-debug-16
  (package
    (name "rust-wasmtime-jit-debug")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-debug" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kzv3vga44kh0j6jf5rhkkgw404sfn4g2i4hmcpxn3n4zspikqb5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.32)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT debug interfaces support for Wasmtime")
    (description
     "This package provides JIT debug interfaces support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-ittapi-sys-0.4
  (package
    (name "rust-ittapi-sys")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z7lgc7gwlhcvkdk6bg9sf1ww4w0b41blp90hv4a4kq6ji9kixaj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi-sys")
    (synopsis "Rust bindings for ittapi")
    (description "This package provides Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-ittapi-0.4
  (package
    (name "rust-ittapi")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cb41dapbximlma0vnar144m2j2km44g8g6zmv6ra4y42kk6z6bb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-ittapi-sys" ,rust-ittapi-sys-0.4)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi")
    (synopsis "High-level Rust bindings for ittapi")
    (description "This package provides High-level Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-wasmtime-jit-16
  (package
    (name "rust-wasmtime-jit")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sqcq588s5jvp8q6yss9chalp6jb5m6hiy78b647s9j9vmm371gl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-addr2line" ,rust-addr2line-0.21)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.3)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-ittapi" ,rust-ittapi-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.32)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-16)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-16)
                       ("rust-wasmtime-jit-icache-coherence" ,rust-wasmtime-jit-icache-coherence-16)
                       ("rust-wasmtime-runtime" ,rust-wasmtime-runtime-16)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT-style execution for WebAsssembly code in Cranelift")
    (description
     "This package provides JIT-style execution for @code{WebAsssembly} code in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-asm-macros-16
  (package
    (name "rust-wasmtime-asm-macros")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-asm-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ffbgicckbfqff6j0bfasdmjbvisnwhz43c247csr8hm7qaaj2v6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining asm functions in Wasmtime")
    (description
     "This package provides Macros for defining asm functions in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-fiber-16
  (package
    (name "rust-wasmtime-fiber")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-fiber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hz4pdl5lsnq6pfh5gvmjwrji8k902w8qgxdf5mrbc1qm39z3v20"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-16)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-16)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-16)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Fiber support for Wasmtime")
    (description "This package provides Fiber support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-versioned-export-macros-16
  (package
    (name "rust-wasmtime-versioned-export-macros")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-versioned-export-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nqhs8cnwff4vgi5wrczcxiaxllda7ipl9zls0fw51wjjmjmap7m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining versioned exports in Wasmtime")
    (description
     "This package provides Macros for defining versioned exports in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-environ-16
  (package
    (name "rust-wasmtime-environ")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-environ" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0m176lpapxyh4582kdkcdqrp5q42c8fsh4savzi87a0d7vxn9sv1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.103)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.32)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.38)
                       ("rust-wasmparser" ,rust-wasmparser-0.118)
                       ("rust-wasmprinter" ,rust-wasmprinter-0.2)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-16)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Standalone environment support for WebAssembly code in Cranelift")
    (description
     "This package provides Standalone environment support for @code{WebAssembly} code in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cranelift-shared-16
  (package
    (name "rust-wasmtime-cranelift-shared")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "036pwsn3vll7lcmvml70fhc4njcmaswjpcb0zyl2sy48fq18j2i9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.103)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.103)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.103)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-object" ,rust-object-0.32)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Base-level integration with Wasmtime and Cranelift")
    (description
     "This package provides Base-level integration with Wasmtime and Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-types-16
  (package
    (name "rust-wasmtime-types")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18865l5v9apph1zp9rhg7cl3bd7zjjmzzm8fvk9dhb3gnn5xp5fr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.103)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.118))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WebAssembly type definitions for Cranelift")
    (description
     "This package provides @code{WebAssembly} type definitions for Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-wasm-0.103
  (package
    (name "rust-cranelift-wasm")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-wasm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "007mn5bx778z6c47pfbygykr0frayg733z0mqq55gr34haz0l3rq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.103)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.103)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.103)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.118)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Translator from WebAssembly to Cranelift IR")
    (description
     "This package provides Translator from @code{WebAssembly} to Cranelift IR.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-native-0.103
  (package
    (name "rust-cranelift-native")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-native" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18dl3plmy0kpaqc0l8hi66p1h61yqm5bcbax39vsbvgamznz07ih"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.103)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for targeting the host with Cranelift")
    (description
     "This package provides Support for targeting the host with Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-frontend-0.103
  (package
    (name "rust-cranelift-frontend")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-frontend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pqrpw5bpan9mzh7n57pdmp8bffjdwnxr0bnqcp6clz6156wj4m6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.103)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-regalloc2-0.9
  (package
    (name "rust-regalloc2")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regalloc2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19i94jyjma82hgyf5wj83zkqc5wnfxnh38k3lcj7m6w7ki9ns5dd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from @code{IonMonkey}.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-isle-0.103
  (package
    (name "rust-cranelift-isle")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-isle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k15y8xh1jhsbl5mfxwamhk4s7dgapynylwvsavp04gbmcq9inw5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language for instruction selection in Cranelift")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-control-0.103
  (package
    (name "rust-cranelift-control")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-control" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lw07ilavl8ck71z0x9281dv6mh82r8dk8r73lw4sh21adcrrp7p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "White-box fuzz testing framework")
    (description "This package provides White-box fuzz testing framework.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-shared-0.103
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c3kh2x42ks02rr67idxqm6lfv6x6f2zr247vkypgzpsas606fbj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "This package provides For code shared between cranelift-codegen-meta and cranelift-codegen.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-meta-0.103
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-meta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qs4m5hrxxl0v1jk4zzhw4acm7znvm6sr9gn9fbqyhynl6szx435"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.103))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-entity-0.103
  (package
    (name "rust-cranelift-entity")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-entity" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xx3paak3pnsbi99myknazrv7jrjjqpydxzdpilnqxy45x9yxqs4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description
     "This package provides Data structures using entity references as mapping keys.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-bforest-0.103
  (package
    (name "rust-cranelift-bforest")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bforest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14lbvigsdkzmk5z5xzf2p8j267snkj33js7dyw137gcm1cn588kw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.103))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-0.103
  (package
    (name "rust-cranelift-codegen")
    (version "0.103.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n00c2g1cpd599hdzyaj54l5fy1c0pdvavgaw96qm71fxw1vjgbb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-capstone" ,rust-capstone-0.9)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.103)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.103)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.103)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.103)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.103)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.103)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "This package provides Low-level code generator library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cranelift-16
  (package
    (name "rust-wasmtime-cranelift")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18nbw4chnq40py3a986kf6hirxv9ap6kf8mhjc8939v4825qqr1d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.103)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.103)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.103)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.103)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.103)
                       ("rust-cranelift-wasm" ,rust-cranelift-wasm-0.103)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.32)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.118)
                       ("rust-wasmtime-cranelift-shared" ,rust-wasmtime-cranelift-shared-16)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-16)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-16))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Cranelift and Wasmtime")
    (description
     "This package provides Integration between Cranelift and Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wit-parser-0.13
  (package
    (name "rust-wit-parser")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "022yfbn0sldlglxsf4wcdw9xyifh50vvqf9wn2j5lpq0y2lkcsri"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-parser")
    (synopsis
     "Tooling for parsing `*.wit` files and working with their contents.")
    (description
     "This package provides Tooling for parsing `*.wit` files and working with their contents.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-wit-bindgen-16
  (package
    (name "rust-wasmtime-wit-bindgen")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wit-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0aq6d385lnglaf1a9vp01g0a8k9spvanx23fflj069whlvab4a7k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-wit-parser" ,rust-wit-parser-0.13))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Internal `*.wit` support for the `wasmtime` crate's macros")
    (description
     "This package provides Internal `*.wit` support for the `wasmtime` crate's macros.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-component-util-16
  (package
    (name "rust-wasmtime-component-util")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17gdvgjb0ll4jqid074nf0i2pipbyj2hmh2lycc4h6nj31nd11wc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Utility types and functions to support the component model in Wasmtime")
    (description
     "This package provides Utility types and functions to support the component model in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-component-macro-16
  (package
    (name "rust-wasmtime-component-macro")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1981kyai4yni72krjv1dgq6zkjq6m96h9sarqghn9r946dj35vqj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-16)
                       ("rust-wasmtime-wit-bindgen" ,rust-wasmtime-wit-bindgen-16)
                       ("rust-wit-parser" ,rust-wit-parser-0.13))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for deriving component interface types from Rust types")
    (description
     "This package provides Macros for deriving component interface types from Rust types.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cache-16
  (package
    (name "rust-wasmtime-cache")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cache" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1525dzivf8hj657qg7c9xiamncxh1kpl2rqw77wh48498cvkgkm3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-directories-next" ,rust-directories-next-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-windows-sys" ,rust-windows-sys-0.48)
                       ("rust-zstd" ,rust-zstd-0.11))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for automatic module caching with Wasmtime")
    (description
     "This package provides Support for automatic module caching with Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-fxprof-processed-profile-0.6
  (package
    (name "rust-fxprof-processed-profile")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fxprof-processed-profile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ggsn3im2bfcnxic0jzk00qgiacfrg2as6i4d8kj87kzxl52rl97"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-debugid" ,rust-debugid-0.8)
                       ("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/mstange/samply/")
    (synopsis
     "Create profiles in the Firefox Profiler's processed profile JSON format")
    (description
     "This package provides Create profiles in the Firefox Profiler's processed profile JSON format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmtime-16
  (package
    (name "rust-wasmtime")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gr3lghhjh192prjq66fxq25k96vxnzagpy4lcp45594xpykkrd8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-fxprof-processed-profile" ,rust-fxprof-processed-profile-0.6)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.32)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.38)
                       ("rust-wasmparser" ,rust-wasmparser-0.118)
                       ("rust-wasmtime-cache" ,rust-wasmtime-cache-16)
                       ("rust-wasmtime-component-macro" ,rust-wasmtime-component-macro-16)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-16)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-16)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-16)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-16)
                       ("rust-wasmtime-jit" ,rust-wasmtime-jit-16)
                       ("rust-wasmtime-runtime" ,rust-wasmtime-runtime-16)
                       ("rust-wasmtime-winch" ,rust-wasmtime-winch-16)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "High-level API to expose the Wasmtime runtime")
    (description
     "This package provides High-level API to expose the Wasmtime runtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-indexmap-nostd-0.4
  (package
    (name "rust-indexmap-nostd")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indexmap-nostd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "145mrkrrnzzg8xbv6si8j3b8cw1pi3g13vrjgf1fm2415gyy414f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/robbepop/indexmap-nostd")
    (synopsis "no_std compatible implementation of the indexmap crate")
    (description
     "This package provides a no_std compatible implementation of the indexmap crate.")
    (license license:asl2.0)))

(define-public rust-wasmparser-nostd-0.100
  (package
    (name "rust-wasmparser-nostd")
    (version "0.100.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser-nostd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ak4bi9k9jb223xw7mlxkgim6lp7m8bwfqhlpfa4ll7kjpz1b86m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap-nostd" ,rust-indexmap-nostd-0.4))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmi-core-0.13
  (package
    (name "rust-wasmi-core")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmi_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sl5356hb8iz3l297jvd4ml62fhcq0h2f031qa2mpydz6kdsgwfw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-downcast-rs" ,rust-downcast-rs-1)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-paste" ,rust-paste-1))))
    (home-page "https://github.com/wasmi-labs/wasmi")
    (synopsis "Core primitives for the wasmi WebAssembly interpreter")
    (description
     "This package provides Core primitives for the wasmi @code{WebAssembly} interpreter.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmi-arena-0.4
  (package
    (name "rust-wasmi-arena")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmi_arena" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wvhfah2ccvhl4vwycbncfcnb78ndgbkac3v56n0qms4prrpyjhh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/paritytech/wasmi")
    (synopsis "Entity arena data structures for wasmi")
    (description
     "This package provides Entity arena data structures for wasmi.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmi-0.31
  (package
    (name "rust-wasmi")
    (version "0.31.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1isnchb3vd6cndfrjfiql6nhq9qcvnfzlgkaqxady3363lfjia3p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-smallvec" ,rust-smallvec-1)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-wasmi-arena" ,rust-wasmi-arena-0.4)
                       ("rust-wasmi-core" ,rust-wasmi-core-0.13)
                       ("rust-wasmparser-nostd" ,rust-wasmparser-nostd-0.100))))
    (home-page "https://github.com/wasmi-labs/wasmi")
    (synopsis "WebAssembly interpreter")
    (description "This package provides @code{WebAssembly} interpreter.")
    (license (list license:expat license:asl2.0))))

(define-public rust-siphasher-1
  (package
    (name "rust-siphasher")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "siphasher" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17f35782ma3fn6sh21c027kjmd227xyrx06ffi8gw4xzv9yry6an"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://docs.rs/siphasher")
    (synopsis "SipHash-2-4, SipHash-1-3 and 128-bit variants in pure Rust")
    (description
     "This package provides @code{SipHash-2-4}, @code{SipHash-1-3} and 128-bit variants in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ed25519-zebra-4
  (package
    (name "rust-ed25519-zebra")
    (version "4.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ed25519-zebra" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ab55w7w6hh7hyyjg507ki7hrz0w9nygyifdjrc43m559n3yd73x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-curve25519-dalek" ,rust-curve25519-dalek-4)
                       ("rust-der" ,rust-der-0.7)
                       ("rust-ed25519" ,rust-ed25519-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-pkcs8" ,rust-pkcs8-0.10)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/ZcashFoundation/ed25519-zebra")
    (synopsis "Zcash-flavored Ed25519 for use in Zebra")
    (description
     "This package provides Zcash-flavored Ed25519 for use in Zebra.")
    (license (list license:expat license:asl2.0))))

(define-public rust-semver-0.2
  (package
    (name "rust-semver")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gv28l5ggain32flkvw3sss0szz810y3pjw89vciaf7hl4w7cnrd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-nom" ,rust-nom-1))))
    (home-page "https://github.com/dtolnay/semver")
    (synopsis "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (description
     "This package provides Parser and evaluator for Cargo's flavor of Semantic Versioning.")
    (license (list license:expat license:asl2.0))))

(define-public rust-regex-syntax-0.2
  (package
    (name "rust-regex-syntax")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-syntax" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1irxgdwh1vwb2sys0gqdicjspf9z6nzgpbnivviliyjdbb73a6d2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-lang/regex/tree/master/regex-syntax")
    (synopsis "regular expression parser.")
    (description "This package provides a regular expression parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clippy-0.0.41
  (package
    (name "rust-clippy")
    (version "0.0.41")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clippy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03fhqby8cpcbr3fbfk5c9wmrlm259ig38q3pgx27vg195mvr9iq0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-regex-syntax" ,rust-regex-syntax-0.2)
                       ("rust-semver" ,rust-semver-0.2)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
    (home-page "https://github.com/rust-lang-nursery/rust-clippy")
    (synopsis "bunch of helpful lints to avoid common pitfalls in Rust.")
    (description
     "This package provides a bunch of helpful lints to avoid common pitfalls in Rust.")
    (license #f #;unknown-license!)))

(define-public rust-blake2-rfc-0.2
  (package
    (name "rust-blake2-rfc")
    (version "0.2.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blake2-rfc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0034g47hyq2bzmk40895ill1mbnpmmjakdq3dmm9clidvl5m6vax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.4)
                       ("rust-clippy" ,rust-clippy-0.0.41)
                       ("rust-constant-time-eq" ,rust-constant-time-eq-0.1))))
    (home-page "https://github.com/cesarb/blake2-rfc")
    (synopsis "pure Rust implementation of BLAKE2 based on RFC 7693.")
    (description
     "This package provides a pure Rust implementation of BLAKE2 based on RFC 7693.")
    (license (list license:expat license:asl2.0))))

(define-public rust-smoldot-0.16
  (package
    (name "rust-smoldot")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smoldot" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fd96vvydlw8h5pylmxkcf3l8y1vpg8zlzqyd814vgkpgnlymlg6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-async-lock" ,rust-async-lock-3)
                       ("rust-atomic-take" ,rust-atomic-take-1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bip39" ,rust-bip39-2)
                       ("rust-blake2-rfc" ,rust-blake2-rfc-0.2)
                       ("rust-bs58" ,rust-bs58-0.5)
                       ("rust-chacha20" ,rust-chacha20-0.9)
                       ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.3)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-ed25519-zebra" ,rust-ed25519-zebra-4)
                       ("rust-either" ,rust-either-1)
                       ("rust-event-listener" ,rust-event-listener-4)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-futures-lite" ,rust-futures-lite-2)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-itertools" ,rust-itertools-0.12)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-libsecp256k1" ,rust-libsecp256k1-0.7)
                       ("rust-merlin" ,rust-merlin-3)
                       ("rust-no-std-net" ,rust-no-std-net-0.6)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-rational" ,rust-num-rational-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.12)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-poly1305" ,rust-poly1305-0.8)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rand-chacha" ,rust-rand-chacha-0.3)
                       ("rust-rusqlite" ,rust-rusqlite-0.30)
                       ("rust-ruzstd" ,rust-ruzstd-0.5)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-siphasher" ,rust-siphasher-1)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-soketto" ,rust-soketto-0.7)
                       ("rust-twox-hash" ,rust-twox-hash-1)
                       ("rust-wasmi" ,rust-wasmi-0.31)
                       ("rust-wasmtime" ,rust-wasmtime-16)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/smol-dot/smoldot")
    (synopsis "Primitives to build a client for Substrate-based blockchains")
    (description
     "This package provides Primitives to build a client for Substrate-based blockchains.")
    (license (list license:gpl3+ #;unknown-license!))))

(define-public rust-subxt-lightclient-0.34
  (package
    (name "rust-subxt-lightclient")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt-lightclient" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0l459d6gf57iwim5n286rn80jfc4jmyhq7fdixhc7h3vp9k71v7c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-either" ,rust-either-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-futures-timer" ,rust-futures-timer-3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-instant" ,rust-instant-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-send-wrapper" ,rust-send-wrapper-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smoldot" ,rust-smoldot-0.16)
                       ("rust-smoldot-light" ,rust-smoldot-light-0.14)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://www.parity.io/")
    (synopsis "Light Client for chain interaction")
    (description "This package provides Light Client for chain interaction.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-sp-weights-27
  (package
    (name "rust-sp-weights")
    (version "27.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-weights" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p5am9f9v79a49ns8hchy815nm6xmr77m1mpym135zfkkpglp1wy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bounded-collections" ,rust-bounded-collections-0.1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sp-arithmetic" ,rust-sp-arithmetic-23)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis
     "Types and traits for interfacing between the host and the wasm runtime. (polkadot v1.10.0)")
    (description
     "This package provides Types and traits for interfacing between the host and the wasm runtime.
(polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-sp-arithmetic-23
  (package
    (name "rust-sp-arithmetic")
    (version "23.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-arithmetic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qxddc24gg3783i9y34g88kvq3rw7cmgbs3jl29g48dlfbq229zl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-integer-sqrt" ,rust-integer-sqrt-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://substrate.io")
    (synopsis
     "Minimal fixed point arithmetic primitives and types for runtime. (polkadot v1.10.0)")
    (description
     "This package provides Minimal fixed point arithmetic primitives and types for runtime. (polkadot
v1.10.0).")
    (license license:asl2.0)))

(define-public rust-sp-trie-29
  (package
    (name "rust-sp-trie")
    (version "29.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-trie" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16s7rn1s4dh1f5330zrcfbxzgvg1h0cv9hfa3nkl9sqb9bc28k9f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-memory-db" ,rust-memory-db-0.32)
                       ("rust-nohash-hasher" ,rust-nohash-hasher-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schnellru" ,rust-schnellru-0.2)
                       ("rust-sp-core" ,rust-sp-core-28)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.25)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-trie-db" ,rust-trie-db-0.28)
                       ("rust-trie-root" ,rust-trie-root-0.18))))
    (home-page "https://substrate.io")
    (synopsis
     "Patricia trie stuff using a parity-scale-codec node format (polkadot v1.15.0)")
    (description
     "This package provides Patricia trie stuff using a parity-scale-codec node format (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-state-machine-0.35
  (package
    (name "rust-sp-state-machine")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-state-machine" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pwqzckmzfv3xwci6fjbj74bai7s6c5h7kn7cjzc1z6ns6d7g33i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sp-core" ,rust-sp-core-28)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.25)
                       ("rust-sp-panic-handler" ,rust-sp-panic-handler-13)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-trie" ,rust-sp-trie-29)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-trie-db" ,rust-trie-db-0.28))))
    (home-page "https://substrate.io")
    (synopsis "Substrate State Machine (polkadot v1.15.0)")
    (description
     "This package provides Substrate State Machine (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-keystore-0.34
  (package
    (name "rust-sp-keystore")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-keystore" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p3371bbz70rz4pjmi65yy8960jd6jqmg25js3ndvn9flql6m04n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-sp-core" ,rust-sp-core-28)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.25)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://substrate.io")
    (synopsis "Keystore primitives. (polkadot v1.13.0)")
    (description
     "This package provides Keystore primitives. (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-sp-io-30
  (package
    (name "rust-sp-io")
    (version "30.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-io" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12lb0vfxjzmrqpb4ysjcig6jj4z8w7hvd20nz3xg1npfkzc2cpy5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-ed25519-dalek" ,rust-ed25519-dalek-2)
                       ("rust-libsecp256k1" ,rust-libsecp256k1-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-secp256k1" ,rust-secp256k1-0.28)
                       ("rust-sp-core" ,rust-sp-core-28)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.25)
                       ("rust-sp-keystore" ,rust-sp-keystore-0.34)
                       ("rust-sp-runtime-interface" ,rust-sp-runtime-interface-24)
                       ("rust-sp-state-machine" ,rust-sp-state-machine-0.35)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-tracing" ,rust-sp-tracing-16)
                       ("rust-sp-trie" ,rust-sp-trie-29)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1))))
    (home-page "https://substrate.io")
    (synopsis "I/O for Substrate runtimes (polkadot v1.15.0)")
    (description
     "This package provides I/O for Substrate runtimes (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-application-crypto-30
  (package
    (name "rust-sp-application-crypto")
    (version "30.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-application-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w9wyxbx9nh4kapncsx469yxj03r7kxy40djf9iag7gsnylyfkvy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-core" ,rust-sp-core-28)
                       ("rust-sp-io" ,rust-sp-io-30)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis
     "Provides facilities for generating application specific crypto wrapper types. (polkadot v1.15.0)")
    (description
     "This package provides facilities for generating application specific crypto
wrapper types. (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-runtime-31
  (package
    (name "rust-sp-runtime")
    (version "31.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14cx340zqdcvws5f7dgipagmdav48ppipm6kvyc02fax8yj4kfx3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-docify" ,rust-docify-0.2)
                       ("rust-either" ,rust-either-1)
                       ("rust-hash256-std-hasher" ,rust-hash256-std-hasher-0.15)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-simple-mermaid" ,rust-simple-mermaid-0.1)
                       ("rust-sp-application-crypto" ,rust-sp-application-crypto-30)
                       ("rust-sp-arithmetic" ,rust-sp-arithmetic-23)
                       ("rust-sp-core" ,rust-sp-core-28)
                       ("rust-sp-io" ,rust-sp-io-30)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-weights" ,rust-sp-weights-27))))
    (home-page "https://substrate.io")
    (synopsis "Runtime Modules shared primitive types. (polkadot v1.15.0)")
    (description
     "This package provides Runtime Modules shared primitive types. (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-runtime-interface-24
  (package
    (name "rust-sp-runtime-interface")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime-interface" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yz6hdwysyadihvk8wagv3ahahxxkhfnqcw9cbx8bmy3rvc6cszn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.25)
                       ("rust-sp-runtime-interface-proc-macro" ,rust-sp-runtime-interface-proc-macro-17)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-19)
                       ("rust-sp-tracing" ,rust-sp-tracing-16)
                       ("rust-sp-wasm-interface" ,rust-sp-wasm-interface-20)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://substrate.io")
    (synopsis "Substrate runtime interface (polkadot v1.13.0)")
    (description
     "This package provides Substrate runtime interface (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-sp-storage-19
  (package
    (name "rust-sp-storage")
    (version "19.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-storage" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ax3wg9c3dxii34iqizcyxxbsg351fcds83fdn2qlfh34ixjvf8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-ref-cast" ,rust-ref-cast-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis "Storage related primitives (polkadot v1.10.0)")
    (description
     "This package provides Storage related primitives (polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-sp-externalities-0.25
  (package
    (name "rust-sp-externalities")
    (version "0.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-externalities" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "170a8yxv4sanji9zca98vzpv3cbxlh1akfxi986xkkjhb747x1k3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-environmental" ,rust-environmental-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-19))))
    (home-page "https://substrate.io")
    (synopsis "Substrate externalities abstraction (polkadot v1.13.0)")
    (description
     "This package provides Substrate externalities abstraction (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-sp-core-hashing-15
  (package
    (name "rust-sp-core-hashing")
    (version "15.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-core-hashing" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c2kjl4wrh002l7155i1rc9dkd4vm7pw10x8xkywxcnpmn84j3qy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blake2b-simd" ,rust-blake2b-simd-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://substrate.io")
    (synopsis
     "Hashing primitives (deprecated: use sp-crypto-hashing for new applications)")
    (description
     "This package provides Hashing primitives (deprecated: use sp-crypto-hashing for new applications).")
    (license license:asl2.0)))

(define-public rust-bounded-collections-0.1
  (package
    (name "rust-bounded-collections")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bounded-collections" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1p9085sdk8wl6l3x4rq3wcsi922n1h9zv0pbqmyhcwmqcdhqnm6a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-1)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Bounded types and their supporting traits")
    (description
     "This package provides Bounded types and their supporting traits.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sp-core-28
  (package
    (name "rust-sp-core")
    (version "28.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01s0rg3i6wa5m42f7ma1lsws08w4jlalh5zwl06hfmalaw9cnc7j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-array-bytes" ,rust-array-bytes-6)
                       ("rust-bip39" ,rust-bip39-2)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-bounded-collections" ,rust-bounded-collections-0.1)
                       ("rust-bs58" ,rust-bs58-0.5)
                       ("rust-dyn-clonable" ,rust-dyn-clonable-0.9)
                       ("rust-ed25519-zebra" ,rust-ed25519-zebra-3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-hash256-std-hasher" ,rust-hash256-std-hasher-0.15)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-libsecp256k1" ,rust-libsecp256k1-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-merlin" ,rust-merlin-3)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-secp256k1" ,rust-secp256k1-0.28)
                       ("rust-secrecy" ,rust-secrecy-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-core-hashing" ,rust-sp-core-hashing-15)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.25)
                       ("rust-sp-runtime-interface" ,rust-sp-runtime-interface-24)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-19)
                       ("rust-ss58-registry" ,rust-ss58-registry-1)
                       ("rust-substrate-bip39" ,rust-substrate-bip39-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-w3f-bls" ,rust-w3f-bls-0.1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://substrate.io")
    (synopsis "Shareable Substrate types. (polkadot v1.13.0)")
    (description
     "This package provides Shareable Substrate types. (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-yap-0.11
  (package
    (name "rust-yap")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kr49a96x7p1fjpj7vdvpk00q1q7clfyp36p12x9wqn49chj8igz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/jsdw/yap")
    (synopsis
     "Yet Another Parser library. A lightweight, dependency free, parser combinator inspired set of utility methods to help with parsing strings and slices")
    (description
     "This package provides Yet Another Parser library.  A lightweight, dependency free, parser combinator
inspired set of utility methods to help with parsing strings and slices.")
    (license license:expat)))

(define-public rust-frame-metadata-15
  (package
    (name "rust-frame-metadata")
    (version "15.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "frame-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1700vwilkm2kk5r65dkg3vr5yx02zy1xhbzcfz633rrnn6qap2w7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       ;; #:features '("v14") ???
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://substrate.dev")
    (synopsis "Metadata types for Substrate runtimes")
    (description
     "This package provides Metadata types for Substrate runtimes.")
    (license license:asl2.0)))

(define-public rust-scale-value-0.13
  (package
    (name "rust-scale-value")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-value" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12c019p7r39m6811hx6mg3rnf41d8zqadbn98dmx82xzj5v3q8jq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #f
       #:cargo-inputs (("rust-base58" ,rust-base58-0.2)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-either" ,rust-either-1)
                       ("rust-frame-metadata" ,rust-frame-metadata-15)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-bits" ,rust-scale-bits-0.4)
                       ("rust-scale-decode" ,rust-scale-decode-0.10)
                       ("rust-scale-encode" ,rust-scale-encode-0.5)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-yap" ,rust-yap-0.11))))
    (home-page "https://www.parity.io/")
    (synopsis "Encode and decode values of arbitrary shapes to SCALE bytes")
    (description
     "This package provides Encode and decode values of arbitrary shapes to SCALE bytes.")
    (license license:asl2.0)))

(define-public rust-scale-encode-derive-0.5
  (package
    (name "rust-scale-encode-derive")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-encode-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09bsf2j9awj6lm80fla7xascxgrj1qa4d9ynjvm6pp7g23qr2m4r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.14)
                       ("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Derive macro for scale-encode")
    (description "This package provides Derive macro for scale-encode.")
    (license license:asl2.0)))

(define-public rust-scale-encode-0.5
  (package
    (name "rust-scale-encode")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-encode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rcdqxaadl1y62v7bljdl4j55mlmzxkxa7mc7x40a09n555wnw3d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-scale-bits" ,rust-scale-bits-0.4)
                       ("rust-scale-encode-derive" ,rust-scale-encode-derive-0.5)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Encode types to SCALE bytes given a desired target type")
    (description
     "This package provides Encode types to SCALE bytes given a desired target type.")
    (license license:asl2.0)))

(define-public rust-darling-macro-0.14
  (package
    (name "rust-darling-macro")
    (version "0.14.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling_macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13mlyd5w275c815k0ijf6g4c446hs8b3m2h4an5isqgpr7dv9am4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling-core" ,rust-darling-core-0.14)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
     "Internal support for a proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.")
    (description
     "This package provides Internal support for a proc-macro library for reading attributes into structs
when implementing custom derives.  Use https://crates.io/crates/darling in your
code.")
    (license license:expat)))

(define-public rust-darling-core-0.14
  (package
    (name "rust-darling-core")
    (version "0.14.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w4b2ndxmkwghwq84yphk8x15jnpivm08w596g12ry5pwsk1r70h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fnv" ,rust-fnv-1)
                       ("rust-ident-case" ,rust-ident-case-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-strsim" ,rust-strsim-0.10)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
     "Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.")
    (description
     "This package provides Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives.  Use https://crates.io/crates/darling in your code.")
    (license license:expat)))

(define-public rust-darling-0.14
  (package
    (name "rust-darling")
    (version "0.14.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0l1qrn805bsxa0iy7x8bmdwr8c10hlw0yiqs8ckv7lbz86rhqxbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling-core" ,rust-darling-core-0.14)
                       ("rust-darling-macro" ,rust-darling-macro-0.14))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis "proc-macro library for reading attributes into structs when
implementing custom derives.")
    (description
     "This package provides a proc-macro library for reading attributes into structs
when implementing custom derives.")
    (license license:expat)))

(define-public rust-scale-decode-derive-0.10
  (package
    (name "rust-scale-decode-derive")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-decode-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nv6d5lbkb1hw2d3rwj55y5mk6hh617rfraw3gypwb5nl4452iyk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-darling" ,rust-darling-0.14)
                       ("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Derive macro for scale-decode")
    (description "This package provides Derive macro for scale-decode.")
    (license license:asl2.0)))

(define-public rust-scale-decode-0.10
  (package
    (name "rust-scale-decode")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-decode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xpz008c4qg150kf7q148xk8qn839wbj1yva5isv86pdz19zgakw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-scale-bits" ,rust-scale-bits-0.4)
                       ("rust-scale-decode-derive" ,rust-scale-decode-derive-0.10)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Decode SCALE encoded bytes into arbitrary types at runtime")
    (description
     "This package provides Decode SCALE encoded bytes into arbitrary types at runtime.")
    (license license:asl2.0)))

(define-public rust-scale-bits-0.4
  (package
    (name "rust-scale-bits")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-bits" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12cxjsk16q6yhqvv6nf1kixgw8znvdas0zzvdy3f9dprkb17ar83"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://www.parity.io/")
    (synopsis "SCALE compatible representation of a collection of bits")
    (description
     "This package provides a SCALE compatible representation of a collection of bits.")
    (license license:asl2.0)))

(define-public rust-jsonrpsee-ws-client-0.21
  (package
    (name "rust-jsonrpsee-ws-client")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-ws-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bdvhypr6s5k5bfq6rif195dzazhl3wkv2x83x8lp778f5s0fg07"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-http" ,rust-http-0.2)
                       ("rust-jsonrpsee-client-transport" ,rust-jsonrpsee-client-transport-0.21)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.21)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.21)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC websocket client")
    (description "This package provides JSON-RPC websocket client.")
    (license license:expat)))

(define-public rust-jsonrpsee-wasm-client-0.21
  (package
    (name "rust-jsonrpsee-wasm-client")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-wasm-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h4nz9nsnpyp1qd29xvvhi870dpvxis0nqy1al1zq3ixa0knvwrh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jsonrpsee-client-transport" ,rust-jsonrpsee-client-transport-0.21)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.21)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.21))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC WASM client")
    (description "This package provides JSON-RPC WASM client.")
    (license license:expat)))

(define-public rust-jsonrpsee-server-0.21
  (package
    (name "rust-jsonrpsee-server")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-server" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "160gx0nq0dw29n8wsx6v13sx08zqv68a7102h4sn33y5lb8wdisw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.21)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.21)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-route-recognizer" ,rust-route-recognizer-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-soketto" ,rust-soketto-0.7)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC server that supports HTTP and WebSocket transports")
    (description
     "This package provides JSON-RPC server that supports HTTP and @code{WebSocket} transports.")
    (license license:expat)))

(define-public rust-jsonrpsee-proc-macros-0.21
  (package
    (name "rust-jsonrpsee-proc-macros")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-proc-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1459y0hl6bnssrc3ki4mcqlsv4vg3vw3n5g1i3k3f9sf0c2pajyr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro-crate" ,rust-proc-macro-crate-2)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Procedueral macros for jsonrpsee")
    (description "This package provides Procedueral macros for jsonrpsee.")
    (license license:expat)))

(define-public rust-jsonrpsee-http-client-0.21
  (package
    (name "rust-jsonrpsee-http-client")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-http-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wjmn5s2aih7kp6by6nfkg0mc6vw9lch7zbpxf2mkn8r6agxxdvq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-hyper-rustls" ,rust-hyper-rustls-0.24)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.21)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.21)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC HTTP client")
    (description "This package provides JSON-RPC HTTP client.")
    (license license:expat)))

(define-public rust-jsonrpsee-types-0.21
  (package
    (name "rust-jsonrpsee-types")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06ydw69860f6kl6dg5r5dcxb4jwihh0gwbbwqwj4n5y98nqdyrij"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-beef" ,rust-beef-0.5)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC v2 specific types")
    (description "This package provides JSON-RPC v2 specific types.")
    (license license:expat)))

(define-public rust-jsonrpsee-core-0.21
  (package
    (name "rust-jsonrpsee-core")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v23kr0q2ppw9gc7vrx4dkb7aigrjskm7l707307h6sr5yg00vbp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-lock" ,rust-async-lock-3)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-beef" ,rust-beef-0.5)
                       ("rust-futures-timer" ,rust-futures-timer-3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.21)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4))))
    (home-page "https://www.parity.io/")
    (synopsis "Utilities for jsonrpsee")
    (description "This package provides Utilities for jsonrpsee.")
    (license license:expat)))

(define-public rust-jsonrpsee-client-transport-0.21
  (package
    (name "rust-jsonrpsee-client-transport")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-client-transport" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "084j8b5cniyvl909l4i6p48q4s9i4pi2dwbm35ldba4hcpa9x7rz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-gloo-net" ,rust-gloo-net-0.5)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.21)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-soketto" ,rust-soketto-0.7)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC client transports")
    (description "This package provides JSON-RPC client transports.")
    (license license:expat)))

(define-public rust-jsonrpsee-0.21
  (package
    (name "rust-jsonrpsee")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ckr5kc1fijvvmqlkkdpms4k9jbfazczgw62p8ka03dkkz5d0ycm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jsonrpsee-client-transport" ,rust-jsonrpsee-client-transport-0.21)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.21)
                       ("rust-jsonrpsee-http-client" ,rust-jsonrpsee-http-client-0.21)
                       ("rust-jsonrpsee-proc-macros" ,rust-jsonrpsee-proc-macros-0.21)
                       ("rust-jsonrpsee-server" ,rust-jsonrpsee-server-0.21)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.21)
                       ("rust-jsonrpsee-wasm-client" ,rust-jsonrpsee-wasm-client-0.21)
                       ("rust-jsonrpsee-ws-client" ,rust-jsonrpsee-ws-client-0.21)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC client/server framework")
    (description "This package provides JSON-RPC client/server framework.")
    (license license:expat)))

(define-public rust-subxt-0.34
  (package
    (name "rust-subxt")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gcz03h91g9kx4zf6kimk5xr6bv03ybyxh9x0jfi72w94xf3scmk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base58" ,rust-base58-0.2)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-either" ,rust-either-1)
                       ("rust-frame-metadata" ,rust-frame-metadata-16)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-instant" ,rust-instant-0.1)
                       ("rust-jsonrpsee" ,rust-jsonrpsee-0.21)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-scale-bits" ,rust-scale-bits-0.4)
                       ("rust-scale-decode" ,rust-scale-decode-0.10)
                       ("rust-scale-encode" ,rust-scale-encode-0.5)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-scale-value" ,rust-scale-value-0.13)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sp-core" ,rust-sp-core-28)
                       ("rust-sp-core-hashing" ,rust-sp-core-hashing-15)
                       ("rust-sp-runtime" ,rust-sp-runtime-31)
                       ("rust-subxt-lightclient" ,rust-subxt-lightclient-0.34)
                       ("rust-subxt-macro" ,rust-subxt-macro-0.34)
                       ("rust-subxt-metadata" ,rust-subxt-metadata-0.34)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://www.parity.io/")
    (synopsis "Submit extrinsics (transactions) to a substrate node via RPC")
    (description
     "This package provides Submit extrinsics (transactions) to a substrate node via RPC.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-reconnecting-jsonrpsee-ws-client-0.3
  (package
    (name "rust-reconnecting-jsonrpsee-ws-client")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "reconnecting-jsonrpsee-ws-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kzm6pacswnmd4i66in1xg5wbhavpv6jx6ssyhd8zf0x09xwz98f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures" ,rust-futures-0.3)
                       ("rust-jsonrpsee" ,rust-jsonrpsee-0.22)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-subxt" ,rust-subxt-0.34)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-retry" ,rust-tokio-retry-0.3)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/niklasad1/reconnecting-jsonrpsee-ws-client")
    (synopsis
     "jsonrpc-ws-client that reconnects automatically. Warning: It may lose subscription messages when reconnecting")
    (description
     "This package provides jsonrpc-ws-client that reconnects automatically.  Warning: It may lose
subscription messages when reconnecting.")
    (license license:expat)))

(define-public rust-jsonrpsee-ws-client-0.22
  (package
    (name "rust-jsonrpsee-ws-client")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-ws-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w5hpadhhchllv2zdhjv6h523bnfz56m08g91i5ikcavzlnxpfaq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-http" ,rust-http-0.2)
                       ("rust-jsonrpsee-client-transport" ,rust-jsonrpsee-client-transport-0.22)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.22)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.22)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC websocket client")
    (description "This package provides JSON-RPC websocket client.")
    (license license:expat)))

(define-public rust-jsonrpsee-wasm-client-0.22
  (package
    (name "rust-jsonrpsee-wasm-client")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-wasm-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xydg6kgrf6djwm391p15sb6m8qwadhw6hhbdixw2p4lrpmdhj7l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jsonrpsee-client-transport" ,rust-jsonrpsee-client-transport-0.22)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.22)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.22))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC WASM client")
    (description "This package provides JSON-RPC WASM client.")
    (license license:expat)))

(define-public rust-route-recognizer-0.3
  (package
    (name "rust-route-recognizer")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "route-recognizer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ikp3blbina00jdbifxw1c9whg6mljli24lq5pv82iar53xr9axg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rustasync/route-recognizer")
    (synopsis
     "Recognizes URL patterns with support for dynamic and wildcard segments")
    (description
     "This package provides Recognizes URL patterns with support for dynamic and wildcard segments.")
    (license license:expat)))

(define-public rust-jsonrpsee-server-0.22
  (package
    (name "rust-jsonrpsee-server")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-server" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hdb4c4vvhjh0c6wha35m3njlgzbzq9bn2hb5rbsh8j4cylvdn0j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.22)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.22)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-route-recognizer" ,rust-route-recognizer-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-soketto" ,rust-soketto-0.7)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC server that supports HTTP and WebSocket transports")
    (description
     "This package provides JSON-RPC server that supports HTTP and @code{WebSocket} transports.")
    (license license:expat)))

(define-public rust-jsonrpsee-proc-macros-0.22
  (package
    (name "rust-jsonrpsee-proc-macros")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-proc-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h3m7yxqnylh3hw2mm7mqnjc4qlvymmlm5q3x8r3n54swx3v02vx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro-crate" ,rust-proc-macro-crate-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://www.parity.io/")
    (synopsis "Procedueral macros for jsonrpsee")
    (description "This package provides Procedueral macros for jsonrpsee.")
    (license license:expat)))

(define-public rust-jsonrpsee-http-client-0.22
  (package
    (name "rust-jsonrpsee-http-client")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-http-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rf2jlc9iwf5xzqa4lkb6fagww7knwr7qzfka7c0bzhb9by97kqw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-hyper-rustls" ,rust-hyper-rustls-0.24)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.22)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.22)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC HTTP client")
    (description "This package provides JSON-RPC HTTP client.")
    (license license:expat)))

(define-public rust-soketto-0.7
  (package
    (name "rust-soketto")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "soketto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hkf17swk2a7rdj0rxbwwg53p2zpy9274b1w719rdq1rbqqcbla1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.13)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-sha-1" ,rust-sha-1-0.9))))
    (home-page "https://github.com/paritytech/soketto")
    (synopsis "websocket protocol implementation.")
    (description "This package provides a websocket protocol implementation.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-jsonrpsee-types-0.22
  (package
    (name "rust-jsonrpsee-types")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zfhw7g9sqdjil3pdpznf6a9bf2q7y278g0s4fisg42q81l6238m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-beef" ,rust-beef-0.5)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC v2 specific types")
    (description "This package provides JSON-RPC v2 specific types.")
    (license license:expat)))

(define-public rust-jsonrpsee-core-0.22
  (package
    (name "rust-jsonrpsee-core")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vc9gfb3lz2qm7yjmm18ij5mr2wl7y9hppjx4nq0fpiqxkhmgcml"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-beef" ,rust-beef-0.5)
                       ("rust-futures-timer" ,rust-futures-timer-3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.22)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4))))
    (home-page "https://www.parity.io/")
    (synopsis "Utilities for jsonrpsee")
    (description "This package provides Utilities for jsonrpsee.")
    (license license:expat)))

(define-public rust-gloo-utils-0.2
  (package
    (name "rust-gloo-utils")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gloo-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1am31cd6889shb7158bg9zzsjcpvyzxrhfhxgia8rc8k84smam8b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/rustwasm/gloo")
    (synopsis "Convenience crate for common `web_sys` features")
    (description
     "This package provides Convenience crate for common `web_sys` features.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gloo-net-0.5
  (package
    (name "rust-gloo-net")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gloo-net" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wz1xvll8nqzbiwswjswid7xm6332q15yr2wq4i8i6i3s51a5aj3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-gloo-utils" ,rust-gloo-utils-0.2)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/rustwasm/gloo")
    (synopsis "HTTP requests library for WASM Apps")
    (description "This package provides HTTP requests library for WASM Apps.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jsonrpsee-client-transport-0.22
  (package
    (name "rust-jsonrpsee-client-transport")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee-client-transport" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1amki7475ccdampm1mbg20v4a0h351g5wz5hqpph5ay3b1x0hy29"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-gloo-net" ,rust-gloo-net-0.5)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.22)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.7)
                       ("rust-rustls-pki-types" ,rust-rustls-pki-types-1)
                       ("rust-soketto" ,rust-soketto-0.7)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.25)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.26))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC client transports")
    (description "This package provides JSON-RPC client transports.")
    (license license:expat)))

(define-public rust-jsonrpsee-0.22
  (package
    (name "rust-jsonrpsee")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jsonrpsee" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b8nsvmnk01cc44lvcfdg1vkcyq099hfqs9likkb598y72i15nyg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jsonrpsee-client-transport" ,rust-jsonrpsee-client-transport-0.22)
                       ("rust-jsonrpsee-core" ,rust-jsonrpsee-core-0.22)
                       ("rust-jsonrpsee-http-client" ,rust-jsonrpsee-http-client-0.22)
                       ("rust-jsonrpsee-proc-macros" ,rust-jsonrpsee-proc-macros-0.22)
                       ("rust-jsonrpsee-server" ,rust-jsonrpsee-server-0.22)
                       ("rust-jsonrpsee-types" ,rust-jsonrpsee-types-0.22)
                       ("rust-jsonrpsee-wasm-client" ,rust-jsonrpsee-wasm-client-0.22)
                       ("rust-jsonrpsee-ws-client" ,rust-jsonrpsee-ws-client-0.22)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://www.parity.io/")
    (synopsis "JSON-RPC client/server framework")
    (description "This package provides JSON-RPC client/server framework.")
    (license license:expat)))

(define-public rust-frame-metadata-16
  (package
    (name "rust-frame-metadata")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "frame-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14j6wsd5p91f21cjmiyajs79az9ik0bbd197qb56ynm2zd4ibkw7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://substrate.dev")
    (synopsis "Metadata types for Substrate runtimes")
    (description
     "This package provides Metadata types for Substrate runtimes.")
    (license license:asl2.0)))

(define-public rust-base58-0.2
  (package
    (name "rust-base58")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base58" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10gmsivqfg1rpg8rzv1xbdsaa379yplxjy581na6hak8wqdzw1v1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/debris/base58")
    (synopsis "Tiny and fast base58 encoding")
    (description "This package provides Tiny and fast base58 encoding.")
    (license license:expat)))

(define-public rust-subxt-0.35
  (package
    (name "rust-subxt")
    (version "0.35.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subxt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1igvl6s578by5masp1wwiw4jn8ry0mlsyaacmc9ybrad7zrbws5x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base58" ,rust-base58-0.2)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-either" ,rust-either-1)
                       ("rust-frame-metadata" ,rust-frame-metadata-16)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-instant" ,rust-instant-0.1)
                       ("rust-jsonrpsee" ,rust-jsonrpsee-0.22)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-reconnecting-jsonrpsee-ws-client" ,rust-reconnecting-jsonrpsee-ws-client-0.3)
                       ("rust-scale-bits" ,rust-scale-bits-0.5)
                       ("rust-scale-decode" ,rust-scale-decode-0.11)
                       ("rust-scale-encode" ,rust-scale-encode-0.6)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-scale-value" ,rust-scale-value-0.14)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-sp-crypto-hashing" ,rust-sp-crypto-hashing-0.1)
                       ("rust-sp-runtime" ,rust-sp-runtime-34)
                       ("rust-subxt-lightclient" ,rust-subxt-lightclient-0.35)
                       ("rust-subxt-macro" ,rust-subxt-macro-0.35)
                       ("rust-subxt-metadata" ,rust-subxt-metadata-0.35)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://www.parity.io/")
    (synopsis "Submit extrinsics (transactions) to a substrate node via RPC")
    (description
     "This package provides Submit extrinsics (transactions) to a substrate node via RPC.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-strum-macros-0.26
  (package
    (name "rust-strum-macros")
    (version "0.26.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strum_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gl1wmq24b8md527cpyd5bw9rkbqldd7k1h38kf5ajd2ln2ywssc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/Peternator7/strum")
    (synopsis "Helpful macros for working with enums and strings")
    (description
     "This package provides Helpful macros for working with enums and strings.")
    (license license:expat)))

(define-public rust-strum-0.26
  (package
    (name "rust-strum")
    (version "0.26.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01lgl6jvrf4j28v5kmx9bp480ygf1nhvac8b4p7rcj9hxw50zv4g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-phf" ,rust-phf-0.10)
                       ("rust-strum-macros" ,rust-strum-macros-0.26))))
    (home-page "https://github.com/Peternator7/strum")
    (synopsis "Helpful macros for working with enums and strings")
    (description
     "This package provides Helpful macros for working with enums and strings.")
    (license license:expat)))

(define-public rust-sp-std-12
  (package
    (name "rust-sp-std")
    (version "12.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01df33phwyji47lv3ir1qbswhb0ss32h6dhmgg66h9b8crd8risl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://substrate.io")
    (synopsis "Lowest-abstraction level for the Substrate runtime: just exports useful
primitives from std or client/alloc to be used with any code that depends on the
runtime")
    (description "This package provides Lowest-abstraction level for the Substrate runtime: just
exports useful primitives from std or client/alloc to be used with any code that
depends on the runtime.")
    (license license:asl2.0)))

(define-public rust-sp-weights-28
  (package
    (name "rust-sp-weights")
    (version "28.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-weights" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zpj3azqqhf1l6v28syy2zwbmywc2sll3y5cvi8l9684r6p31gm3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bounded-collections" ,rust-bounded-collections-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sp-arithmetic" ,rust-sp-arithmetic-24)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis
     "Types and traits for interfacing between the host and the wasm runtime. (polkadot v1.10.0)")
    (description
     "This package provides Types and traits for interfacing between the host and the wasm runtime.
(polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-sp-arithmetic-24
  (package
    (name "rust-sp-arithmetic")
    (version "24.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-arithmetic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "070kizs7i0w6fpi1sd5x2yimgg42sjddchfbvi3hsjfwbb527a5g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-integer-sqrt" ,rust-integer-sqrt-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://substrate.io")
    (synopsis
     "Minimal fixed point arithmetic primitives and types for runtime. (polkadot v1.10.0)")
    (description
     "This package provides Minimal fixed point arithmetic primitives and types for runtime. (polkadot
v1.10.0).")
    (license license:asl2.0)))

(define-public rust-trie-root-0.18
  (package
    (name "rust-trie-root")
    (version "0.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trie-root" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02vcs14s98nbsh7y15v56zajs8xrdj8fs03r8vxgb65byl733vfl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hash-db" ,rust-hash-db-0.16))))
    (home-page "https://github.com/paritytech/trie")
    (synopsis "In-memory patricia trie operations")
    (description "This package provides In-memory patricia trie operations.")
    (license license:asl2.0)))

(define-public rust-trie-db-0.28
  (package
    (name "rust-trie-db")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trie-db" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hi6c16i35lnn9arav02vfnjyz87ic08w56zplga9zn22pwf0a7z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustc-hex" ,rust-rustc-hex-2)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/paritytech/trie")
    (synopsis "Merkle-Patricia Trie generic over key hasher and node encoding")
    (description
     "This package provides Merkle-Patricia Trie generic over key hasher and node encoding.")
    (license license:asl2.0)))

(define-public rust-schnellru-0.2
  (package
    (name "rust-schnellru")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "schnellru" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rr3n3wgf3ni24n7xz223l956kk27r0mq7nyh02x4m1wm49yza69"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.13))))
    (home-page "https://github.com/koute/schnellru")
    (synopsis "fast and flexible LRU map")
    (description "This package provides a fast and flexible LRU map.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nohash-hasher-0.2
  (package
    (name "rust-nohash-hasher")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nohash-hasher" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lf4p6k01w4wm7zn4grnihzj8s7zd5qczjmzng7wviwxawih5x9b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/paritytech/nohash-hasher")
    (synopsis
     "An implementation of `std::hash::Hasher` which does not hash at all")
    (description
     "This package provides An implementation of `std::hash::Hasher` which does not hash at all.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-memory-db-0.32
  (package
    (name "rust-memory-db")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memory-db" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gkgvncfd8ri9q8ypf272q54raz0a7m1bg33bsj34d198vdm12w0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hash-db" ,rust-hash-db-0.16))))
    (home-page "https://github.com/paritytech/trie")
    (synopsis "In-memory implementation of hash-db, useful for tests")
    (description
     "This package provides In-memory implementation of hash-db, useful for tests.")
    (license license:asl2.0)))

(define-public rust-sp-trie-30
  (package
    (name "rust-sp-trie")
    (version "30.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-trie" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fyxj2ccibhwwwgs29r2jni3bhc6nr7cw40vfhv8n7h80pyqvm7f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-memory-db" ,rust-memory-db-0.32)
                       ("rust-nohash-hasher" ,rust-nohash-hasher-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schnellru" ,rust-schnellru-0.2)
                       ("rust-sp-core" ,rust-sp-core-29)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.26)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-trie-db" ,rust-trie-db-0.28)
                       ("rust-trie-root" ,rust-trie-root-0.18))))
    (home-page "https://substrate.io")
    (synopsis
     "Patricia trie stuff using a parity-scale-codec node format (polkadot v1.15.0)")
    (description
     "This package provides Patricia trie stuff using a parity-scale-codec node format (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-panic-handler-13
  (package
    (name "rust-sp-panic-handler")
    (version "13.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-panic-handler" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05n4k1kj90y3cpls616chchy1rrcnglbc741ifd05phi19xa3xfq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-regex" ,rust-regex-1))))
    (home-page "https://substrate.io")
    (synopsis "Custom panic hook with bug report link")
    (description
     "This package provides Custom panic hook with bug report link.")
    (license license:asl2.0)))

(define-public rust-sp-state-machine-0.36
  (package
    (name "rust-sp-state-machine")
    (version "0.36.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-state-machine" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ydanm92wkn6ydhlky72r4z6s3a258v3z036fxyh4cma0bkrfwm6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sp-core" ,rust-sp-core-29)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.26)
                       ("rust-sp-panic-handler" ,rust-sp-panic-handler-13)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-trie" ,rust-sp-trie-30)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-trie-db" ,rust-trie-db-0.28))))
    (home-page "https://substrate.io")
    (synopsis "Substrate State Machine (polkadot v1.15.0)")
    (description
     "This package provides Substrate State Machine (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-keystore-0.35
  (package
    (name "rust-sp-keystore")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-keystore" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ndrmjxqbxns69sdanazx7rzqwrq3zzi09w813lya74bjr9jsks4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-sp-core" ,rust-sp-core-29)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.26)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://substrate.io")
    (synopsis "Keystore primitives. (polkadot v1.13.0)")
    (description
     "This package provides Keystore primitives. (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-sp-io-31
  (package
    (name "rust-sp-io")
    (version "31.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-io" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13gxajxdfmfr79m70f7r5fza6zj2sms28nfp42wzqddb7q3slhzc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-ed25519-dalek" ,rust-ed25519-dalek-2)
                       ("rust-libsecp256k1" ,rust-libsecp256k1-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-secp256k1" ,rust-secp256k1-0.28)
                       ("rust-sp-core" ,rust-sp-core-29)
                       ("rust-sp-crypto-hashing" ,rust-sp-crypto-hashing-0.1)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.26)
                       ("rust-sp-keystore" ,rust-sp-keystore-0.35)
                       ("rust-sp-runtime-interface" ,rust-sp-runtime-interface-25)
                       ("rust-sp-state-machine" ,rust-sp-state-machine-0.36)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-tracing" ,rust-sp-tracing-16)
                       ("rust-sp-trie" ,rust-sp-trie-30)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1))))
    (home-page "https://substrate.io")
    (synopsis "I/O for Substrate runtimes (polkadot v1.15.0)")
    (description
     "This package provides I/O for Substrate runtimes (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-sp-application-crypto-31
  (package
    (name "rust-sp-application-crypto")
    (version "31.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-application-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gw3j4d117mizqc3nfd954dwyhvbkkdv65y1krijrddbdrxasz2l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-core" ,rust-sp-core-29)
                       ("rust-sp-io" ,rust-sp-io-31)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis
     "Provides facilities for generating application specific crypto wrapper types. (polkadot v1.15.0)")
    (description
     "This package provides facilities for generating application specific crypto
wrapper types. (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-simple-mermaid-0.1
  (package
    (name "rust-simple-mermaid")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simple-mermaid" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "061wrz7jr6fdw8ni5v52qywksf2gsi8syad98qfjn50fsx1is2k2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/glueball/simple-mermaid")
    (synopsis "Simple Mermaid diagrams RustDoc integration")
    (description
     "This package provides Simple Mermaid diagrams @code{RustDoc} integration.")
    (license license:expat)))

(define-public rust-derive-syn-parse-0.2
  (package
    (name "rust-derive-syn-parse")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-syn-parse" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qjplkxiia1b8yaghv3q1lm93862l5arlkbs95a0wz1b2gl7qpfn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/sharnoff/derive-syn-parse")
    (synopsis "Derive macro for `syn::parse::Parse`")
    (description "This package provides Derive macro for `syn::parse::Parse`.")
    (license (list license:expat license:asl2.0))))

(define-public rust-docify-macros-0.2
  (package
    (name "rust-docify-macros")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docify_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bgx2p2l1l0d7cn1xckl52rbq6hjabbll5m1lzsl51qqzd8iw20s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-common-path" ,rust-common-path-1)
                       ("rust-derive-syn-parse" ,rust-derive-syn-parse-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-toml" ,rust-toml-0.8)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://sam0x17.dev")
    (synopsis "Support macros for docify")
    (description "This package provides Support macros for docify.")
    (license license:expat)))

(define-public rust-docify-0.2
  (package
    (name "rust-docify")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docify" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kh2d0516qx2caq36fcjqns119m691hmg96irsic87ajmlwg38j3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-docify-macros" ,rust-docify-macros-0.2))))
    (home-page "https://sam0x17.dev")
    (synopsis
     "Docify allows you to live-embed at compile time pieces of code from throughout your project as rust doc examples")
    (description
     "This package provides Docify allows you to live-embed at compile time pieces of code from throughout
your project as rust doc examples.")
    (license license:expat)))

(define-public rust-sp-runtime-32
  (package
    (name "rust-sp-runtime")
    (version "32.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vmbp1yi7f47640h4ijsswbbwi3n0ml3vzgin28iwa560cbfg58a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-docify" ,rust-docify-0.2)
                       ("rust-either" ,rust-either-1)
                       ("rust-hash256-std-hasher" ,rust-hash256-std-hasher-0.15)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-simple-mermaid" ,rust-simple-mermaid-0.1)
                       ("rust-sp-application-crypto" ,rust-sp-application-crypto-31)
                       ("rust-sp-arithmetic" ,rust-sp-arithmetic-24)
                       ("rust-sp-core" ,rust-sp-core-29)
                       ("rust-sp-io" ,rust-sp-io-31)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-weights" ,rust-sp-weights-28))))
    (home-page "https://substrate.io")
    (synopsis "Runtime Modules shared primitive types. (polkadot v1.15.0)")
    (description
     "This package provides Runtime Modules shared primitive types. (polkadot v1.15.0).")
    (license license:asl2.0)))

(define-public rust-constcat-0.3
  (package
    (name "rust-constcat")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "constcat" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "021d517fsfb86zrmzrbigjfimb9cq5x25bvsp6zpr22rwsp3aznd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rossmacarthur/constcat")
    (synopsis "concat! with support for const variables and expressions")
    (description
     "This package provides concat! with support for const variables and expressions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-bls12-381-0.4
  (package
    (name "rust-ark-bls12-381")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-bls12-381" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "127lmg29wz42jcvsb2ls8k3q21x5nrxm9syawjmagjv9478z0xf7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4))))
    (home-page "https://arkworks.rs")
    (synopsis "The BLS12-381 pairing-friendly elliptic curve")
    (description
     "This package provides The BLS12-381 pairing-friendly elliptic curve.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-relations-0.4
  (package
    (name "rust-ark-relations")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-relations" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w5l3zri5wdahrbjv1whqgkq3257rnibd7754n1g98q5zip6ny80"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.2))))
    (home-page "https://arkworks.rs")
    (synopsis "library for rank-one constraint systems")
    (description
     "This package provides a library for rank-one constraint systems.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-r1cs-std-0.4
  (package
    (name "rust-ark-r1cs-std")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-r1cs-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nv18wqc7x8209xz7bklnqhkzm68j5y5dqjw82rhq0nbwmr187fy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-relations" ,rust-ark-relations-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://arkworks.rs")
    (synopsis "standard library for constraint system gadgets")
    (description
     "This package provides a standard library for constraint system gadgets.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-poly-0.4
  (package
    (name "rust-ark-poly")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-poly" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gw6zrbl1rx1jwcnwwaq2p727fda66yaipxsrjcxi1g19v2by86k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-rayon" ,rust-rayon-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for efficient polynomial arithmetic via FFTs over finite fields")
    (description
     "This package provides a library for efficient polynomial arithmetic via FFTs
over finite fields.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-std-0.4
  (package
    (name "rust-ark-std")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11aigd20y0x9l3mw1bxsrgklzbscn86lrp78mmjbgskf1hg3z2cl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-colored" ,rust-colored-2)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rayon" ,rust-rayon-1))))
    (home-page "https://arkworks.rs")
    (synopsis "library for no_std compatibility")
    (description "This package provides a library for no_std compatibility.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-serialize-derive-0.4
  (package
    (name "rust-ark-serialize-derive")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-serialize-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sl2yrpk88v4lfgkblwgd2yqa89hw48jbd9jmx4ybmqgdny82cmf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for deriving serialization traits for the arkworks ecosystem")
    (description
     "This package provides a library for deriving serialization traits for the
arkworks ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-serialize-0.4
  (package
    (name "rust-ark-serialize")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-serialize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1992x2cd05pw3v5hfqnb8114g2cwdk3cmmcvz0i2ygdq09dbidxd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-serialize-derive" ,rust-ark-serialize-derive-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-num-bigint" ,rust-num-bigint-0.4))))
    (home-page "https://arkworks.rs")
    (synopsis "library for serializing types in the arkworks ecosystem")
    (description
     "This package provides a library for serializing types in the arkworks ecosystem.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ff-macros-0.4
  (package
    (name "rust-ark-ff-macros")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ff-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ra5a4paqbqqlc9a3cnwkwxh7l1411wsnna1az28k218wjq7kgks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for generating x86-64 assembly for finite field multiplication")
    (description
     "This package provides a library for generating x86-64 assembly for finite field
multiplication.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ff-asm-0.4
  (package
    (name "rust-ark-ff-asm")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ff-asm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j13p6ymma3ypbjipfkc937pn57as8qpwgrpg5nvrl2mw97smm1y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://arkworks.rs")
    (synopsis
     "library for generating x86-64 assembly for finite field multiplication")
    (description
     "This package provides a library for generating x86-64 assembly for finite field
multiplication.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ff-0.4
  (package
    (name "rust-ark-ff")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fk6546nddgs3lsnv1s06fh8mnik5h1ijmck928d4jpla3w7m17c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ff-asm" ,rust-ark-ff-asm-0.4)
                       ("rust-ark-ff-macros" ,rust-ark-ff-macros-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://arkworks.rs")
    (synopsis "library for finite fields")
    (description "This package provides a library for finite fields.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-ec-0.4
  (package
    (name "rust-ark-ec")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-ec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fkh0rswp4d5rn4hmmbibz2wh6x6k3sp21faijb29b2nkm1rmzfy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-poly" ,rust-ark-poly-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://arkworks.rs")
    (synopsis "library for elliptic curves and pairings")
    (description
     "This package provides a library for elliptic curves and pairings.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ark-bls12-377-0.4
  (package
    (name "rust-ark-bls12-377")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ark-bls12-377" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kqavkzp6fmfxf67599r1a7ydi4rb3jhvg96s0xwwlagm0xjj07v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-r1cs-std" ,rust-ark-r1cs-std-0.4)
                       ("rust-ark-std" ,rust-ark-std-0.4))))
    (home-page "https://arkworks.rs")
    (synopsis "The BLS12-377 pairing-friendly elliptic curve")
    (description
     "This package provides The BLS12-377 pairing-friendly elliptic curve.")
    (license (list license:expat license:asl2.0))))

(define-public rust-w3f-bls-0.1
  (package
    (name "rust-w3f-bls")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "w3f-bls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v27d8rpk7lbmmihryxm6bmnb5r4xsdcv9zab28jryka5kxaapcw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ark-bls12-377" ,rust-ark-bls12-377-0.4)
                       ("rust-ark-bls12-381" ,rust-ark-bls12-381-0.4)
                       ("rust-ark-ec" ,rust-ark-ec-0.4)
                       ("rust-ark-ff" ,rust-ark-ff-0.4)
                       ("rust-ark-serialize" ,rust-ark-serialize-0.4)
                       ("rust-ark-serialize-derive" ,rust-ark-serialize-derive-0.4)
                       ("rust-arrayref" ,rust-arrayref-0.3)
                       ("rust-constcat" ,rust-constcat-0.3)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rand-chacha" ,rust-rand-chacha-0.3)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/w3f/bls")
    (synopsis "Aggregate BLS-like signatures")
    (description "This package provides Aggregate BLS-like signatures.")
    (license (list license:expat license:asl2.0))))

(define-public rust-substrate-bip39-0.4
  (package
    (name "rust-substrate-bip39")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "substrate-bip39" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13sdp4w1k55lsjzh4i35s3lxnwvc87w5mkjjbs1c56qv0kf90xba"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hmac" ,rust-hmac-0.11)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.8)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-sha2" ,rust-sha2-0.9)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/paritytech/polkadot-sdk.git")
    (synopsis
     "Converting BIP39 entropy to valid Substrate (sr25519) SecretKeys (polkadot v1.10.0)")
    (description
     "This package provides Converting BIP39 entropy to valid Substrate (sr25519) @code{SecretKeys}
(polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-ss58-registry-1
  (package
    (name "rust-ss58-registry")
    (version "1.50.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ss58-registry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pfjza9zi4lpa8ass9czyxv4znn6spwwhl934r5x0r6zs4pf5z23"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-inflector" ,rust-inflector-0.11)
                       ("rust-num-format" ,rust-num-format-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/paritytech/ss58-registry/")
    (synopsis "Registry of known SS58 address types")
    (description "This package provides Registry of known SS58 address types.")
    (license license:asl2.0)))

(define-public rust-wasm-encoder-0.216
  (package
    (name "rust-wasm-encoder")
    (version "0.216.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "122ap5ql4iiiikjrj6d429dq6860rhqys25f6dcagj12xbmkmhh4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2)
                       ("rust-wasmparser" ,rust-wasmparser-0.216))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 #;unknown-license! license:asl2.0
                   license:expat))))

(define-public rust-gimli-0.30
  (package
    (name "rust-gimli")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jfz1sj9h0rnlhjnmy315db2drsn54f0b5qcpndvl8lpprzxkqg2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bumpalo-3
  (package
    (name "rust-bumpalo")
    (version "3.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bumpalo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b015qb4knwanbdlp1x48pkb4pm57b8gidbhhhxr900q2wb6fabr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-allocator-api2" ,rust-allocator-api2-0.2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/fitzgen/bumpalo")
    (synopsis "fast bump allocation arena for Rust.")
    (description
     "This package provides a fast bump allocation arena for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wast-216
  (package
    (name "rust-wast")
    (version "216.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "022aall56anr2hywpdkdmjc0llr41yfl7hy61pggs4yrxhp1zszp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-gimli" ,rust-gimli-0.30)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.216))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0 #;unknown-license! license:asl2.0
                   license:expat))))

(define-public rust-wat-1
  (package
    (name "rust-wat")
    (version "1.216.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wat" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0an8h093wr9gd8xxc90mffg5g7pxfmb278svzfaly5dm1w4hj15c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-wast" ,rust-wast-216))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wat")
    (synopsis "Rust parser for the WebAssembly Text format, WAT")
    (description
     "This package provides Rust parser for the @code{WebAssembly} Text format, WAT.")
    (license (list license:asl2.0 #;unknown-license! license:asl2.0
                   license:expat))))

(define-public rust-memfd-0.6
  (package
    (name "rust-memfd")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memfd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r5cm3wzyr1x7768h3hns77b494qbz0g05cb9wgpjvrcsm5gmkxj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustix" ,rust-rustix-0.38))))
    (home-page "https://github.com/lucab/memfd-rs")
    (synopsis "pure-Rust library to work with Linux memfd and sealing")
    (description
     "This package provides a pure-Rust library to work with Linux memfd and sealing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmtime-runtime-8
  (package
    (name "rust-wasmtime-runtime")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-runtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hdl028328ia1bzpx0pazm4f799xh9fjbr82w9h6far34przd335"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mach" ,rust-mach-0.3)
                       ("rust-memfd" ,rust-memfd-0.6)
                       ("rust-memoffset" ,rust-memoffset-0.8)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustix" ,rust-rustix-0.36)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-8)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-8)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-8)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-8)
                       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Runtime library support for Wasmtime")
    (description "This package provides Runtime library support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-jit-icache-coherence-8
  (package
    (name "rust-wasmtime-jit-icache-coherence")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-icache-coherence" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1g8v2bjcv9x4ysxi1hby2gr7hiff78vjgn1vnbpnfzrzn5wfkjmf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Utilities for JIT icache maintenance")
    (description "This package provides Utilities for JIT icache maintenance.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-jit-debug-8
  (package
    (name "rust-wasmtime-jit-debug")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-debug" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0iiqp47a52jlmyxlnq5zsxvkmqclxn5861hx51v7v8hm9jw581bf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.30)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.36))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT debug interfaces support for Wasmtime")
    (description
     "This package provides JIT debug interfaces support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-ittapi-sys-0.3
  (package
    (name "rust-ittapi-sys")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n972w6wcna94rir1r3k1j0imksqywkx3vk0lqv0a1k56x3mwyyb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi-sys")
    (synopsis "Rust bindings for ittapi")
    (description "This package provides Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-ittapi-0.3
  (package
    (name "rust-ittapi")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wbjdpq28dvm5iigi4jmscvz7nf5cmjhgsi2c9wss730jfww1995"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-ittapi-sys" ,rust-ittapi-sys-0.3)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi")
    (synopsis "High-level Rust bindings for ittapi")
    (description "This package provides High-level Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-wasmtime-jit-8
  (package
    (name "rust-wasmtime-jit")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i0jyfmrd14nq3ahdcmh6g82sxs5gghd60h0fndirjngabsqvr0d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-addr2line" ,rust-addr2line-0.19)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.3)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-ittapi" ,rust-ittapi-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.30)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-8)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-8)
                       ("rust-wasmtime-jit-icache-coherence" ,rust-wasmtime-jit-icache-coherence-8)
                       ("rust-wasmtime-runtime" ,rust-wasmtime-runtime-8)
                       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT-style execution for WebAsssembly code in Cranelift")
    (description
     "This package provides JIT-style execution for @code{WebAsssembly} code in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-asm-macros-8
  (package
    (name "rust-wasmtime-asm-macros")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-asm-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03c1gxczcrfld7x17b2r15xlnpwd82afk7gnvczgmm2cq6kxmffk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining asm functions in Wasmtime")
    (description
     "This package provides Macros for defining asm functions in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-fiber-8
  (package
    (name "rust-wasmtime-fiber")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-fiber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02niszdlvycq9nmblw1xwibkxp46rbc99nw8mcrs2wv2mgaq5cbs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-rustix" ,rust-rustix-0.36)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-8)
                       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Fiber support for Wasmtime")
    (description "This package provides Fiber support for Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmparser-0.121
  (package
    (name "rust-wasmparser")
    (version "0.121.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1aza0g3v49nqsc856fd7x8zwrh4hzy4si9a7jifx5nyhz745bglx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmprinter-0.2
  (package
    (name "rust-wasmprinter")
    (version "0.2.80")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmprinter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dw8559vdz6g8864rg4ggi88cm0kf7mygyavgkdzxzdpls33krv0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.121))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmprinter")
    (synopsis
     "Rust converter from the WebAssembly binary format to the text format.")
    (description
     "This package provides Rust converter from the @code{WebAssembly} binary format to the text format.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasm-encoder-0.25
  (package
    (name "rust-wasm-encoder")
    (version "0.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dx26l0w6jqkywg6la6n24xy37afmpfpwlmgfr6wkvh99wy8bzsf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-environ-8
  (package
    (name "rust-wasmtime-environ")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-environ" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jf9amci40frqbs0a403xb99prjr6ffzhnr38lq455s1xs61k459"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.95)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.30)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.25)
                       ("rust-wasmparser" ,rust-wasmparser-0.102)
                       ("rust-wasmprinter" ,rust-wasmprinter-0.2)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-8)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-8))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Standalone environment support for WebAssembly code in Cranelift")
    (description
     "This package provides Standalone environment support for @code{WebAssembly} code in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cranelift-shared-8
  (package
    (name "rust-wasmtime-cranelift-shared")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12rgi2bz7cscr9v70zj5rrvddxm4y6a26i3qzjws3bpm5qw1w16d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.95)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.95)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-object" ,rust-object-0.30)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-8))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Base-level integration with Wasmtime and Cranelift")
    (description
     "This package provides Base-level integration with Wasmtime and Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-types-8
  (package
    (name "rust-wasmtime-types")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vzh2zp5k07fd9i2wjpzwdrfi49727fm8xphaxyqh48h5byzzxm4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.95)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.102))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WebAssembly type definitions for Cranelift")
    (description
     "This package provides @code{WebAssembly} type definitions for Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-wasm-0.95
  (package
    (name "rust-cranelift-wasm")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-wasm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b1p0z4p2fk72c9239jlnnpiipmkm3m7mpar3vcqm4ixk9420cpz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.95)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.95)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.95)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.102)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-8))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Translator from WebAssembly to Cranelift IR")
    (description
     "This package provides Translator from @code{WebAssembly} to Cranelift IR.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-native-0.95
  (package
    (name "rust-cranelift-native")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-native" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "004vqzkz5lzhzc7wqi3r9sj0f33mjj57bq4cznrw809qw3h06sxv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.95)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for targeting the host with Cranelift")
    (description
     "This package provides Support for targeting the host with Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-frontend-0.95
  (package
    (name "rust-cranelift-frontend")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-frontend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bg860zfi488xq74yibmf5qb81wmqmg12d1w8sf0gqqa1afmv8k4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.95)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-souper-ir-2
  (package
    (name "rust-souper-ir")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "souper-ir" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i60q84w5k3rd0j3zhsdc5xasrd4wrkamyrs01rik3lq6g71h355"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-id-arena" ,rust-id-arena-2))))
    (home-page "https://github.com/fitzgen/souper-ir")
    (synopsis "library for manipulating Souper IR")
    (description "This package provides a library for manipulating Souper IR.")
    (license (list license:expat license:asl2.0))))

(define-public rust-regalloc2-0.6
  (package
    (name "rust-regalloc2")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regalloc2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08bn5l2akabc36g7dmw2kmcdlz4dwcvkrgcgc6fi86z1ra1m2lw0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from @code{IonMonkey}.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-isle-0.95
  (package
    (name "rust-cranelift-isle")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-isle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fk98h6ld1cnk1xhh07adbxwix1bj54yr1wzbyysrr460iynmpl0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language for instruction selection in Cranelift")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-shared-0.95
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f286whpp4zmrhds3m17512igxahxgfw1gfrkssk8y14fsrvi0nx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "This package provides For code shared between cranelift-codegen-meta and cranelift-codegen.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-codegen-meta-0.95
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-meta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nn9qmvs4q3m71mxw209zln9rzdxdmh6n7v529pxdck21p1mmb68"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.95))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-entity-0.95
  (package
    (name "rust-cranelift-entity")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-entity" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c30hqkgg7q8v5l4ib9ip5r7l0wr46svm29zwq2yadqv0qw9s2a0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description
     "This package provides Data structures using entity references as mapping keys.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-cranelift-bforest-0.95
  (package
    (name "rust-cranelift-bforest")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bforest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w2frrg17kdccqnapvn7ygvsb76l77kd7ppj9bnci0mwjkxgnxqj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.95))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-capstone-sys-0.13
  (package
    (name "rust-capstone-sys")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "capstone-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xpia1gs2b0zl7n521ldq6lax2jqqjw0hz2c8skak94gp2bksbyg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.53)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1))))
    (home-page
     "https://github.com/capstone-rust/capstone-rs/tree/master/capstone-sys")
    (synopsis "System bindings to the capstone disassembly library")
    (description
     "This package provides System bindings to the capstone disassembly library.")
    (license license:expat)))

(define-public rust-capstone-0.9
  (package
    (name "rust-capstone")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "capstone" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v19wszrrhidh6z1ms0hda0dl4p0fl2n1mhx5mwkjfffnj03r2qp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-capstone-sys" ,rust-capstone-sys-0.13)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/capstone-rust/capstone-rs")
    (synopsis
     "High level bindings to capstone disassembly engine (https://capstone-engine.org/)")
    (description
     "This package provides High level bindings to capstone disassembly engine
(https://capstone-engine.org/).")
    (license license:expat)))

(define-public rust-cranelift-codegen-0.95
  (package
    (name "rust-cranelift-codegen")
    (version "0.95.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "081j3mk4dkwwfhznpc52pvisrc71iy4271y3xsd0w9xjscdc7s66"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-capstone" ,rust-capstone-0.9)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.95)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.95)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.95)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.95)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.95)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-regalloc2" ,rust-regalloc2-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "This package provides Low-level code generator library.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cranelift-8
  (package
    (name "rust-wasmtime-cranelift")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "017fks32rvm97267pzdg45js9nrp7252kdi13c5p1jz8rkhgvkmi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.95)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.95)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.95)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.95)
                       ("rust-cranelift-wasm" ,rust-cranelift-wasm-0.95)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.30)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.102)
                       ("rust-wasmtime-cranelift-shared" ,rust-wasmtime-cranelift-shared-8)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-8))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Cranelift and Wasmtime")
    (description
     "This package provides Integration between Cranelift and Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-id-arena-2
  (package
    (name "rust-id-arena")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "id-arena" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01ch8jhpgnih8sawqs44fqsqpc7bzwgy0xpi6j0f4j0i5mkvr8i5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/fitzgen/id-arena")
    (synopsis "simple, id-based arena.")
    (description "This package provides a simple, id-based arena.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wit-parser-0.6
  (package
    (name "rust-wit-parser")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cr8qxpjsma6k4jl9lflnrblfsh22dsnmgkf0whv6lbsabdc71zq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.8)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-url" ,rust-url-2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-parser")
    (synopsis
     "Tooling for parsing `*.wit` files and working with their contents.")
    (description
     "This package provides Tooling for parsing `*.wit` files and working with their contents.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-wit-bindgen-8
  (package
    (name "rust-wasmtime-wit-bindgen")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wit-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pgp3y3xwjrd5n55vnm4n45gq1b6vjhgcgx5jaldl6jd576bjgcq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-wit-parser" ,rust-wit-parser-0.6))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Internal `*.wit` support for the `wasmtime` crate's macros")
    (description
     "This package provides Internal `*.wit` support for the `wasmtime` crate's macros.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-component-util-8
  (package
    (name "rust-wasmtime-component-util")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hh0j0nc9p44mg4mlhcjd3gmhf9k5qcz09lgp1r9vim3ljkjrq3l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Utility types and functions to support the component model in Wasmtime")
    (description
     "This package provides Utility types and functions to support the component model in Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-component-macro-8
  (package
    (name "rust-wasmtime-component-macro")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01rnkkfyjlkxmrbn8p3y3kkvgnq4bqclzaixbnqllfy9gknrcw16"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-8)
                       ("rust-wasmtime-wit-bindgen" ,rust-wasmtime-wit-bindgen-8)
                       ("rust-wit-parser" ,rust-wit-parser-0.6))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for deriving component interface types from Rust types")
    (description
     "This package provides Macros for deriving component interface types from Rust types.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-file-per-thread-logger-0.1
  (package
    (name "rust-file-per-thread-logger")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "file-per-thread-logger" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0riq6p1267g9316qs4avfsccqvdczs8h2qzl9ax020krv4jy9wl4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/bnjbvr/file-per-thread-logger")
    (synopsis "logging implementation that writes logs in one file per thread")
    (description
     "This package provides a logging implementation that writes logs in one file per
thread.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmtime-cache-8
  (package
    (name "rust-wasmtime-cache")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cache" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04qjszgmlf00y8snan43j2a98n1bpcs95imgwnbfhvv2d3x3fr68"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-directories-next" ,rust-directories-next-2)
                       ("rust-file-per-thread-logger" ,rust-file-per-thread-logger-0.1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustix" ,rust-rustix-0.36)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-windows-sys" ,rust-windows-sys-0.45)
                       ("rust-zstd" ,rust-zstd-0.11))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for automatic module caching with Wasmtime")
    (description
     "This package provides Support for automatic module caching with Wasmtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-wasmparser-0.102
  (package
    (name "rust-wasmparser")
    (version "0.102.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jqh6p7w5kng9vz1k1bblwfx6l4fbnqr2sxgksmik0jrszils4s8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-1)
                       ("rust-url" ,rust-url-2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-psm-0.1
  (package
    (name "rust-psm")
    (version "0.1.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "psm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01gj25ma73zv0iy3z5bxg49zr299i9d53sgs6dh9f146ll6ghdxa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/rust-lang/stacker/")
    (synopsis
     "Portable Stack Manipulation: stack manipulation and introspection routines")
    (description
     "This package provides Portable Stack Manipulation: stack manipulation and introspection routines.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmtime-8
  (package
    (name "rust-wasmtime")
    (version "8.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1afxscpcar4c6l2kds6y0vf75532c9dvsfx9nyzvjg0msgmgs1zr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.30)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-psm" ,rust-psm-0.1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmparser" ,rust-wasmparser-0.102)
                       ("rust-wasmtime-cache" ,rust-wasmtime-cache-8)
                       ("rust-wasmtime-component-macro" ,rust-wasmtime-component-macro-8)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-8)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-8)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-8)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-8)
                       ("rust-wasmtime-jit" ,rust-wasmtime-jit-8)
                       ("rust-wasmtime-runtime" ,rust-wasmtime-runtime-8)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "High-level API to expose the Wasmtime runtime")
    (description
     "This package provides High-level API to expose the Wasmtime runtime.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-sp-wasm-interface-20
  (package
    (name "rust-sp-wasm-interface")
    (version "20.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-wasm-interface" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vlv498wfj4y3dzmhjh3n8lvrsb3hks2bwq6cp1cdd1fqir73ycy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-wasmtime" ,rust-wasmtime-8))))
    (home-page "https://substrate.io")
    (synopsis
     "Types and traits for interfacing between the host and the wasm runtime. (polkadot v1.10.0)")
    (description
     "This package provides Types and traits for interfacing between the host and the wasm runtime.
(polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-tracing-subscriber-0.2
  (package
    (name "rust-tracing-subscriber")
    (version "0.2.25")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-subscriber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wcc3sqckjsxaahd9jnc4cwa13m623lhk8fg8way9hn3k6m2w38f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-matchers" ,rust-matchers-0.0) ; was rust-matchers-0.0.1
                       ("rust-parking-lot" ,rust-parking-lot-0.7)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sharded-slab" ,rust-sharded-slab-0.1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thread-local" ,rust-thread-local-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1)
                       ("rust-tracing-log" ,rust-tracing-log-0.1)
                       ("rust-tracing-serde" ,rust-tracing-serde-0.1))))
    (home-page "https://tokio.rs")
    (synopsis
     "Utilities for implementing and composing `tracing` subscribers.")
    (description
     "This package provides Utilities for implementing and composing `tracing` subscribers.")
    (license license:expat)))

(define-public rust-sp-tracing-16
  (package
    (name "rust-sp-tracing")
    (version "16.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-tracing" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p60d6mn0rsjs74w2cd1rc3hc9aws2725i8l8lfgfk87kl5q2l83"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.2))))
    (home-page "https://substrate.io")
    (synopsis
     "Instrumentation primitives and macros for Substrate. (polkadot v1.10.0)")
    (description
     "This package provides Instrumentation primitives and macros for Substrate. (polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-file-guard-0.2
  (package
    (name "rust-file-guard")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "file-guard" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z20z66gdd13pn2g0z01bwj0ljcrc9avwx8jyvdxghsyz6n75vr1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/kalamay/file-guard")
    (synopsis "cross-platform library for simple advisory file locking.")
    (description
     "This package provides a cross-platform library for simple advisory file locking.")
    (license license:expat)))

(define-public rust-expander-2
  (package
    (name "rust-expander")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "expander" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qm8v20f2548ny8bb1maxa1674ly8mq43cimk4bvvv4i3p3p1i72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blake2" ,rust-blake2-0.10)
                       ("rust-file-guard" ,rust-file-guard-0.2)
                       ("rust-fs-err" ,rust-fs-err-2)
                       ("rust-prettyplease" ,rust-prettyplease-0.2)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://ahoi.io")
    (synopsis
     "Expands proc macro output to a file, to enable easier debugging")
    (description
     "This package provides Expands proc macro output to a file, to enable easier debugging.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sp-runtime-interface-proc-macro-17
  (package
    (name "rust-sp-runtime-interface-proc-macro")
    (version "17.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime-interface-proc-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "033gmrd4j8biaj9qy38vgx5wjc1y11yxbn6nkjws84pcna2nxbyg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-expander" ,rust-expander-2)
                       ("rust-inflector" ,rust-inflector-0.11)
                       ("rust-proc-macro-crate" ,rust-proc-macro-crate-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://substrate.io")
    (synopsis
     "This crate provides procedural macros for usage within the context of the Substrate runtime interface")
    (description
     "This crate provides procedural macros for usage within the context of the
Substrate runtime interface.")
    (license license:asl2.0)))

(define-public rust-sp-runtime-interface-25
  (package
    (name "rust-sp-runtime-interface")
    (version "25.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-runtime-interface" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qxy9pbj08y7h74yacaj8rkadchzm1vg1d513cgw7g6l56mj28sf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.26)
                       ("rust-sp-runtime-interface-proc-macro" ,rust-sp-runtime-interface-proc-macro-17)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-20)
                       ("rust-sp-tracing" ,rust-sp-tracing-16)
                       ("rust-sp-wasm-interface" ,rust-sp-wasm-interface-20)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://substrate.io")
    (synopsis "Substrate runtime interface (polkadot v1.13.0)")
    (description
     "This package provides Substrate runtime interface (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-sp-storage-20
  (package
    (name "rust-sp-storage")
    (version "20.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-storage" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gg8h54rspc0ip9qrs04arb3bv5kxhcxknlrmxfyjy1rrf8mgfld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-ref-cast" ,rust-ref-cast-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-std" ,rust-sp-std-14))))
    (home-page "https://substrate.io")
    (synopsis "Storage related primitives (polkadot v1.10.0)")
    (description
     "This package provides Storage related primitives (polkadot v1.10.0).")
    (license license:asl2.0)))

(define-public rust-sp-std-14
  (package
    (name "rust-sp-std")
    (version "14.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d28hwvdzi0r74m9i6s4518kmkc380ppcxhpfjnskc0lcjcfxy0j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://substrate.io")
    (synopsis
     "Lowest-abstraction level for the Substrate runtime: just exports useful primitives from std or client/alloc to be used with any code that depends on the runtime")
    (description
     "This package provides Lowest-abstraction level for the Substrate runtime: just exports useful
primitives from std or client/alloc to be used with any code that depends on the
runtime.")
    (license license:asl2.0)))

(define-public rust-environmental-1
  (package
    (name "rust-environmental")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "environmental" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nxiw6j1kwjr7719h8aj1hv1p65nw3afar0wsn1hx1xai8195374"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "")
    (synopsis "Set scope-limited values can can be accessed statically")
    (description
     "This package provides Set scope-limited values can can be accessed statically.")
    (license license:asl2.0)))

(define-public rust-sp-externalities-0.26
  (package
    (name "rust-sp-externalities")
    (version "0.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-externalities" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10mv0873602qvmkhrl7ik5r4rqai7c4qp2b49209ghyf4k86w2g7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-environmental" ,rust-environmental-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-20))))
    (home-page "https://substrate.io")
    (synopsis "Substrate externalities abstraction (polkadot v1.13.0)")
    (description
     "This package provides Substrate externalities abstraction (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-sp-debug-derive-14
  (package
    (name "rust-sp-debug-derive")
    (version "14.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-debug-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gkx01f91gknvvbawj416ix0y8167n2y6np23sw9yagplnh9zl28"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://substrate.io")
    (synopsis "Macros to derive runtime debug implementation")
    (description
     "This package provides Macros to derive runtime debug implementation.")
    (license license:asl2.0)))

(define-public rust-sp-crypto-hashing-0.1
  (package
    (name "rust-sp-crypto-hashing")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-crypto-hashing" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sy5fh0l3zb8bimwfgkiv4mx290kr1wak94qi9dysd0kz2kjg6dw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blake2b-simd" ,rust-blake2b-simd-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://substrate.io")
    (synopsis "Hashing primitives")
    (description "This package provides Hashing primitives.")
    (license license:asl2.0)))

(define-public rust-secrecy-0.8
  (package
    (name "rust-secrecy")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "secrecy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07p9h2bpkkg61f1fzzdqqbf74kwv1gg095r1cdmjzzbcl17cblcv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/iqlusioninc/crates/")
    (synopsis
     "Wrapper types and traits for secret management which help ensure
they aren't accidentally copied, logged, or otherwise exposed
(as much as possible), and also ensure secrets are securely wiped
from memory when dropped.")
    (description
     "This package provides Wrapper types and traits for secret management which help ensure they aren't
accidentally copied, logged, or otherwise exposed (as much as possible), and
also ensure secrets are securely wiped from memory when dropped.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-secp256k1-sys-0.9
  (package
    (name "rust-secp256k1-sys")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "secp256k1-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1sxpzg4w1qzjlx8wal90ir4i1ngsddj8q6iw7ic9vha2mrm79lg5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/rust-bitcoin/rust-secp256k1/")
    (synopsis "FFI for Pieter Wuille's `libsecp256k1` library")
    (description
     "This package provides FFI for Pieter Wuille's `libsecp256k1` library.")
    (license license:cc0)))

(define-public rust-hex-conservative-0.2
  (package
    (name "rust-hex-conservative")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-conservative" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kg6xb2n59zpid87kdgqvc5mks68qh9gdnq8m1jp0n9wrrrb04sk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-core2" ,rust-core2-0.3)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/hex-conservative")
    (synopsis
     "hex encoding and decoding crate with a conservative MSRV and dependency policy.")
    (description
     "This package provides a hex encoding and decoding crate with a conservative MSRV
and dependency policy.")
    (license license:cc0)))

(define-public rust-bitcoin-io-0.1
  (package
    (name "rust-bitcoin-io")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin-io" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mpfma9hyipnm3x7yhbk8whwk85yb2mgcnj95y8xhyww77l0j3il"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-bitcoin/rust-bitcoin")
    (synopsis "Simple I/O traits for no-std (and std) environments")
    (description
     "This package provides Simple I/O traits for no-std (and std) environments.")
    (license license:cc0)))

(define-public rust-bitcoin-hashes-0.14
  (package
    (name "rust-bitcoin-hashes")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin_hashes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05jdirz6p2q1fbg65c1xfhf8bsx7snpzm9i1g8a7w95h1lyw065v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitcoin-io" ,rust-bitcoin-io-0.1)
                       ("rust-hex-conservative" ,rust-hex-conservative-0.2)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/rust-bitcoin")
    (synopsis "Hash functions used by the rust-bitcoin eccosystem")
    (description
     "This package provides Hash functions used by the rust-bitcoin eccosystem.")
    (license license:cc0)))

(define-public rust-secp256k1-0.28
  (package
    (name "rust-secp256k1")
    (version "0.28.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "secp256k1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "041g02yb5m0cf1yy9vhkszji4dq5z9927yx4mqhfmbfd578mjjyj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitcoin-hashes" ,rust-bitcoin-hashes-0.14)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-secp256k1-sys" ,rust-secp256k1-sys-0.9)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/rust-secp256k1/")
    (synopsis
     "Rust wrapper library for Pieter Wuille's `libsecp256k1`. Implements ECDSA and BIP 340 signatures for the SECG elliptic curve group secp256k1 and related utilities")
    (description
     "This package provides Rust wrapper library for Pieter Wuille's `libsecp256k1`.  Implements ECDSA and
BIP 340 signatures for the SECG elliptic curve group secp256k1 and related
utilities.")
    (license license:cc0)))

(define-public rust-getrandom-or-panic-0.0.3
  (package
    (name "rust-getrandom-or-panic")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getrandom_or_panic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f8h7dvjjkc14akdacmi5jbrvy4a1kjwyc62iml6nqbhb9dh38bf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rand" ,rust-rand-0.8)
                       ("rust-rand-core" ,rust-rand-core-0.6))))
    (home-page "https://github.com/burdges/getrandom_or_panic")
    (synopsis "Implements a RngCore which panics unless getrandom exists")
    (description
     "This package implements a @code{RngCore} which panics unless getrandom exists.")
    (license license:bsd-3)))

(define-public rust-failure-0.1
  (package
    (name "rust-failure")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "failure" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11jg1wmbkijrs6bk9fqnbrm9zf0850whnqpgnxyswbn0dk8rnbnk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-failure-derive" ,rust-failure-derive-0.1))))
    (home-page "https://rust-lang-nursery.github.io/failure/")
    (synopsis "Experimental error handling abstraction")
    (description
     "This package provides Experimental error handling abstraction.")
    (license (list license:expat license:asl2.0))))

(define-public rust-arrayref-0.3
  (package
    (name "rust-arrayref")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrayref" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yp686dig2km0c49bm8cwmx27zcbzj8vg4brc45m128hyqsiw5cx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/droundy/arrayref")
    (synopsis "Macros to take array references of slices")
    (description
     "This package provides Macros to take array references of slices.")
    (license license:bsd-2)))

(define-public rust-aead-0.5
  (package
    (name "rust-aead")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aead" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c32aviraqag7926xcb9sybdm36v5vh9gnxpn4pxdwjc50zl28ni"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-blobby" ,rust-blobby-0.3)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-crypto-common" ,rust-crypto-common-0.1)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-heapless" ,rust-heapless-0.7))))
    (home-page "https://github.com/RustCrypto/traits")
    (synopsis
     "Traits for Authenticated Encryption with Associated Data (AEAD) algorithms,
such as AES-GCM as ChaCha20Poly1305, which provide a high-level API")
    (description
     "This package provides Traits for Authenticated Encryption with Associated Data (AEAD) algorithms, such
as AES-GCM as @code{ChaCha20Poly1305}, which provide a high-level API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-schnorrkel-0.11
  (package
    (name "rust-schnorrkel")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "schnorrkel" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "187aa52b1msam04qb8w44l8w36cqq9zf1sjzbw2dgam0idnqzqcd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aead" ,rust-aead-0.5)
                       ("rust-arrayref" ,rust-arrayref-0.3)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-curve25519-dalek" ,rust-curve25519-dalek-4)
                       ("rust-failure" ,rust-failure-0.1)
                       ("rust-getrandom-or-panic" ,rust-getrandom-or-panic-0.0.3)
                       ("rust-merlin" ,rust-merlin-3)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-bytes" ,rust-serde-bytes-0.11)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/w3f/schnorrkel")
    (synopsis "Schnorr VRF, signatures, etc. using the Ristretto group")
    (description
     "This package provides Schnorr VRF, signatures, etc.  using the Ristretto group.")
    (license license:bsd-3)))

(define-public rust-integer-sqrt-0.1
  (package
    (name "rust-integer-sqrt")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "integer-sqrt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w6pzmgvs1mldkhafbwg9x7wzr0af3ngkimyb1gy97jarcdw6vi7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/derekdreery/integer-sqrt-rs")
    (synopsis
     "An implementation of integer square root algorithm for primitive rust types")
    (description
     "This package provides An implementation of integer square root algorithm for primitive rust types.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-impl-num-traits-0.1
  (package
    (name "rust-impl-num-traits")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "impl-num-traits" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05rzxp7zvvfphigpgk621an3a6akxj5sw6dzsh1zyfw77zql25lm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-integer-sqrt" ,rust-integer-sqrt-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-uint" ,rust-uint-0.9))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "num-traits implementation for uint")
    (description "This package provides num-traits implementation for uint.")
    (license (list license:expat license:asl2.0))))

(define-public rust-impl-codec-0.6
  (package
    (name "rust-impl-codec")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "impl-codec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bvzlxap996zrai9shwcnzris117r1gx2dizgxhiark27402fsms"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parity-scale-codec" ,rust-parity-scale-codec-3))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Parity Codec serialization support for uint and fixed hash")
    (description
     "This package provides Parity Codec serialization support for uint and fixed hash.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fixed-hash-0.8
  (package
    (name "rust-fixed-hash")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fixed-hash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d25wr8vrvr7kwmjya6894wp461f2wic0wgxdz7im360n0n0ap43"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustc-hex" ,rust-rustc-hex-2)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Macros to define custom fixed-size hash types")
    (description
     "This package provides Macros to define custom fixed-size hash types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-primitive-types-0.12
  (package
    (name "rust-primitive-types")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "primitive-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qj4w8vhn52c7f4ywkh4xbzs0yl4c8pkrh113fj782xfd3yxjd0b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fixed-hash" ,rust-fixed-hash-0.8)
                       ("rust-impl-codec" ,rust-impl-codec-0.6)
                       ("rust-impl-num-traits" ,rust-impl-num-traits-0.1)
                       ("rust-impl-rlp" ,rust-impl-rlp-0.3)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-scale-info" ,rust-scale-info-1)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-uint" ,rust-uint-0.9))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Primitive types shared by Ethereum and Substrate")
    (description
     "This package provides Primitive types shared by Ethereum and Substrate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libsecp256k1-gen-genmult-0.3
  (package
    (name "rust-libsecp256k1-gen-genmult")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libsecp256k1-gen-genmult" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z3gl0x5rpdjrr3mds8620gk0h0qjfccr33f1v2ar7pc5jxddf1x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libsecp256k1-core" ,rust-libsecp256k1-core-0.3))))
    (home-page "https://github.com/paritytech/libsecp256k1")
    (synopsis "Generator function of const for libsecp256k1")
    (description
     "This package provides Generator function of const for libsecp256k1.")
    (license license:asl2.0)))

(define-public rust-libsecp256k1-gen-ecmult-0.3
  (package
    (name "rust-libsecp256k1-gen-ecmult")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libsecp256k1-gen-ecmult" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02a8rddxan8616rrq5b88hbw9ikz323psfk4fahyi1swql4chf1h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libsecp256k1-core" ,rust-libsecp256k1-core-0.3))))
    (home-page "https://github.com/paritytech/libsecp256k1")
    (synopsis "Generator function of const_gen for libsecp256k1")
    (description
     "This package provides Generator function of const_gen for libsecp256k1.")
    (license license:asl2.0)))

(define-public rust-libsecp256k1-core-0.3
  (package
    (name "rust-libsecp256k1-core")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libsecp256k1-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lalbm1f67dd0cxpa12mjq0q6wvcq5bangjk9nj2519dcjxvksav"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crunchy" ,rust-crunchy-0.2)
                       ("rust-digest" ,rust-digest-0.9)
                       ("rust-subtle" ,rust-subtle-2))))
    (home-page "https://github.com/paritytech/libsecp256k1")
    (synopsis "Core functions for pure Rust secp256k1 implementation")
    (description
     "This package provides Core functions for pure Rust secp256k1 implementation.")
    (license license:asl2.0)))

(define-public rust-hmac-drbg-0.3
  (package
    (name "rust-hmac-drbg")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hmac-drbg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cc5ddks8bg3512fzrd4n2gqr1kqkvg1l33fv9s6anyzjh9hmshp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-digest" ,rust-digest-0.9)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-hmac" ,rust-hmac-0.8))))
    (home-page "")
    (synopsis "Pure Rust implementation of Hmac DRBG")
    (description
     "This package provides Pure Rust implementation of Hmac DRBG.")
    (license license:asl2.0)))

(define-public rust-libsecp256k1-0.7
  (package
    (name "rust-libsecp256k1")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libsecp256k1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18g2ap7ny8h6r59rrqn734clhypwj6kd7kkpp0rkpv9m3gzrxc4m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayref" ,rust-arrayref-0.3)
                       ("rust-base64" ,rust-base64-0.13)
                       ("rust-digest" ,rust-digest-0.9)
                       ("rust-hmac-drbg" ,rust-hmac-drbg-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libsecp256k1-core" ,rust-libsecp256k1-core-0.3)
                       ("rust-libsecp256k1-gen-ecmult" ,rust-libsecp256k1-gen-ecmult-0.3)
                       ("rust-libsecp256k1-gen-genmult" ,rust-libsecp256k1-gen-genmult-0.3)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.9)
                       ("rust-typenum" ,rust-typenum-1))))
    (home-page "https://github.com/paritytech/libsecp256k1")
    (synopsis "Pure Rust secp256k1 implementation")
    (description "This package provides Pure Rust secp256k1 implementation.")
    (license license:asl2.0)))

(define-public rust-impl-serde-0.4
  (package
    (name "rust-impl-serde")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "impl-serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k9mr5wfypgz95azk0k9bgsdb66kd5ia7fjkr2q3vbi8f338zj7b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Serde serialization support for uint and fixed hash")
    (description
     "This package provides Serde serialization support for uint and fixed hash.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hash256-std-hasher-0.15
  (package
    (name "rust-hash256-std-hasher")
    (version "0.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hash256-std-hasher" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wpw3sr931daagy2ri19rk0kd6q90kq0h246sd73yqwqbgap3hcj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crunchy" ,rust-crunchy-0.2))))
    (home-page "https://github.com/paritytech/trie")
    (synopsis "Standard library hasher for 256-bit prehashed keys")
    (description
     "This package provides Standard library hasher for 256-bit prehashed keys.")
    (license license:asl2.0)))

(define-public rust-hash-db-0.16
  (package
    (name "rust-hash-db")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hash-db" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d3abk1l1301rh4x24jj1y2a1yhfxc3y9yg45yp2ax0x6s37fzcf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/paritytech/trie")
    (synopsis "Trait for hash-keyed databases")
    (description "This package provides Trait for hash-keyed databases.")
    (license license:asl2.0)))

(define-public rust-ed25519-zebra-3
  (package
    (name "rust-ed25519-zebra")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ed25519-zebra" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ii8v3naai5m5f7m69y9ygiqn4cj4gwpfyjpkqshpbb8s01z893w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-curve25519-dalek" ,rust-curve25519-dalek-3)
                       ("rust-hashbrown" ,rust-hashbrown-0.12)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.9)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/ZcashFoundation/ed25519-zebra")
    (synopsis "Zcash-flavored Ed25519 for use in Zebra")
    (description
     "This package provides Zcash-flavored Ed25519 for use in Zebra.")
    (license (list license:expat license:asl2.0))))

(define-public rust-dyn-clonable-impl-0.9
  (package
    (name "rust-dyn-clonable-impl")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dyn-clonable-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1icrjdqiriiy6abxpsygyxylgxg2gq5j9z876pslqdrwazm413jm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/kardeiz/objekt-clonable")
    (synopsis "Attribute wrapper for dyn-clone")
    (description "This package provides Attribute wrapper for dyn-clone.")
    (license license:expat)))

(define-public rust-dyn-clonable-0.9
  (package
    (name "rust-dyn-clonable")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dyn-clonable" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m4zlp5phn44znxqj6dkjilxpr5kvyil2ldxp77658h7wvq354jf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dyn-clonable-impl" ,rust-dyn-clonable-impl-0.9)
                       ("rust-dyn-clone" ,rust-dyn-clone-1))))
    (home-page "https://github.com/kardeiz/objekt-clonable")
    (synopsis "Attribute wrapper for dyn-clone")
    (description "This package provides Attribute wrapper for dyn-clone.")
    (license license:expat)))

(define-public rust-bounded-collections-0.2
  (package
    (name "rust-bounded-collections")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bounded-collections" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hdbd3azcbyhzbmh7k0k776ipvssl7sdrs08z7dbsc8sp7n8a8yk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-1)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Bounded types and their supporting traits")
    (description
     "This package provides Bounded types and their supporting traits.")
    (license (list license:expat license:asl2.0))))

(define-public rust-array-bytes-6
  (package
    (name "rust-array-bytes")
    (version "6.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "array-bytes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14w23czh8s1b5ic1vfczymf674jn1jwxkcmv0blijhfk3c3dwpax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://hack.ink/array-bytes")
    (synopsis "collection of array/bytes/hex utilities.")
    (description
     "This package provides a collection of array/bytes/hex utilities.")
    (license (list license:asl2.0 license:gpl3))))

(define-public rust-sp-core-29
  (package
    (name "rust-sp-core")
    (version "29.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wxy1j0rx6p2kcxl340ipk2nljn5w7250zan5032axc1ashwfcvw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-array-bytes" ,rust-array-bytes-6)
                       ("rust-bip39" ,rust-bip39-2)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-bounded-collections" ,rust-bounded-collections-0.2)
                       ("rust-bs58" ,rust-bs58-0.5)
                       ("rust-dyn-clonable" ,rust-dyn-clonable-0.9)
                       ("rust-ed25519-zebra" ,rust-ed25519-zebra-3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hash-db" ,rust-hash-db-0.16)
                       ("rust-hash256-std-hasher" ,rust-hash256-std-hasher-0.15)
                       ("rust-impl-serde" ,rust-impl-serde-0.4)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-libsecp256k1" ,rust-libsecp256k1-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-merlin" ,rust-merlin-3)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-primitive-types" ,rust-primitive-types-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-secp256k1" ,rust-secp256k1-0.28)
                       ("rust-secrecy" ,rust-secrecy-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sp-crypto-hashing" ,rust-sp-crypto-hashing-0.1)
                       ("rust-sp-debug-derive" ,rust-sp-debug-derive-14)
                       ("rust-sp-externalities" ,rust-sp-externalities-0.26)
                       ("rust-sp-runtime-interface" ,rust-sp-runtime-interface-25)
                       ("rust-sp-std" ,rust-sp-std-14)
                       ("rust-sp-storage" ,rust-sp-storage-20)
                       ("rust-ss58-registry" ,rust-ss58-registry-1)
                       ("rust-substrate-bip39" ,rust-substrate-bip39-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-w3f-bls" ,rust-w3f-bls-0.1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://substrate.io")
    (synopsis "Shareable Substrate types. (polkadot v1.13.0)")
    (description
     "This package provides Shareable Substrate types. (polkadot v1.13.0).")
    (license license:asl2.0)))

(define-public rust-scale-info-derive-2
  (package
    (name "rust-scale-info-derive")
    (version "2.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-info-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qpbh5cdizdidp12d8z0yznckvwyj82jd8r2lnyp8h8r052ljd9d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-crate" ,rust-proc-macro-crate-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Derive type info for SCALE encodable types")
    (description
     "This package provides Derive type info for SCALE encodable types.")
    (license license:asl2.0)))

(define-public rust-scale-info-2
  (package
    (name "rust-scale-info")
    (version "2.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-info" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "096hkfyvhd673m6rhllqvk6ivkpnxldpda90r0n9wqlk530p187c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitvec" ,rust-bitvec-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info-derive" ,rust-scale-info-derive-2)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Info about SCALE encodable Rust types")
    (description
     "This package provides Info about SCALE encodable Rust types.")
    (license license:asl2.0)))

(define-public rust-parity-scale-codec-derive-3
  (package
    (name "rust-parity-scale-codec-derive")
    (version "3.6.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parity-scale-codec-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b54af85dc1p9j399swl4a7l6yyslrbywfh309j9b56jfsf96c6q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-crate" ,rust-proc-macro-crate-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "")
    (synopsis
     "Serialization and deserialization derive macro for Parity SCALE Codec")
    (description
     "This package provides Serialization and deserialization derive macro for Parity SCALE Codec.")
    (license license:asl2.0)))

(define-public rust-impl-trait-for-tuples-0.2
  (package
    (name "rust-impl-trait-for-tuples")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "impl-trait-for-tuples" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1swmfdzfcfhnyvpm8irr5pvq8vpf8wfbdj91g6jzww8b6gvakmqi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/bkchr/impl-trait-for-tuples")
    (synopsis "Attribute macro to implement a trait for tuples")
    (description
     "This package provides Attribute macro to implement a trait for tuples.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-parity-scale-codec-3
  (package
    (name "rust-parity-scale-codec")
    (version "3.6.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parity-scale-codec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vlmz0cwr6dn286d10wn2jrxbqrmhic0m5xmjrjz3ir9zamh0s1h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-bitvec" ,rust-bitvec-1)
                       ("rust-byte-slice-cast" ,rust-byte-slice-cast-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-parity-scale-codec-derive" ,rust-parity-scale-codec-derive-3)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/paritytech/parity-scale-codec")
    (synopsis "SCALE - Simple Concatenating Aggregated Little Endians")
    (description
     "This package provides SCALE - Simple Concatenating Aggregated Little Endians.")
    (license license:asl2.0)))

(define-public rust-lazy-static-1
  (package
    (name "rust-lazy-static")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lazy_static" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-spin" ,rust-spin-0.9))))
    (home-page "https://github.com/rust-lang-nursery/lazy-static.rs")
    (synopsis "macro for declaring lazily evaluated statics in Rust.")
    (description
     "This package provides a macro for declaring lazily evaluated statics in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-entropy-shared-0.2
  (package
    (name "rust-entropy-shared")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12629js1w7rqzhm893hp32vfqqb14w245rhdjlhvxcrwrh83kmb3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hex-literal" ,rust-hex-literal-0.4)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-sp-core" ,rust-sp-core-29)
                       ("rust-sp-runtime" ,rust-sp-runtime-32)
                       ("rust-sp-std" ,rust-sp-std-12)
                       ("rust-strum" ,rust-strum-0.26)
                       ("rust-strum-macros" ,rust-strum-macros-0.26)
                       ("rust-subxt" ,rust-subxt-0.35))))
    (home-page "https://entropy.xyz/")
    (synopsis
     "Shared types used by the Entropy chain node and Entropy Threshold Signing Server")
    (description
     "This package provides Shared types used by the Entropy chain node and Entropy Threshold Signing
Server.")
    (license license:agpl3+)))

(define-public rust-async-trait-0.1
  (package
    (name "rust-async-trait")
    (version "0.1.82")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-trait" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wfz9p7x1hhdw8vj47wlsj319s3j84z6a7xgid6gli0sdqx8lyx2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dtolnay/async-trait")
    (synopsis "Type erasure for async trait methods")
    (description "This package provides Type erasure for async trait methods.")
    (license (list license:expat license:asl2.0))))

(define-public rust-entropy-protocol-0.2
  (package
    (name "rust-entropy-protocol")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-protocol" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04aa43bcmdbbr1bqnyv6pbncn0662wq3bzmzkkm9nx5pzpgw8vdr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-axum" ,rust-axum-0.7)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-entropy-shared" ,rust-entropy-shared-0.2)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-gloo-net" ,rust-gloo-net-0.5)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-hpke-rs" ,rust-hpke-rs-0.2)
                       ("rust-hpke-rs-crypto" ,rust-hpke-rs-crypto-0.2)
                       ("rust-hpke-rs-rust-crypto" ,rust-hpke-rs-rust-crypto-0.2)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-snow" ,rust-snow-0.9)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-subxt" ,rust-subxt-0.35)
                       ("rust-synedrion" ,rust-synedrion-0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.23)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-derive" ,rust-wasm-bindgen-derive-0.3)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://entropy.xyz/")
    (synopsis "Entropy Signing and DKG protocol execution and transport logic")
    (description
     "This package provides Entropy Signing and DKG protocol execution and transport logic.")
    (license license:agpl3+)))

(define-public rust-entropy-client-0.2
  (package
    (name "rust-entropy-client")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "001a08dgvw1k5in2bbd31p1yfl9yda3b4ak5zd017is2254nmc8n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-entropy-protocol" ,rust-entropy-protocol-0.2)
                       ("rust-entropy-shared" ,rust-entropy-shared-0.2)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-num" ,rust-num-0.4)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-reqwest" ,rust-reqwest-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-subxt" ,rust-subxt-0.35)
                       ("rust-synedrion" ,rust-synedrion-0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-2))))
    (home-page "https://entropy.xyz/")
    (synopsis "client for the Entropy chain node and Entropy TSS server")
    (description
     "This package provides a client for the Entropy chain node and Entropy TSS
server.")
    (license license:agpl3+)))

(define-public rust-clap-derive-4
  (package
    (name "rust-clap-derive")
    (version "4.5.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1860xq3rbgwsqwcj9rd14cky9iiywwx86j7fvvngdjixbyfka7ah"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.5)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis "Parse command line argument by defining a struct, derive crate")
    (description
     "This package provides Parse command line argument by defining a struct, derive crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustc-demangle-0.1
  (package
    (name "rust-rustc-demangle")
    (version "0.1.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-demangle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07zysaafgrkzy2rjgwqdj2a8qdpsm6zv6f5pgpk9x0lm40z9b6vi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/rustc-demangle")
    (synopsis "Rust compiler symbol demangling.")
    (description "This package provides Rust compiler symbol demangling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ahash-0.8
  (package
    (name "rust-ahash")
    (version "0.8.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ahash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04chdfkls5xmhp1d48gnjsmglbqibizs3bpbj6rsj604m10si7g8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic-polyfill" ,rust-atomic-polyfill-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-const-random" ,rust-const-random-0.1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-version-check" ,rust-version-check-0.9)
                       ("rust-zerocopy" ,rust-zerocopy-0.7))))
    (home-page "https://github.com/tkaitchuck/ahash")
    (synopsis
     "non-cryptographic hash function using AES-NI for high performance")
    (description
     "This package provides a non-cryptographic hash function using AES-NI for high
performance.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmparser-0.216
  (package
    (name "rust-wasmparser")
    (version "0.216.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qr8j1c15r208d9nsjw01x3w71m9i4g756djnhgk37b1lfzfdpmw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 #;unknown-license! license:asl2.0
                   license:expat))))

(define-public rust-ruzstd-0.7
  (package
    (name "rust-ruzstd")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ruzstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x0rymfy85j5xcai2vwmcsdaydxzvxy7zrxsbig997xx4qyqz2qw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://github.com/KillingSpark/zstd-rs")
    (synopsis "decoder for the zstd compression format")
    (description
     "This package provides a decoder for the zstd compression format.")
    (license license:expat)))

(define-public rust-object-0.36
  (package
    (name "rust-object")
    (version "0.36.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02h7k38dwi8rndc3y81n6yjxijbss99p2jm9c0b6ak5c45c1lkq8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-ruzstd" ,rust-ruzstd-0.7)
                       ("rust-wasmparser" ,rust-wasmparser-0.216))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file
formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-jobserver-0.1
  (package
    (name "rust-jobserver")
    (version "0.1.32")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jobserver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l2k50qmj84x9mn39ivjz76alqmx72jhm12rw33zx9xnpv5xpla8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/rust-lang/jobserver-rs")
    (synopsis "An implementation of the GNU Make jobserver for Rust.")
    (description
     "This package provides An implementation of the GNU Make jobserver for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cc-1
  (package
    (name "rust-cc")
    (version "1.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02qy8a9c7vabnk7lcaahdkngjg4r6ywafldihq73q29pnzn17l79"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-jobserver" ,rust-jobserver-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-shlex" ,rust-shlex-1))))
    (home-page "https://github.com/rust-lang/cc-rs")
    (synopsis
     "build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.")
    (description
     "This package provides a build-time dependency for Cargo build scripts to assist
in invoking the native C compiler to compile native C code into a static archive
to be linked into Rust code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmparser-0.202
  (package
    (name "rust-wasmparser")
    (version "0.202.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04qljgwjv6a6nn9sx6bbz167s0dim4liphgp1sc8ngygscaqb6fn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 #;unknown-license!))))

(define-public rust-ruzstd-0.6
  (package
    (name "rust-ruzstd")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ruzstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yygqpar2x910lnii4k5p43aj4943hlnxpczmqhsfddmxrqa8x2i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://github.com/KillingSpark/zstd-rs")
    (synopsis "decoder for the zstd compression format")
    (description
     "This package provides a decoder for the zstd compression format.")
    (license license:expat)))

(define-public rust-object-0.35
  (package
    (name "rust-object")
    (version "0.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pnv84mx3f3p847hfnsp4znivnwkc1x53maq459a92w42fw7mv5q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-ruzstd" ,rust-ruzstd-0.6)
                       ("rust-wasmparser" ,rust-wasmparser-0.202))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file
formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-memmap2-0.9
  (package
    (name "rust-memmap2")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memmap2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08hkmvri44j6h14lyq4yw5ipsp91a9jacgiww4bs9jm8whi18xgy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/RazrFalcon/memmap2-rs")
    (synopsis "Cross-platform Rust API for memory-mapped file IO")
    (description
     "This package provides Cross-platform Rust API for memory-mapped file IO.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.29
  (package
    (name "rust-gimli")
    (version "0.29.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zgzprnjaawmg6zyic4f2q2hc39kdhn116qnkqpgvsasgc3x9v20"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-addr2line-0.22
  (package
    (name "rust-addr2line")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y66f1sa27i9kvmlh76ynk60rxfrmkba9ja8x527h32wdb206ibf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-gimli" ,rust-gimli-0.29)
                       ("rust-memmap2" ,rust-memmap2-0.9)
                       ("rust-object" ,rust-object-0.35)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/gimli-rs/addr2line")
    (synopsis
     "cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust,
using `gimli`.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-backtrace-0.3
  (package
    (name "rust-backtrace")
    (version "0.3.73")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "backtrace" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02iffg2pkg5nc36pgml8il7f77s138hhjw9f9l56v5zqlilk5hjw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-addr2line" ,rust-addr2line-0.22)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-miniz-oxide" ,rust-miniz-oxide-0.7)
                       ("rust-object" ,rust-object-0.36)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rust-lang/backtrace-rs")
    (synopsis
     "library to acquire a stack trace (backtrace) at runtime in a Rust program.")
    (description
     "This package provides a library to acquire a stack trace (backtrace) at runtime
in a Rust program.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anstyle-1
  (package
    (name "rust-anstyle")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anstyle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cfmkza63xpn1kkz844mgjwm9miaiz4jkyczmwxzivcsypk1vv0v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-cli/anstyle")
    (synopsis "ANSI text styling")
    (description "This package provides ANSI text styling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-builder-4
  (package
    (name "rust-clap-builder")
    (version "4.5.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wqsnajayxqpmqflqiqgpix2m8jrjwj6nayssvcpl13smw9dvwlc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anstream" ,rust-anstream-0.6)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-clap-lex" ,rust-clap-lex-0.7)
                       ("rust-strsim" ,rust-strsim-0.11)
                       ("rust-terminal-size" ,rust-terminal-size-0.3)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-4
  (package
    (name "rust-clap")
    (version "4.5.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b7nx9wsv5kc4n02ql4ca6p7pjh1n94rjk1n7hdjywsy96w22niy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap-builder" ,rust-clap-builder-4)
                       ("rust-clap-derive" ,rust-clap-derive-4))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bytes-1
  (package
    (name "rust-bytes")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0l5sf69avjxcw41cznyzxsnymwmkpmk08q0sm7fgicvvn0ysa643"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/tokio-rs/bytes")
    (synopsis "Types and traits for working with bytes")
    (description
     "This package provides Types and traits for working with bytes.")
    (license license:expat)))

(define-public rust-bitcoin-hashes-0.11
  (package
    (name "rust-bitcoin-hashes")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin_hashes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i3v3fh92cps71qif11dw708bs5fpdxx1fk01m3sc5b8xs6ln1lh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-core2" ,rust-core2-0.3)
                       ("rust-schemars" ,rust-schemars-0.6)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/rust-bitcoin")
    (synopsis "Hash functions used by the rust-bitcoin eccosystem")
    (description
     "This package provides Hash functions used by the rust-bitcoin eccosystem.")
    (license license:cc0)))

(define-public rust-bip39-2
  (package
    (name "rust-bip39")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bip39" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0br1kyk12ndjjjlnzlh52aypipsmiaivjyzbfr2rs2xz41b67wlk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitcoin-hashes" ,rust-bitcoin-hashes-0.11)
                       ("rust-rand" ,rust-rand-0.6)
                       ("rust-rand-core" ,rust-rand-core-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/rust-bitcoin/rust-bip39/")
    (synopsis "Library for BIP-39 Bitcoin mnemonic codes")
    (description
     "This package provides Library for BIP-39 Bitcoin mnemonic codes.")
    (license license:cc0)))

(define-public rust-sync-wrapper-1
  (package
    (name "rust-sync-wrapper")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sync_wrapper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "150k6lwvr4nl237ngsz8fj5j78k712m4bggrfyjsidllraz5l1m7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3))))
    (home-page "https://docs.rs/sync_wrapper")
    (synopsis
     "tool for enlisting the compiler's help in proving the absence of concurrency")
    (description
     "This package provides a tool for enlisting the compiler's help in proving the
absence of concurrency.")
    (license license:asl2.0)))

(define-public rust-axum-0.7
  (package
    (name "rust-axum")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kyb7pzgn60crl9wyq7dhciv40sxdr1mbqx2r4s7g9j253qrlv1s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-axum-core" ,rust-axum-core-0.4)
                       ("rust-axum-macros" ,rust-axum-macros-0.4)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-1)
                       ("rust-http-body" ,rust-http-body-1)
                       ("rust-http-body-util" ,rust-http-body-util-0.1)
                       ("rust-hyper" ,rust-hyper-1)
                       ("rust-hyper-util" ,rust-hyper-util-0.1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-matchit" ,rust-matchit-0.7)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-multer" ,rust-multer-3)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-path-to-error" ,rust-serde-path-to-error-0.1)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-sync-wrapper" ,rust-sync-wrapper-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.21)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-http" ,rust-tower-http-0.5)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/tokio-rs/axum")
    (synopsis "Web framework that focuses on ergonomics and modularity")
    (description
     "This package provides Web framework that focuses on ergonomics and modularity.")
    (license license:expat)))

(define rust-entropy-tss-0.2
  (package
    (name "entropy-tss")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-tss" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n3ndcq0h1yffarpj47z44q2h04jl6h13bxnx2rfj7yv6gvvvqz3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-axum" ,rust-axum-0.7)
        ("rust-base64" ,rust-base64-0.22)
        ("rust-bincode" ,rust-bincode-1)
        ("rust-bip39" ,rust-bip39-2)
        ("rust-blake2" ,rust-blake2-0.10)
        ("rust-bytes" ,rust-bytes-1)
        ("rust-clap" ,rust-clap-4)
        ("rust-entropy-client" ,rust-entropy-client-0.2)
        ("rust-entropy-kvdb" ,rust-entropy-kvdb-0.2)
        ("rust-entropy-programs-runtime" ,rust-entropy-programs-runtime-0.10)
        ("rust-entropy-protocol" ,rust-entropy-protocol-0.2)
        ("rust-entropy-shared" ,rust-entropy-shared-0.2)
        ("rust-futures" ,rust-futures-0.3)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-hkdf" ,rust-hkdf-0.12)
        ("rust-hostname" ,rust-hostname-0.4)
        ("rust-num" ,rust-num-0.4)
        ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
        ("rust-rand-core" ,rust-rand-core-0.6)
        ("rust-reqwest" ,rust-reqwest-0.12)
        ("rust-reqwest-eventsource" ,rust-reqwest-eventsource-0.6)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-sha1" ,rust-sha1-0.10)
        ("rust-sha2" ,rust-sha2-0.10)
        ("rust-sha3" ,rust-sha3-0.10)
        ("rust-snow" ,rust-snow-0.9)
        ("rust-sp-core" ,rust-sp-core-31)
        ("rust-strum" ,rust-strum-0.26)
        ("rust-subxt" ,rust-subxt-0.35)
        ("rust-synedrion" ,rust-synedrion-0.1)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-tokio" ,rust-tokio-1)
        ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.23)
        ("rust-tower-http" ,rust-tower-http-0.5)
        ("rust-tracing" ,rust-tracing-0.1)
        ("rust-tracing-bunyan-formatter" ,rust-tracing-bunyan-formatter-0.3)
        ("rust-tracing-loki" ,rust-tracing-loki-0.2)
        ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3)
        ("rust-uuid" ,rust-uuid-1)
        ("rust-vergen" ,rust-vergen-8)
        ("rust-x25519-dalek" ,rust-x25519-dalek-2)
        ("rust-zeroize" ,rust-zeroize-1))
       #:cargo-development-inputs
       (("rust-blake3" ,rust-blake3-1)
        ("rust-ethers-core" ,rust-ethers-core-2)
        ("rust-hex-literal" ,rust-hex-literal-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-more-asserts" ,rust-more-asserts-0.3)
        ("rust-project-root" ,rust-project-root-0.2)
        ("rust-schemars" ,rust-schemars-0.8)
        ("rust-schnorrkel" ,rust-schnorrkel-0.11)
        ("rust-serial-test" ,rust-serial-test-3)
        ("rust-sp-keyring" ,rust-sp-keyring-34)
        ("rust-subxt-signer" ,rust-subxt-signer-0.35))))
    (native-inputs (list pkg-config))
    (inputs (list openssl zlib #| needed? |# (list zstd "lib")))
    (home-page "https://entropy.xyz/")
    (synopsis "Entropy threshold signature scheme (TSS) server")
    (description
     "This package provides Entropy threshold signature scheme (TSS) server.")
    (license license:agpl3+)))

(define-public entropy-tss rust-entropy-tss-0.2)
