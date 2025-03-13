;; Copyright © 2024 Entropy <hi@entropy.xyz>

;; TODO: Cleanup openssl inputs
(define-module (teeeee packages entropy)
  #:use-module (teeeee packages utils)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages rust)
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
     "This package provides Keyring support code for the runtime.  A set of test accounts.")
    (license license:asl2.0)))

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
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "auto_impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wxxzzv4f2s73yfflysza7mv0prd0jd5dgsciis0qdp5kpsq4a71"))))
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
     "This package provides Automatically implement traits for common smart pointers and closures.")
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
     "Fast RLP serialization library. This crate is a yanked version of FastRLP 0.1.2 which was Apache licensed")
    (description
     "This package provides Fast RLP serialization library.  This crate is a yanked version of
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
     "This package provides Easy to use conversion of ethereum contract calls to bytecode.")
    (license license:asl2.0)))

(define-public rust-const-hex-1
  (package
    (name "rust-const-hex")
    (version "1.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "const-hex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "030nnsbd0pvkibpqh8pky3wabzhr30wwagvjy6l1ic1rp2x8a12b"))))
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

(define-public rust-loki-api-0.1
  (package
    (name "rust-loki-api")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "loki-api" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09z3p0s2h8glzz1l30zqjdm7c2n791m7cxiqz9p3x82r9wq8mhxx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-prost" ,rust-prost-0.13)
                       ("rust-prost-types" ,rust-prost-types-0.13))))
    (home-page "https://github.com/hrxi/tracing-loki")
    (synopsis "Protobuf types used by the Grafana Loki HTTP API")
    (description
     "This package provides Protobuf types used by the Grafana Loki HTTP API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracing-loki-0.2
  (package
    (name "rust-tracing-loki")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-loki" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d1x0lip9p243x1l1bkibf51ya73v9mdm3ny37brkpzv374ywfxs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-loki-api" ,rust-loki-api-0.1)
                       ("rust-reqwest" ,rust-reqwest-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-snap" ,rust-snap-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1)
                       ("rust-tracing-log" ,rust-tracing-log-0.2)
                       ("rust-tracing-serde" ,rust-tracing-serde-0.2)
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
    (version "0.3.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-bunyan-formatter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0494v2llah1mg42kn34ii8sbba2rdh42wj7nipa4nxyql12p4qrd"))))
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

(define-public rust-tdx-quote-0.0.1
  (package
    (name "rust-tdx-quote")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tdx-quote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q63n4pvxyn9mq0rcj6sfrnkn6k2zr8ypxjh835kq5cm0caf63z1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-nom" ,rust-nom-7)
                       ("rust-p256" ,rust-p256-0.13)
                       ("rust-sha2" ,rust-sha2-0.10))))
    (home-page "https://github.com/entropyxyz/tdx-quote")
    (synopsis "Parses and verifies Intel TDX quotes")
    (description "This package provides Parses and verifies Intel TDX quotes.")
    (license license:agpl3+)))

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
     "This package provides Simple utility to return the absolute path to your project root.")
    (license (list license:expat license:asl2.0))))

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
     "This package provides Standalone environment support for @code{WebAssembly} code in Cranelift.")
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
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language for instruction selection in Cranelift")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
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
     "This package provides For code shared between cranelift-codegen-meta and cranelift-codegen.")
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

(define-public rust-entropy-kvdb-0.3
  (package
    (name "rust-entropy-kvdb")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-kvdb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nsh97vrswa1dwwp23phzl88rvhdhvqkm8kh31gicd8kplbj8liq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode" ,rust-bincode-1)
                       ("rust-chacha20poly1305" ,rust-chacha20poly1305-0.9)
                       ("rust-entropy-protocol" ,rust-entropy-protocol-0.3)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rpassword" ,rust-rpassword-7)
                       ("rust-scrypt" ,rust-scrypt-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sled" ,rust-sled-0.34)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-synedrion" ,rust-synedrion-0.2)
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

(define-public rust-serde-encoded-bytes-0.1
  (package
    (name "rust-serde-encoded-bytes")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-encoded-bytes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "038pkdfaqgwrbcax7a0fzz0rxap78hf847d2bqc00c1gw7i9nxvi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.22)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/fjarri/serde-encoded-bytes")
    (synopsis "Efficient bytestring serialization for Serde-supporting types")
    (description
     "This package provides Efficient bytestring serialization for Serde-supporting types.")
    (license license:expat)))

(define-public rust-hashing-serializer-0.1
  (package
    (name "rust-hashing-serializer")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hashing-serializer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vkg4fy1vc3fq11vmgdjfj56vkd4va25ww7mw05g8fvwwjjv3jb6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-digest" ,rust-digest-0.10)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/fjarri/hashing-serializer")
    (synopsis "Serialize serde-implementing structures directly into a hash")
    (description
     "This package provides Serialize serde-implementing structures directly into a hash.")
    (license license:expat)))

(define-public rust-gmp-mpfr-sys-1
  (package
    (name "rust-gmp-mpfr-sys")
    (version "1.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gmp-mpfr-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "062rdfp1f9nsvxhrknkl5i7w8c1a6ladf5pm7jv67g2r43c5q85h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://gitlab.com/tspiteri/gmp-mpfr-sys")
    (synopsis "Rust FFI bindings for GMP, MPFR and MPC")
    (description
     "This package provides Rust FFI bindings for GMP, MPFR and MPC.")
    (license license:lgpl3+)))

(define-public rust-rug-1
  (package
    (name "rust-rug")
    (version "1.27.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rug" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hybpn1fv0ifas6pwg6hsf17f3fdih4250ys9dbypf75d3bfh1s2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-az" ,rust-az-1)
                       ("rust-gmp-mpfr-sys" ,rust-gmp-mpfr-sys-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://gitlab.com/tspiteri/rug")
    (synopsis
     "Arbitrary-precision integers, rational, floating-point and complex numbers based
on GMP, MPFR and MPC")
    (description
     "This package provides Arbitrary-precision integers, rational, floating-point and complex numbers based
on GMP, MPFR and MPC.")
    (license license:lgpl3+)))

(define-public rust-glass-pumpkin-1
  (package
    (name "rust-glass-pumpkin")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glass_pumpkin" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sfb4drjgy7cwkzkcnsb7vva92fzy35xsx93rimwx25aqqp1kisn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-core2" ,rust-core2-0.4)
                       ("rust-num-bigint" ,rust-num-bigint-0.4)
                       ("rust-num-integer" ,rust-num-integer-0.1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rand-core" ,rust-rand-core-0.6))))
    (home-page "https://crates.io/crates/glass_pumpkin")
    (synopsis
     "cryptographically secure prime number generator based on rust's own num-bigint and num-integer")
    (description
     "This package provides a cryptographically secure prime number generator based on
rust's own num-bigint and num-integer.")
    (license license:asl2.0)))

(define-public rust-crypto-primes-0.6
  (package
    (name "rust-crypto-primes")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crypto-primes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y4qzlmi8iwpyvnpg4gy0h9njl21jz6f23m8nl450x31g4aszjra"))
       (snippet
        #~(begin (use-modules (guix build utils))
                 ;; Use a packaged version of web-view.
                 (substitute* "Cargo.toml"
                   (("rust-version = .*")
                    (string-append "rust-version = "
                                   "\"" #$(package-version rust) "\"\n")))))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crypto-bigint" ,rust-crypto-bigint-0.6)
                       ("rust-glass-pumpkin" ,rust-glass-pumpkin-1)
                       ("rust-openssl" ,rust-openssl-0.10)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rug" ,rust-rug-1))))
    (home-page "https://github.com/entropyxyz/crypto-primes")
    (synopsis "Random prime number generation and primality checking library")
    (description
     "This package provides Random prime number generation and primality checking library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-serdect-0.3
  (package
    (name "rust-serdect")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serdect" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lxg0h383pmnh1h3dv7m1dhzgslasy9rrnsjjrgimdc54gd6fbzl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base16ct" ,rust-base16ct-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/formats/tree/master/serdect")
    (synopsis
     "Constant-time serde serializer/deserializer helpers for data that potentially
contains secrets (e.g. cryptographic keys)")
    (description
     "This package provides Constant-time serde serializer/deserializer helpers for data that potentially
contains secrets (e.g. cryptographic keys).")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rlp-derive-0.2
  (package
    (name "rust-rlp-derive")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rlp-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cq8p43zkfrl0cr0vs0s6py0xjrj992ya66a22g94mxax96v6bb5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "http://parity.io")
    (synopsis "Derive macro for #[derive(RlpEncodable, RlpDecodable)]")
    (description
     "This package provides Derive macro for #[derive(@code{RlpEncodable}, @code{RlpDecodable})].")
    (license (list license:expat license:asl2.0))))

(define-public rust-rlp-0.6
  (package
    (name "rust-rlp")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rlp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qvr8kcm0zfrsgj9d1hb8a66n1zpz4fsfqfnfsxrhcd8n8myj97s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-rlp-derive" ,rust-rlp-derive-0.2)
                       ("rust-rustc-hex" ,rust-rustc-hex-2))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "Recursive-length prefix encoding, decoding, and compression")
    (description
     "This package provides Recursive-length prefix encoding, decoding, and compression.")
    (license (list license:expat license:asl2.0))))

(define-public rust-typenum-1
  (package
    (name "rust-typenum")
    (version "1.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typenum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gwgz8n91pv40gabrr1lzji0b0hsmg0817njpy397bq7rvizzk0x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-scale-info" ,rust-scale-info-1))))
    (home-page "https://github.com/paholg/typenum")
    (synopsis
     "Typenum is a Rust library for type-level numbers evaluated at
    compile time. It currently supports bits, unsigned integers, and signed
    integers. It also provides a type-level array of type-level numbers, but its
    implementation is incomplete")
    (description
     "This package provides Typenum is a Rust library for type-level numbers evaluated at compile time.  It
currently supports bits, unsigned integers, and signed integers.  It also
provides a type-level array of type-level numbers, but its implementation is
incomplete.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hybrid-array-0.2
  (package
    (name "rust-hybrid-array")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hybrid-array" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1afjq3ap0p1lal70x5pmcpa6pqpzhqcddmlq59kgijad8l2milzj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-typenum" ,rust-typenum-1)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/hybrid-array")
    (synopsis
     "Hybrid typenum-based and const generic array types designed to provide the
flexibility of typenum-based expressions while also allowing interoperability
and a transition path to const generics")
    (description
     "This package provides Hybrid typenum-based and const generic array types designed to provide the
flexibility of typenum-based expressions while also allowing interoperability
and a transition path to const generics.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crypto-bigint-0.6
  (package
    (name "rust-crypto-bigint")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crypto-bigint" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c3i8qcvfn1wbjdpambliwjs72bqzg8hl60b4l4px04by8pjq9wn"))
       (snippet
        #~(begin (use-modules (guix build utils))
                 ;; Use a packaged version of web-view.
                 (substitute* "Cargo.toml"
                   (("rust-version = .*")
                    (string-append "rust-version = "
                                   "\"" #$(package-version rust) "\"\n")))))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:skip-build? #t
      #:phases
      #~(modify-phases %standard-phases
          ;; `#![feature]` may not be used on the stable release channel
          ;; Enable using nightly/dev features
          (add-after 'unpack 'enable-unstable-features
            (lambda _ (setenv "RUSTC_BOOTSTRAP" "1"))))
      #:cargo-inputs `(("rust-der" ,rust-der-0.7)
                       ("rust-hybrid-array" ,rust-hybrid-array-0.2)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-rlp" ,rust-rlp-0.6)
                       ("rust-serdect" ,rust-serdect-0.3)
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

(define-public rust-unty-0.0.4
  (package
    (name "rust-unty")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unty" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1blhyv01qiv5sb72sal3xa1l8nzck3answawxkkiw3fd2x1phjbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bincode-org/unty")
    (synopsis "Explicitly types your generics")
    (description "This package provides Explicitly types your generics.")
    (license (list license:expat license:asl2.0))))

(define-public rust-virtue-0.0.18
  (package
    (name "rust-virtue")
    (version "0.0.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "virtue" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cgp79pzzs117kjlc3jnnkixbyaqri12j40mx2an41qhrymv27h5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1))))
    (home-page "https://github.com/bincode-org/virtue")
    (synopsis "sinless derive macro helper")
    (description "This package provides a sinless derive macro helper.")
    (license license:expat)))

(define-public rust-bincode-derive-2
  (package
    (name "rust-bincode-derive")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bincode_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "029wmh26hq3hhs1gq629y0frn2pkl7ld061rk23fji8g8jd715dz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-virtue" ,rust-virtue-0.0.18))))
    (home-page "https://github.com/bincode-org/bincode")
    (synopsis "Implementation of #[derive(Encode, Decode)] for bincode")
    (description
     "This package provides Implementation of #[derive(Encode, Decode)] for bincode.")
    (license license:expat)))

(define-public rust-bincode-2
  (package
    (name "rust-bincode")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bincode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h5pxp3dqkigjwy926a03sl69n9wv7aq4142a20kw9lhn3bzbsin"))
       (snippet
        #~(begin (use-modules (guix build utils))
                 ;; Use a packaged version of web-view.
                 (substitute* "Cargo.toml"
                   (("rust-version = .*")
                    (string-append "rust-version = "
                                   "\"" #$(package-version rust) "\"\n")))))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode-derive" ,rust-bincode-derive-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-unty" ,rust-unty-0.0.4))))
    (home-page "https://github.com/bincode-org/bincode")
    (synopsis
     "binary serialization / deserialization strategy for transforming structs into bytes and vice versa!")
    (description
     "This package provides a binary serialization / deserialization strategy for
transforming structs into bytes and vice versa!")
    (license license:expat)))

(define-public rust-synedrion-0.2
  (package
    (name "rust-synedrion")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synedrion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c65ld9z1yc4akla4q8b2vifj2x1qs83aw4wwzwahpyxn1mr66d6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode" ,rust-bincode-2)
                       ("rust-bip32" ,rust-bip32-0.5)
                       ("rust-crypto-bigint" ,rust-crypto-bigint-0.6)
                       ("rust-crypto-primes" ,rust-crypto-primes-0.6)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-displaydoc" ,rust-displaydoc-0.2)
                       ("rust-hashing-serializer" ,rust-hashing-serializer-0.1)
                       ("rust-k256" ,rust-k256-0.13)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-secrecy" ,rust-secrecy-0.10)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-encoded-bytes" ,rust-serde-encoded-bytes-0.1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-signature" ,rust-signature-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/entropyxyz/synedrion")
    (synopsis
     "Threshold signing library based on Canetti-Gennaro-Goldfeder-Makriyannis-Peled '21 scheme")
    (description
     "This package provides Threshold signing library based on Canetti-Gennaro-Goldfeder-Makriyannis-Peled
21 scheme.")
    (license license:agpl3+)))

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
    (version "0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pqcrypto-internals" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08nzi6llk7c2qll8qlfgmhfwbgvbndy7g58wg1gy1zrg62g8wh2z"))))
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

(define-public rust-gloo-net-0.6
  (package
    (name "rust-gloo-net")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gloo-net" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1005q761m8kbifc01pvjyjfpj0qs3szh8qaxni13vjjq39xn4vy0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-gloo-utils" ,rust-gloo-utils-0.2)
                       ("rust-http" ,rust-http-1)
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Patricia trie stuff using a parity-scale-codec node format")
    (description
     "This package provides Patricia trie stuff using a parity-scale-codec node format.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate State Machine")
    (description "This package provides Substrate State Machine.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Keystore primitives")
    (description "This package provides Keystore primitives.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "I/O for Substrate runtimes")
    (description "This package provides I/O for Substrate runtimes.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis
     "Provides facilities for generating application specific crypto wrapper types")
    (description
     "This package provides facilities for generating application specific crypto
wrapper types.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Runtime Modules shared primitive types")
    (description
     "This package provides Runtime Modules shared primitive types.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate runtime interface")
    (description "This package provides Substrate runtime interface.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate externalities abstraction")
    (description "This package provides Substrate externalities abstraction.")
    (license license:asl2.0)))

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
       #:cargo-inputs (("rust-bitcoin-hashes" ,rust-bitcoin-hashes-0.14)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1)
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Shareable Substrate types")
    (description "This package provides Shareable Substrate types.")
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
                       ("rust-frame-metadata" ,rust-frame-metadata-15.1)
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

(define-public rust-addr2line-0.21
  (package
    (name "rust-addr2line")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jx0k3iwyqr8klqbzk6kjvr496yd94aspis10vwsj5wy7gib4c4a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-object" ,rust-object-0.32)
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

(define-public rust-gimli-0.28
  (package
    (name "rust-gimli")
    (version "0.28.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lv23wc8rxvmjia3mcxc6hj9vkqnv1bqq0h8nzjcgf71mrxx6wa2"))))
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

(define-public rust-nom-1
  (package
    (name "rust-nom")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kjh42w67z1hh1dw3jrilgqrf54jk2xcvhw4rcdm4wclzmbc5f55"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-regex" ,rust-regex-0.1))))
    (home-page "https://github.com/rust-bakery/nom")
    (synopsis "byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library.")
    (license license:expat)))

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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Patricia trie stuff using a parity-scale-codec node format")
    (description
     "This package provides Patricia trie stuff using a parity-scale-codec node format.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate State Machine")
    (description "This package provides Substrate State Machine.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Keystore primitives")
    (description "This package provides Keystore primitives.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "I/O for Substrate runtimes")
    (description "This package provides I/O for Substrate runtimes.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis
     "Provides facilities for generating application specific crypto wrapper types")
    (description
     "This package provides facilities for generating application specific crypto
wrapper types.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Runtime Modules shared primitive types")
    (description
     "This package provides Runtime Modules shared primitive types.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate runtime interface")
    (description "This package provides Substrate runtime interface.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Storage related primitives")
    (description "This package provides Storage related primitives.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate externalities abstraction")
    (description "This package provides Substrate externalities abstraction.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Shareable Substrate types")
    (description "This package provides Shareable Substrate types.")
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

(define-public rust-frame-metadata-15.1
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
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info" ,rust-scale-info-2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://substrate.dev")
    (synopsis "Metadata types for Substrate runtimes")
    (description
     "This package provides Metadata types for Substrate runtimes.")
    (license license:asl2.0)))

(define-public rust-frame-metadata-15
  (package
    (name "rust-frame-metadata")
    (version "15.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "frame-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "037mp88dddy21a7pl989v5n51l5mbn7rrkysjhz2kqnxx3nr7a7j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:features '("derive")
       #:cargo-build-flags '("--release" "--features" "v14")
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
     `(#:skip-build? #t
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
    (synopsis
     "Lowest-abstraction level for the Substrate runtime: just exports useful primitives from std or client/alloc to be used with any code that depends on the runtime")
    (description
     "This package provides Lowest-abstraction level for the Substrate runtime: just exports useful
primitives from std or client/alloc to be used with any code that depends on the
runtime.")
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
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "schnellru" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j8ngnis4qk1gncwpf2m5g4jlrrry0cbv5ifwpcn7skvy6xqaqim"))))
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Patricia trie stuff using a parity-scale-codec node format")
    (description
     "This package provides Patricia trie stuff using a parity-scale-codec node format.")
    (license license:asl2.0)))

(define-public rust-sp-panic-handler-13
  (package
    (name "rust-sp-panic-handler")
    (version "13.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sp-panic-handler" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1spfg2gnsis38wn3900gwls7gbpb0bpc3k8gl47glmxk80vqniw1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-regex" ,rust-regex-1))))
    (home-page "https://paritytech.github.io/polkadot-sdk/")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate State Machine")
    (description "This package provides Substrate State Machine.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Keystore primitives")
    (description "This package provides Keystore primitives.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "I/O for Substrate runtimes")
    (description "This package provides I/O for Substrate runtimes.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis
     "Provides facilities for generating application specific crypto wrapper types")
    (description
     "This package provides facilities for generating application specific crypto
wrapper types.")
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
    (arguments
     `(#:skip-build? #t))
    (home-page "https://gitlab.com/pwoolcoc/common-path")
    (synopsis "Finds the common prefix between a set of paths")
    (description
     "This package provides Finds the common prefix between a set of paths.")
    (license (list license:expat license:asl2.0))))

(define-public rust-docify-macros-0.2
  (package
    (name "rust-docify-macros")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docify_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xszr6j2ydmpidri3rlxw2spnrjsyfdv36aag0a2lihakcjbxrk0"))))
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
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docify" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15jq58njb2bpq2dsj5vny4z4bqda2w5w3p1d8dhg1j1p30mvcwm7"))))
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Runtime Modules shared primitive types")
    (description
     "This package provides Runtime Modules shared primitive types.")
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
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "w3f-bls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "094hw6a6xmbpzam982aj3aqc8273q3zp2nx1jwmaxfy80j4058vh"))))
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
    (version "1.51.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ss58-registry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f4lnkwnsxp74ag9679l0ri0dv2j1fprb0vj3inq2mcfk49ryh0r"))))
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

(define-public rust-wasmparser-0.227
  (package
    (name "rust-wasmparser")
    (version "0.227.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ckqsv60i08fyhds7vaxgcwqhwzv5p3ckk4vmdhr8g7vfkbwll8g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.15)
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

(define-public rust-wasm-encoder-0.227
  (package
    (name "rust-wasm-encoder")
    (version "0.227.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08kqd9lmpncf10p9y60lq7wani217l7ppcj36hc0ggvz5vq75fw0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128fmt" ,rust-leb128fmt-0.1)
                       ("rust-wasmparser" ,rust-wasmparser-0.227))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 #;unknown-license! license:asl2.0
                   license:expat))))

(define-public rust-leb128fmt-0.1
  (package
    (name "rust-leb128fmt")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "leb128fmt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bluk/leb128fmt")
    (synopsis "library to encode and decode LEB128 compressed integers.")
    (description
     "This package provides a library to encode and decode LEB128 compressed integers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wast-227
  (package
    (name "rust-wast")
    (version "227.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05i83gy4vhr55hqqclj1g18law4qabsb1fd3glk9sv5i8984xhc5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-gimli" ,rust-gimli-0.31)
                       ("rust-leb128fmt" ,rust-leb128fmt-0.1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.2)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.227))))
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
    (version "1.227.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wat" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k79jhlk0a9xsdgdzsv53rh7dbzi23583m1q6gv6y07ppvar9lxk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-wast" ,rust-wast-227))))
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

(define-public rust-addr2line-0.19
  (package
    (name "rust-addr2line")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15ywmr5wx22q69ffnn79qp65ir5p1x0k2q06plcpv6v74c5xcvx7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
                       ("rust-gimli" ,rust-gimli-0.27)
                       ("rust-object" ,rust-object-0.30)
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

(define-public rust-gimli-0.27
  (package
    (name "rust-gimli")
    (version "0.27.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bpdnkyzi3vp2r0wglwrncbk451zhp46mdl83f6xj4gsmy20kj5n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

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
    (version "0.1.25")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "psm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "125y7h40mkwb64j4v2v7s6f69ilk745kg60w1s2cq62cw8im93pm"))))
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis
     "Types and traits for interfacing between the host and the wasm runtime")
    (description
     "This package provides Types and traits for interfacing between the host and the wasm runtime.")
    (license license:asl2.0)))

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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Instrumentation primitives and macros for Substrate")
    (description
     "This package provides Instrumentation primitives and macros for Substrate.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate runtime interface")
    (description "This package provides Substrate runtime interface.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Storage related primitives")
    (description "This package provides Storage related primitives.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Substrate externalities abstraction")
    (description "This package provides Substrate externalities abstraction.")
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
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rlp" ,rust-rlp-0.5))))
    (home-page "https://github.com/paritytech/parity-common")
    (synopsis "RLP serialization support for uint and fixed hash")
    (description
     "This package provides RLP serialization support for uint and fixed hash.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-hmac-0.8
  (package
    (name "rust-hmac")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hmac" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h48wc7iysh4xd6ci4prh8bb7nszijrh9w3blaaq8a6cilk8hs0j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crypto-mac" ,rust-crypto-mac-0.8)
                       ("rust-digest" ,rust-digest-0.9))))
    (home-page "https://github.com/RustCrypto/MACs")
    (synopsis
     "Generic implementation of Hash-based Message Authentication Code (HMAC)")
    (description
     "This package provides Generic implementation of Hash-based Message Authentication Code (HMAC).")
    (license (list license:expat license:asl2.0))))

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
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dyn-clonable-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fi1fy6r2zaq88n21yszlcdbm66iz3xi2dbgl8vrm5sq83ap31ky"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/kardeiz/objekt-clonable")
    (synopsis "Attribute wrapper for dyn-clone")
    (description "This package provides Attribute wrapper for dyn-clone.")
    (license license:expat)))

(define-public rust-dyn-clonable-0.9
  (package
    (name "rust-dyn-clonable")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dyn-clonable" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01885xap4dmln3yspzyr0mmcwnm9mdhlp80ag0iig3nmpywznvm3"))))
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
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bounded-collections" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0avsrk6rpj01zx0dyhi270p199j1fz99gsaqcg9r226m1s10mv9j"))))
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
    (synopsis
     "collection of Array/Bytes/Hex utilities with full No-STD compatibility.")
    (description
     "This package provides a collection of Array/Bytes/Hex utilities with full No-STD
compatibility.")
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
    (home-page "https://paritytech.github.io/polkadot-sdk/")
    (synopsis "Shareable Substrate types")
    (description "This package provides Shareable Substrate types.")
    (license license:asl2.0)))

(define-public rust-scale-info-derive-2
  (package
    (name "rust-scale-info-derive")
    (version "2.11.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-info-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gvyzvqvyzb7fv9waqj284cziflqi2r29d0zp5wj37kkpwj00qy6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-crate" ,rust-proc-macro-crate-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://www.parity.io/")
    (synopsis "Derive type info for SCALE encodable types")
    (description
     "This package provides Derive type info for SCALE encodable types.")
    (license license:asl2.0)))

(define-public rust-derive-more-impl-1
  (package
    (name "rust-derive-more-impl")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_more-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08mxyd456ygk68v5nfn4dyisn82k647w9ri2jl19dqpvmnp30wyb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-convert-case" ,rust-convert-case-0.6)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/JelteF/derive_more")
    (synopsis "Internal implementation of `derive_more` crate")
    (description
     "This package provides Internal implementation of `derive_more` crate.")
    (license license:expat)))

(define-public rust-derive-more-1
  (package
    (name "rust-derive-more")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive_more" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01cd8pskdjg10dvfchi6b8a9pa1ja1ic0kbn45dl8jdyrfwrk6sa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-more-impl" ,rust-derive-more-impl-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4))))
    (home-page "https://github.com/JelteF/derive_more")
    (synopsis "Adds #[derive(x)] macros for more traits")
    (description
     "This package provides Adds #[derive(x)] macros for more traits.")
    (license license:expat)))

(define-public rust-scale-info-2
  (package
    (name "rust-scale-info")
    (version "2.11.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scale-info" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02sdd1yx0aic804zwwjvys8dxwq8dc2jfnfbm4bhsr52xcr3nsil"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitvec" ,rust-bitvec-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-derive-more" ,rust-derive-more-1)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-scale-info-derive" ,rust-scale-info-derive-2)
                       ("rust-schemars" ,rust-schemars-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://www.parity.io/")
    (synopsis "Info about SCALE encodable Rust types")
    (description
     "This package provides Info about SCALE encodable Rust types.")
    (license license:asl2.0)))

(define-public rust-serde-derive-1
  (package
    (name "rust-serde-derive")
    (version "1.0.219")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "001azhjmj7ya52pmfiw4ppxm16nd44y15j2pf5gkcwrcgz7pc0jv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://serde.rs")
    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "This package provides Macros 1.1 implementation of #[derive(Serialize, Deserialize)].")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-1
  (package
    (name "rust-serde")
    (version "1.0.219")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dl6nyxnsi82a197sd752128a4avm6mxnscywas1jq30srp2q3jz"))))
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

(define-public rust-quote-1
  (package
    (name "rust-quote")
    (version "1.0.40")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1394cxjg6nwld82pzp2d4fp6pmaz32gai1zh9z5hvh0dawww118q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1))))
    (home-page "https://github.com/dtolnay/quote")
    (synopsis "Quasi-quoting macro quote!(...)")
    (description "This package provides Quasi-quoting macro quote!(...).")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro2-1
  (package
    (name "rust-proc-macro2")
    (version "1.0.94")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "114wxb56gdj9vy44q0ll3l2x9niqzcbyqikydmlb5f3h5rsp26d3"))))
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

(define-public rust-parity-scale-codec-derive-3
  (package
    (name "rust-parity-scale-codec-derive")
    (version "3.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parity-scale-codec-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cxp9x8fw9y8jfy6h3vb1xjvfkvfc4h7qdx9zbkiqm5rnrxq672q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-crate" ,rust-proc-macro-crate-3)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/paritytech/parity-scale-codec")
    (synopsis
     "Serialization and deserialization derive macro for Parity SCALE Codec")
    (description
     "This package provides Serialization and deserialization derive macro for Parity SCALE Codec.")
    (license license:asl2.0)))

(define-public rust-impl-trait-for-tuples-0.2
  (package
    (name "rust-impl-trait-for-tuples")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "impl-trait-for-tuples" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nagmq8p805hlg04zqknjd9sjp8h5d5n1r2gk304iy5b8crmmsx0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/bkchr/impl-trait-for-tuples")
    (synopsis "Attribute macro to implement a trait for tuples")
    (description
     "This package provides Attribute macro to implement a trait for tuples.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-const-format-proc-macros-0.2
  (package
    (name "rust-const-format-proc-macros")
    (version "0.2.34")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "const_format_proc_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i3pxxcl4xvwq4mlfg3csb4j0n6v0mhj07p6yk0vlvdirznc4mqx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/rodrimati1992/const_format_crates/")
    (synopsis "Implementation detail of the `const_format` crate")
    (description
     "This package provides Implementation detail of the `const_format` crate.")
    (license license:zlib)))

(define-public rust-const-format-0.2
  (package
    (name "rust-const-format")
    (version "0.2.34")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "const_format" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pb3vx4k0bl3cy45fmba36hzds1jhkr8y9k3j5nnvm4abjb9fvqj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-const-format-proc-macros" ,rust-const-format-proc-macros-0.2)
                       ("rust-konst" ,rust-konst-0.2))))
    (home-page "https://github.com/rodrimati1992/const_format_crates/")
    (synopsis "Compile-time string formatting")
    (description "This package provides Compile-time string formatting.")
    (license license:zlib)))

(define-public rust-parity-scale-codec-3
  (package
    (name "rust-parity-scale-codec")
    (version "3.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parity-scale-codec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gf2in4gq14d2579g9q3rma8s3ys04h6azap5z4mpbwbf78f7zf9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-bitvec" ,rust-bitvec-1)
                       ("rust-byte-slice-cast" ,rust-byte-slice-cast-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-const-format" ,rust-const-format-0.2)
                       ("rust-generic-array" ,rust-generic-array-0.14)
                       ("rust-impl-trait-for-tuples" ,rust-impl-trait-for-tuples-0.2)
                       ("rust-parity-scale-codec-derive" ,rust-parity-scale-codec-derive-3)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/paritytech/parity-scale-codec")
    (synopsis "SCALE - Simple Concatenating Aggregated Little Endians")
    (description
     "This package provides SCALE - Simple Concatenating Aggregated Little Endians.")
    (license license:asl2.0)))

(define-public rust-entropy-shared-0.3
  (package
    (name "rust-entropy-shared")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12ccg60kn4inag201xsaks9jk78vkc13rkrsr70s9345czaghj61"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blake2" ,rust-blake2-0.10)
                       ("rust-hex-literal" ,rust-hex-literal-0.4)
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

(define-public rust-entropy-protocol-0.3
  (package
    (name "rust-entropy-protocol")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-protocol" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "124m7q2ywsdjy1aj40ci3vbmg2jrj3z675kc7j65cgqhnmavzxg4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-axum" ,rust-axum-0.7)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-entropy-shared" ,rust-entropy-shared-0.3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-gloo-net" ,rust-gloo-net-0.6)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-hpke-rs" ,rust-hpke-rs-0.2)
                       ("rust-hpke-rs-crypto" ,rust-hpke-rs-crypto-0.2)
                       ("rust-hpke-rs-rust-crypto" ,rust-hpke-rs-rust-crypto-0.2)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-num" ,rust-num-0.4)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-snow" ,rust-snow-0.9)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-subxt" ,rust-subxt-0.35)
                       ("rust-synedrion" ,rust-synedrion-0.2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.24)
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

(define-public rust-entropy-client-0.3
  (package
    (name "rust-entropy-client")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dfvmgmh4kiwz2mh5j4yalcli68k53bad9jbh7zlp1p2sj1781kv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-entropy-protocol" ,rust-entropy-protocol-0.3)
                       ("rust-entropy-shared" ,rust-entropy-shared-0.3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-num" ,rust-num-0.4)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-reqwest" ,rust-reqwest-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha3" ,rust-sha3-0.10)
                       ("rust-sp-core" ,rust-sp-core-31)
                       ("rust-subxt" ,rust-subxt-0.35)
                       ("rust-synedrion" ,rust-synedrion-0.2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-2))))
    (home-page "https://entropy.xyz/")
    (synopsis "client for the Entropy chain node and Entropy TSS server")
    (description
     "This package provides a client for the Entropy chain node and Entropy TSS
server.")
    (license license:agpl3+)))

(define-public rust-configfs-tsm-0.0.1
  (package
    (name "rust-configfs-tsm")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "configfs-tsm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sq0jvygmplffbz2z1p08q7gmgnfrq5ygs9s01rag7j7bi35kqk9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/entropyxyz/configfs-tsm")
    (synopsis
     "Generate quotes for remote attestation on confidential computing platforms using Linux's configfs-tsm filesystem interface")
    (description
     "This package provides Generate quotes for remote attestation on confidential computing platforms using
Linux's configfs-tsm filesystem interface.")
    (license license:agpl3+)))

(define-public rust-unicode-normalization-0.1
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
     `(#:skip-build? #t
       #:cargo-inputs (("rust-tinyvec" ,rust-tinyvec-1))))
    (home-page "https://github.com/unicode-rs/unicode-normalization")
    (synopsis "This crate provides functions for normalization of
Unicode strings, including Canonical and Compatible
Decomposition and Recomposition, as described in
Unicode Standard Annex #15.")
    (description
     "This crate provides functions for normalization of Unicode strings, including
Canonical and Compatible Decomposition and Recomposition, as described in
Unicode Standard Annex #15.")
    (license (list license:expat license:asl2.0))))

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
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin-io" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bvbhm5yqv3kqrwm5d79yjak1djjkgnkamcc373v1vckgamw8iqb"))))
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

(define-public rust-secp256k1-sys-0.8
  (package
    (name "rust-secp256k1-sys")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "secp256k1-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zm0kw4v8nn2p87h2zwwzpvwy4rvmg26749vfliv5gzgx6wjk8bh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/rust-bitcoin/rust-secp256k1/")
    (synopsis "FFI for Pieter Wuille's `libsecp256k1` library")
    (description
     "This package provides FFI for Pieter Wuille's `libsecp256k1` library.")
    (license license:cc0)))

(define-public rust-dyn-clone-1
  (package
    (name "rust-dyn-clone")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dyn-clone" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b987fhfbf0rp4jrp79s9jg1s9r6shf9kyw5658h0vyhnbqiflj3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/dtolnay/dyn-clone")
    (synopsis "Clone trait that is dyn-compatible")
    (description "This package provides Clone trait that is dyn-compatible.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bitcoin-private-0.1
  (package
    (name "rust-bitcoin-private")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin-private" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mvskwi8hndf1p4d875qli4sfzmbhw1ms5jyqa7g750n05vh2abk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rust-bitcoin/rust-bitcoin/")
    (synopsis "Internal types and macros used by rust-bitcoin ecosystem")
    (description
     "This package provides Internal types and macros used by rust-bitcoin ecosystem.")
    (license license:cc0)))

(define-public rust-bitcoin-hashes-0.12
  (package
    (name "rust-bitcoin-hashes")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitcoin_hashes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "009515xwsczs6qh6qwlmkziff758nggk4nb44c5v5m0kic8ncw2x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitcoin-private" ,rust-bitcoin-private-0.1)
                       ("rust-core2" ,rust-core2-0.3)
                       ("rust-dyn-clone" ,rust-dyn-clone-1)
                       ("rust-schemars" ,rust-schemars-0.6)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/rust-bitcoin")
    (synopsis "Hash functions used by the rust-bitcoin eccosystem")
    (description
     "This package provides Hash functions used by the rust-bitcoin eccosystem.")
    (license license:cc0)))

(define-public rust-secp256k1-0.27
  (package
    (name "rust-secp256k1")
    (version "0.27.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "secp256k1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13wwv91qnx8lsyn891q16a6x6h46zz7m5w086pnmfyia5616p695"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitcoin-hashes" ,rust-bitcoin-hashes-0.12)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-secp256k1-sys" ,rust-secp256k1-sys-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-bitcoin/rust-secp256k1/")
    (synopsis
     "Rust wrapper library for Pieter Wuille's `libsecp256k1`. Implements ECDSA and BIP 340 signatures for the SECG elliptic curve group secp256k1 and related utilities")
    (description
     "This package provides Rust wrapper library for Pieter Wuille's `libsecp256k1`.  Implements ECDSA and
BIP 340 signatures for the SECG elliptic curve group secp256k1 and related
utilities.")
    (license license:cc0)))

(define-public rust-bip32-0.5
  (package
    (name "rust-bip32")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bip32" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0saw83qxz1i9knn0f5nf27dv186al0pn8i68g0fh6kmbpvgx6h6v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bs58" ,rust-bs58-0.5)
                       ("rust-hmac" ,rust-hmac-0.12)
                       ("rust-k256" ,rust-k256-0.13)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pbkdf2" ,rust-pbkdf2-0.12)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-ripemd" ,rust-ripemd-0.1)
                       ("rust-secp256k1" ,rust-secp256k1-0.27)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/iqlusioninc/crates/")
    (synopsis
     "BIP32 hierarchical key derivation implemented in a generic, no_std-friendly
manner. Supports deriving keys using the pure Rust k256 crate or the
C library-backed secp256k1 crate")
    (description
     "This package provides BIP32 hierarchical key derivation implemented in a generic, no_std-friendly
manner.  Supports deriving keys using the pure Rust k256 crate or the C
library-backed secp256k1 crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-anyhow-1.0.89
  (package
    (name "rust-anyhow")
    (version "1.0.89")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anyhow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xh1vg89n56h6nqikcmgbpmkixjds33492klrp9m96xrbmhgizc6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3))
       #:cargo-development-inputs (("rust-futures" ,rust-futures-0.3)
                                   ("rust-rustversion" ,rust-rustversion-1)
                                   ("rust-syn" ,rust-syn-2)
                                   ("rust-thiserror" ,rust-thiserror-1)
                                   ("rust-trybuild" ,rust-trybuild-1))))
    (home-page "https://github.com/dtolnay/anyhow")
    (synopsis "Flexible concrete Error type built on std::error::Error")
    (description
     "This package provides Flexible concrete Error type built on std::error::Error.")
    (license (list license:expat license:asl2.0))))

(define-public rust-entropy-tss-0.3
  (package
    (name "entropy-tss")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "entropy-tss" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y8ww1xx3v93s1cmxp1i8slrn0j5wpgsj86r3kpcdwbk025spymc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.89)
                       ("rust-axum" ,rust-axum-0.7)
                       ("rust-backoff" ,rust-backoff-0.4)
                       ("rust-base64" ,rust-base64-0.22)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bip32" ,rust-bip32-0.5)
                       ("rust-bip39" ,rust-bip39-2)
                       ("rust-blake2" ,rust-blake2-0.10)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-configfs-tsm" ,rust-configfs-tsm-0.0.1)
                       ("rust-entropy-client" ,rust-entropy-client-0.3)
                       ("rust-entropy-kvdb" ,rust-entropy-kvdb-0.3)
                       ("rust-entropy-programs-runtime" ,rust-entropy-programs-runtime-0.10)
                       ("rust-entropy-protocol" ,rust-entropy-protocol-0.3)
                       ("rust-entropy-shared" ,rust-entropy-shared-0.3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-hkdf" ,rust-hkdf-0.12)
                       ("rust-hostname" ,rust-hostname-0.4)
                       ("rust-num" ,rust-num-0.4)
                       ("rust-parity-scale-codec" ,rust-parity-scale-codec-3)
                       ("rust-project-root" ,rust-project-root-0.2)
                       ("rust-rand" ,rust-rand-0.8)
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
                       ("rust-synedrion" ,rust-synedrion-0.2)
                       ("rust-tdx-quote" ,rust-tdx-quote-0.0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.24)
                       ("rust-tower-http" ,rust-tower-http-0.6)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-bunyan-formatter" ,rust-tracing-bunyan-formatter-0.3)
                       ("rust-tracing-loki" ,rust-tracing-loki-0.2)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-vergen" ,rust-vergen-8)
                       ("rust-x25519-dalek" ,rust-x25519-dalek-2)
                       ("rust-zeroize" ,rust-zeroize-1))
       #:cargo-development-inputs (("rust-blake3" ,rust-blake3-1)
                                   ("rust-ethers-core" ,rust-ethers-core-2)
                                   ("rust-hex-literal" ,rust-hex-literal-0.4)
                                   ("rust-lazy-static" ,rust-lazy-static-1)
                                   ("rust-more-asserts" ,rust-more-asserts-0.3)
                                   ("rust-project-root" ,rust-project-root-0.2)
                                   ("rust-schemars" ,rust-schemars-0.8)
                                   ("rust-schnorrkel" ,rust-schnorrkel-0.11)
                                   ("rust-serial-test" ,rust-serial-test-3)
                                   ("rust-sp-keyring" ,rust-sp-keyring-34)
                                   ("rust-subxt-signer" ,rust-subxt-signer-0.35)
                                   ("rust-tdx-quote" ,rust-tdx-quote-0.0.1))))
    (native-inputs (list pkg-config))
    (inputs  (list openssl zlib #| needed? |# (list zstd "lib")))
    (home-page "https://entropy.xyz/")
    (synopsis "Entropy threshold signature scheme (TSS) server")
    (description
     "This package provides Entropy threshold signature scheme (TSS) server.")
    (license license:agpl3+)))
