;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>

(define-module (teeeee packages linux)
  #:use-module (teeeee packages utils)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module ((guix build utils) #:select (find-files invoke))
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix platform)
  #:use-module (guix utils)
  #:use-module (ice-9 match))

(define intel-tdx-patch-list
  '("x86-tdx-zero-out-the-missing-rsi-in-tdx-hypercall-ma.patch"
    "x86-tdx-skip-saving-output-regs-when-seamcall-fails.patch"
    "x86-tdx-make-macros-of-tdcalls-consistent-with-the-s.patch"
    "x86-tdx-rename-tdx-module-call-to-tdcall.patch"
    "x86-tdx-pass-tdcall-seamcall-input-output-registers.patch"
    "x86-tdx-extend-tdx-module-call-to-support-more-tdcal.patch"
    "x86-tdx-make-tdx-hypercall-asm-similar-to-tdx-module.patch"
    "x86-tdx-reimplement-tdx-hypercall-using-tdx-module.patch"
    "x86-tdx-remove-struct-tdx-hypercall-args.patch"
    "x86-virt-tdx-wire-up-basic-seamcall-functions.patch"
    "x86-virt-tdx-make-tdx-module-call-handle-seamcall-ud.patch"
    "x86-virt-tdx-adjust-struct-tdx-module-args-to-use-x8.patch"
    "x86-virt-tdx-detect-tdx-during-kernel-boot.patch"
    "x86-tdx-define-tdx-supported-page-sizes-as-macros.patch"
    "x86-virt-tdx-make-intel-tdx-host-depend-on-x86-x2api.patch"
    "x86-cpu-detect-tdx-partial-write-machine-check-errat.patch"
    "x86-virt-tdx-handle-seamcall-no-entropy-error-in-com.patch"
    "x86-virt-tdx-add-seamcall-error-printing-for-module.patch"
    "x86-virt-tdx-add-skeleton-to-enable-tdx-on-demand.patch"
    "x86-virt-tdx-get-information-about-tdx-module-and-td.patch"
    "x86-virt-tdx-use-all-system-memory-when-initializing.patch"
    "x86-virt-tdx-add-placeholder-to-construct-tdmrs-to-c.patch"
    "x86-virt-tdx-fill-out-tdmrs-to-cover-all-tdx-memory.patch"
    "x86-virt-tdx-allocate-and-set-up-pamts-for-tdmrs.patch"
    "x86-virt-tdx-designate-reserved-areas-for-all-tdmrs.patch"
    "x86-virt-tdx-configure-tdx-module-with-the-tdmrs-and.patch"
    "x86-virt-tdx-configure-global-keyid-on-all-packages.patch"
    "x86-virt-tdx-initialize-all-tdmrs.patch"
    "x86-kexec-flush-cache-of-tdx-private-memory.patch"
    "x86-virt-tdx-keep-tdmrs-when-module-initialization-i.patch"
    "x86-virt-tdx-improve-readability-of-module-initializ.patch"
    "x86-kexec-reset-tdx-private-memory-on-platforms-with.patch"
    "x86-virt-tdx-handle-tdx-interaction-with-acpi-s3-and.patch"
    "x86-mce-improve-error-log-of-kernel-space-tdx-mc-due.patch"
    "documentation-x86-add-documentation-for-tdx-host-sup.patch"
    "kvm-tweak-kvm-hva-range-and-hva-handler-t-to-allow-r.patch"
    "kvm-use-gfn-instead-of-hva-for-mmu-notifier-retry.patch"
    "kvm-ppc-drop-dead-code-related-to-kvm-arch-want-mmu.patch"
    "kvm-ppc-return-1-unconditionally-for-kvm-cap-sync-mm.patch"
    "kvm-convert-kvm-arch-want-mmu-notifier-to-config-kvm.patch"
    "kvm-introduce-kvm-set-user-memory-region2.patch"
    "kvm-add-kvm-exit-memory-fault-exit-to-report-faults.patch"
    "kvm-add-a-dedicated-mmu-notifier-flag-for-reclaiming.patch"
    "kvm-drop-on-unlock-mmu-notifier-hook.patch"
    "kvm-set-the-stage-for-handling-only-shared-mappings.patch"
    "kvm-introduce-per-page-memory-attributes.patch"
    "mm-add-as-unmovable-to-mark-mapping-as-completely-un.patch"
    "security-export-security-inode-init-security-anon-fo.patch"
    "kvm-add-kvm-create-guest-memfd-ioctl-for-guest-speci.patch"
    "kvm-add-transparent-hugepage-support-for-dedicated-g.patch"
    "kvm-x86-reset-vcpu-run-exit-reason-early-in-kvm-run.patch"
    "kvm-x86-disallow-hugepages-when-memory-attributes-ar.patch"
    "kvm-x86-mmu-handle-page-fault-for-private-memory.patch"
    "kvm-drop-superfluous-kvm-vcpu-multiple-address-spa.patch"
    "kvm-allow-arch-code-to-track-number-of-memslot-addre.patch"
    "kvm-x86-add-support-for-protected-vms-that-can-utili.patch"
    "kvm-selftests-drop-unused-kvm-userspace-memory-regio.patch"
    "kvm-selftests-convert-lib-s-mem-regions-to-kvm-set-u.patch"
    "kvm-selftests-add-support-for-creating-private-memsl.patch"
    "kvm-selftests-add-helpers-to-convert-guest-memory-b.patch"
    "kvm-selftests-add-helpers-to-do-kvm-hc-map-gpa-range.patch"
    "kvm-selftests-introduce-vm-shape-to-allow-tests-to-s.patch"
    "kvm-selftests-add-guest-sync-1-6-macros-for-synchron.patch"
    "kvm-selftests-add-x86-only-selftest-for-private-memo.patch"
    "kvm-selftests-add-kvm-set-user-memory-region2-helper.patch"
    "kvm-selftests-expand-set-memory-region-test-to-valid.patch"
    "kvm-selftests-add-basic-selftest-for-guest-memfd.patch"
    "kvm-selftests-test-kvm-exit-behavior-for-private-mem.patch"
    "kvm-assert-that-mmu-invalidate-in-progress-never-goe.patch"
    "kvm-actually-truncate-the-inode-when-doing-punch-hol.patch"
    "kvm-warn-if-any-mmu-invalidation-sequence-doesn-t-ad.patch"
    "kvm-warn-if-there-are-danging-mmu-invalidations-at-v.patch"
    "kvm-fix-mmu-invalidation-bookkeeping-in-guest-memfd.patch"
    "kvm-disallow-hugepages-for-incompatible-gmem-binding.patch"
    "kvm-x86-mmu-track-private-impact-on-hugepage-mapping.patch"
    "kvm-x86-mmu-zap-shared-only-memslots-when-private-at.patch"
    "kvm-always-add-relevant-ranges-to-invalidation-set-w.patch"
    "kvm-x86-mmu-drop-repeated-add-of-to-be-invalidated-r.patch"
    "kvm-selftests-refactor-private-mem-conversions-to-pr.patch"
    "kvm-selftests-add-a-pure-punch-hole-on-guest-memfd-t.patch"
    "kvm-rename-guest-mem-c-to-guest-memfd-c.patch"
    "efi-unaccepted-make-sure-unaccepted-table-is-mapped.patch"
    "kvm-add-new-members-to-struct-kvm-gfn-range-to-opera.patch"
    "x86-mtrr-mask-out-keyid-bits-from-variable-mtrr-mask.patch"
    "kvm-x86-add-is-vm-type-supported-callback.patch"
    "kvm-x86-mmu-pass-around-full-64-bit-error-code-for-t.patch"
    "kvm-x86-use-pferr-guest-enc-mask-to-indicate-fault-i.patch"
    "kvm-vmx-move-out-vmx-x86-ops-to-main-c-to-wrap-vmx-a.patch"
    "kvm-x86-vmx-initialize-loaded-vmcss-on-cpu-in-vmx-ha.patch"
    "kvm-x86-vmx-refactor-kvm-vmx-module-init-exit-functi.patch"
    "kvm-vmx-reorder-vmx-initialization-with-kvm-vendor-i.patch"
    "kvm-tdx-initialize-the-tdx-module-when-loading-the-k.patch"
    "kvm-tdx-add-placeholders-for-tdx-vm-vcpu-structure.patch"
    "kvm-tdx-make-tdx-vm-type-supported.patch"
    "the-start-of-tdx-kvm-patch-series-tdx-architectural.patch"
    "kvm-tdx-define-tdx-architectural-definitions.patch"
    "kvm-tdx-add-tdx-architectural-error-codes.patch"
    "kvm-tdx-add-c-wrapper-functions-for-seamcalls-to-the.patch"
    "kvm-tdx-retry-seamcall-on-the-lack-of-entropy-error.patch"
    "kvm-tdx-add-helper-functions-to-print-tdx-seamcall-e.patch"
    "the-start-of-tdx-kvm-patch-series-td-vm-creation-des.patch"
    "x86-cpu-add-helper-functions-to-allocate-free-tdx-pr.patch"
    "x86-virt-tdx-add-a-helper-function-to-return-system.patch"
    "kvm-tdx-add-place-holder-for-tdx-vm-specific-mem-enc.patch"
    "kvm-tdx-x86-add-ioctl-to-get-tdx-systemwide-paramete.patch"
    "kvm-x86-tdx-make-kvm-cap-max-vcpus-backend-specific.patch"
    "kvm-tdx-create-destroy-vm-structure.patch"
    "kvm-tdx-initialize-vm-with-tdx-specific-parameters.patch"
    "kvm-tdx-make-pmu-intel-c-ignore-guest-td-case.patch"
    "kvm-tdx-refuse-to-unplug-the-last-cpu-on-the-package.patch"
    "the-start-of-tdx-kvm-patch-series-td-vcpu-creation-d.patch"
    "kvm-tdx-allocate-free-tdx-vcpu-structure.patch"
    "kvm-tdx-do-tdx-specific-vcpu-initialization.patch"
    "the-start-of-tdx-kvm-patch-series-kvm-mmu-gpa-shared.patch"
    "kvm-x86-mmu-introduce-config-for-private-kvm-mmu.patch"
    "kvm-x86-mmu-add-address-conversion-functions-for-tdx.patch"
    "the-start-of-tdx-kvm-patch-series-kvm-tdp-refactorin.patch"
    "kvm-allow-page-sized-mmu-caches-to-be-initialized-wi.patch"
    "kvm-x86-mmu-replace-hardcoded-value-0-for-the-initia.patch"
    "kvm-x86-mmu-allow-non-zero-value-for-non-present-spt.patch"
    "kvm-x86-mmu-add-suppress-ve-bit-to-shadow-mmio-mask.patch"
    "kvm-x86-mmu-track-shadow-mmio-value-on-a-per-vm-basi.patch"
    "kvm-x86-mmu-disallow-fast-page-fault-on-private-gpa.patch"
    "kvm-x86-mmu-allow-per-vm-override-of-the-tdp-max-pag.patch"
    "kvm-vmx-introduce-test-mode-related-to-ept-violation.patch"
    "the-start-of-tdx-kvm-patch-series-kvm-tdp-mmu-hooks.patch"
    "kvm-x86-mmu-assume-guest-mmios-are-shared.patch"
    "kvm-x86-tdp-mmu-init-role-member-of-struct-kvm-mmu-p.patch"
    "kvm-x86-mmu-add-a-new-is-private-member-for-union-kv.patch"
    "kvm-x86-mmu-add-a-private-pointer-to-struct-kvm-mmu.patch"
    "kvm-x86-tdp-mmu-don-t-zap-private-pages-for-unsuppor.patch"
    "kvm-x86-tdp-mmu-sprinkle-must-check.patch"
    "kvm-x86-tdp-mmu-support-tdx-private-mapping-for-tdp.patch"
    "the-start-of-tdx-kvm-patch-series-tdx-ept-violation.patch"
    "kvm-x86-mmu-tdx-do-not-enable-page-track-for-td-gues.patch"
    "kvm-vmx-split-out-guts-of-ept-violation-to-common-ex.patch"
    "kvm-vmx-move-setting-of-ept-mmu-masks-to-common-vt-x.patch"
    "kvm-tdx-add-accessors-vmx-vmcs-helpers.patch"
    "kvm-tdx-add-load-mmu-pgd-method-for-tdx.patch"
    "kvm-tdx-retry-seamcall-when-tdx-operand-busy-with-op.patch"
    "kvm-tdx-require-tdp-mmu-and-mmio-caching-for-tdx.patch"
    "kvm-tdx-tdp-mmu-tdx-support.patch"
    "kvm-tdx-mtrr-implement-get-mt-mask-for-tdx.patch"
    "the-start-of-tdx-kvm-patch-series-td-finalization.patch"
    "kvm-x86-mmu-introduce-kvm-mmu-map-tdp-page-for-use-b.patch"
    "kvm-tdx-create-initial-guest-memory.patch"
    "kvm-tdx-finalize-vm-initialization.patch"
    "the-start-of-tdx-kvm-patch-series-td-vcpu-enter-exit.patch"
    "kvm-tdx-implement-tdx-vcpu-enter-exit-path.patch"
    "kvm-tdx-vcpu-run-save-restore-host-state-host-kernel.patch"
    "kvm-tdx-restore-host-xsave-state-when-exit-from-the.patch"
    "kvm-x86-allow-to-update-cached-values-in-kvm-user-re.patch"
    "kvm-tdx-restore-user-ret-msrs.patch"
    "kvm-tdx-add-tsx-ctrl-msr-into-uret-msrs-list.patch"
    "the-start-of-tdx-kvm-patch-series-td-vcpu-exits-inte.patch"
    "kvm-tdx-complete-interrupts-after-tdexit.patch"
    "kvm-tdx-restore-debug-store-when-td-exit.patch"
    "kvm-tdx-handle-vcpu-migration-over-logical-processor.patch"
    "kvm-x86-add-a-switch-db-regs-flag-to-handle-tdx-s-au.patch"
    "kvm-tdx-add-support-for-find-pending-irq-in-a-protec.patch"
    "kvm-x86-assume-timer-irq-was-injected-if-apic-state.patch"
    "kvm-tdx-remove-use-of-struct-vcpu-vmx-from-posted-in.patch"
    "kvm-tdx-implement-interrupt-injection.patch"
    "kvm-tdx-implements-vcpu-request-immediate-exit.patch"
    "kvm-tdx-implement-methods-to-inject-nmi.patch"
    "kvm-vmx-modify-nmi-and-intr-handlers-to-take-intr-in.patch"
    "kvm-vmx-move-nmi-exception-handler-to-common-helper.patch"
    "kvm-x86-split-core-of-hypercall-emulation-to-helper.patch"
    "kvm-tdx-add-a-place-holder-to-handle-tdx-vm-exit.patch"
    "kvm-tdx-handle-vmentry-failure-for-intel-td-guest.patch"
    "kvm-tdx-handle-exit-reason-other-smi.patch"
    "kvm-tdx-handle-ept-violation-misconfig-exit.patch"
    "kvm-tdx-handle-exception-nmi-and-external-interrupt.patch"
    "kvm-tdx-handle-exit-reason-other-smi-with-msmi.patch"
    "kvm-tdx-add-a-place-holder-for-handler-of-tdx-hyperc.patch"
    "kvm-tdx-handle-kvm-hypercall-with-tdg-vp-vmcall.patch"
    "kvm-tdx-add-kvm-exit-for-tdx-tdg-vp-vmcall.patch"
    "kvm-tdx-handle-tdx-pv-cpuid-hypercall.patch"
    "kvm-tdx-handle-tdx-pv-hlt-hypercall.patch"
    "kvm-tdx-handle-tdx-pv-port-io-hypercall.patch"
    "kvm-tdx-handle-tdx-pv-mmio-hypercall.patch"
    "kvm-tdx-implement-callbacks-for-msr-operations-for-t.patch"
    "kvm-tdx-handle-tdx-pv-rdmsr-wrmsr-hypercall.patch"
    "kvm-tdx-handle-msr-mtrrcap-and-mtrrdeftype-access.patch"
    "kvm-tdx-handle-msr-ia32-feat-ctl-msr-and-ia32-mcg-ex.patch"
    "kvm-tdx-handle-tdg-vp-vmcall-gettdvmcallinfo-hyperca.patch"
    "kvm-tdx-silently-discard-smi-request.patch"
    "kvm-tdx-silently-ignore-init-sipi.patch"
    "kvm-tdx-add-methods-to-ignore-accesses-to-cpu-state.patch"
    "kvm-tdx-add-methods-to-ignore-guest-instruction-emul.patch"
    "kvm-tdx-add-a-method-to-ignore-dirty-logging.patch"
    "kvm-tdx-add-methods-to-ignore-vmx-preemption-timer.patch"
    "kvm-tdx-add-methods-to-ignore-accesses-to-tsc.patch"
    "kvm-tdx-ignore-setting-up-mce.patch"
    "kvm-tdx-add-a-method-to-ignore-for-tdx-to-ignore-hyp.patch"
    "kvm-tdx-add-methods-to-ignore-virtual-apic-related-o.patch"
    "kvm-tdx-inhibit-apicv-for-tdx-guest.patch"
    "documentation-virt-kvm-document-on-trust-domain-exte.patch"
    "kvm-x86-design-documentation-on-tdx-support-of-x86-k.patch"
    "kvm-tdx-add-hint-tdx-ioctl-to-release-secure-ept.patch"
    "rfc-kvm-x86-add-x86-callback-to-check-cpuid.patch"
    "rfc-kvm-x86-tdx-add-check-for-kvm-set-cpuid2.patch"
    "the-end-of-the-first-phase-of-tdx-kvm-patch-series.patch"
    "rfc-kvm-tdx-tdp-mmu-use-workqueue-to-zap-tdx-secure.patch"
    "bump-kvm-cap-to-avoid-merge-conflict.patch"
    "bump-kvm-exit-tdx-to-avoid-merge-conflict.patch"
    "bump-kvm-exit-memory-fault-to-avoid-merge-conflict.patch"
    "kvm-tdx-make-tdh-vp-enter-preserve-rbp.patch"
    "x86-virt-tdx-explicitly-save-restore-rbp-for-seamcal.patch"
    "kvm-tdx-allow-no-rbp-mod-unsupported-case.patch"
    "kvm-tdx-emulate-xen-mtrr-disablement.patch"
    "kvm-tdx-check-if-all-present-cpus-are-online.patch"
    "kvm-add-missing-trace-names-for-kvm-exit-reason.patch"
    "kvm-add-trace-names-for-kvm-exit-reason-memory-fault.patch"
    "kvm-selftests-test-kvm-hc-map-gpa-range.patch"))

(define intel-tdx-pach-directory
  (file-union
   "intel-tdx-patch-list"
   (let loop ((i 0)
              (l intel-tdx-patch-list)
              (acc '()))
     (if (nil? l)
         acc
         (let ((f (car l)))
           (loop (+ 1 i)
                 (cdr l)
                 (cons (list
                        (string-append (format #f "~3,,,'0@a" i) "-" f)
                        (local-file (search-patch f)))
                       acc)))))))

(define linux-git-url
  "https://git.kernel.org/pub/scm/linux/kernel/git/Torvalds/linux.git")

(define linux-6.6-rc2-source
  (let ((version "v6.6-r2")
        (commit "ce9ecca0238b140b88f43859b211c9fdfd8e5b70"))
    (origin
      (method git-fetch)
      (uri (git-reference
            (url linux-git-url)
            (commit commit)))
      (file-name (git-file-name "linux" version))
      (sha256
       (base32 "1hbva5vsfi48h82ll4kmhzm5hxp7340bj2smwgvjikam26icaj54")))))

(define computed-origin-method
  (@@ (guix packages) computed-origin-method))

(define linux-tdx-source
  (let* ((linux-upstream linux-6.6-rc2-source))
    (origin
      (method computed-origin-method)
      (sha256 #f)
      (uri
       (delay
         (with-imported-modules '((guix build utils))
           #~(begin
               (use-modules (guix build utils))
               (set-path-environment-variable
                "PATH" '("bin")
                (list #+python
                      #+(canonical-package bash)
                      #+(canonical-package coreutils)
                      #+(canonical-package findutils)
                      #+(canonical-package patch)
                      #+(canonical-package xz)
                      #+(canonical-package sed)
                      #+(canonical-package grep)
                      #+(canonical-package bzip2)
                      #+(canonical-package gzip)
                      #+(canonical-package tar)))
               (format #t "Copying upstream Linux tarball content...~%")
               (force-output)
               (copy-recursively #+linux-upstream
                                 #$output
                                 #:log (%make-void-port "w"))
               (with-directory-excursion #$output
                 (for-each
                  (λ (patch)
                    (format #f "Applying patch: ~a~%" (basename patch))
                    (force-output)
                    (invoke "patch" "-p1" "--force" "--input"
                            patch "--no-backup-if-mismatch"))
                  (find-files #$intel-tdx-pach-directory
                              #:stat stat))))))))))

(define (config->string options)
  (string-join (map (match-lambda
                      ((option . 'm)
                       (string-append option "=m"))
                      ((option . #t)
                       (string-append option "=y"))
                      ((option . #f)
                       (string-append option "=n"))
                      ((option . string)
                       (string-append option "=\"" string "\"")))
                    options)
               "\n"))

;;  A copy of `default-extra-linux-options' with some Intel's officially
;;  configuration conflict workarounds.  Default Guix kernel configuration
;;  options include Virtio drivers as modules whereas Intel suggests to
;;  include it statically.  All Virtio related configuration options has bee
;;  moved to `default-extra-linux-coco-options'.  Plan 9 Resource sharing
;;  config options are disabled, as they don't seem to be necessary in spite
;;  the comment that they are needed for "required for initrd".  Some of these
;;  options were selected to with assumption that targeting fully featured
;;  desktop installations.  Relevance and impact of some of the included
;;  modules and features should be further assessed.
(define %default-extra-linux-options
  '(;; Make the kernel config available at /proc/config.gz
    ("CONFIG_IKCONFIG" . #t)
    ("CONFIG_IKCONFIG_PROC" . #t)
    ;; Debugging options.
    ("CONFIG_DEBUG_INFO" . #t)          ;required by BTF
    ("CONFIG_DEBUG_INFO_BTF" . #t)
    ("CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT" . #t)
    ("CONFIG_DEBUG_INFO_REDUCED" . #f)  ;incompatible with BTF
    ;; Tracing and related options.
    ("CONFIG_BPF_JIT" . #t)
    ("CONFIG_BPF_JIT_ALWAYS_ON" . #t)
    ("CONFIG_BPF_SYSCALL" . #t)
    ("CONFIG_BPF_UNPRIV_DEFAULT_OFF" . #t)
    ("CONFIG_NET_CLS_BPF" . m)         ;classify packets based on BPF filters
    ("CONFIG_NET_ACT_BPF" . m)         ;to execute BPF code on packets
    ;; Compress kernel modules via Zstd.
    ("CONFIG_MODULE_COMPRESS_ZSTD" . #t)
    ;; Some very mild hardening.
    ("CONFIG_SECURITY_DMESG_RESTRICT" . #t)
    ;; All kernels should have NAMESPACES options enabled
    ("CONFIG_NAMESPACES" . #t)
    ("CONFIG_UTS_NS" . #t)
    ("CONFIG_IPC_NS" . #t)
    ("CONFIG_USER_NS" . #t)
    ("CONFIG_PID_NS" . #t)
    ("CONFIG_NET_NS" . #t)
    ;; Various options needed for elogind service:
    ;; https://issues.guix.gnu.org/43078
    ("CONFIG_CGROUP_FREEZER" . #t)
    ("CONFIG_BLK_CGROUP" . #t)
    ("CONFIG_CGROUP_WRITEBACK" . #t)
    ("CONFIG_CGROUP_SCHED" . #t)
    ("CONFIG_CGROUP_PIDS" . #t)
    ("CONFIG_CGROUP_FREEZER" . #t)
    ("CONFIG_CGROUP_DEVICE" . #t)
    ("CONFIG_CGROUP_CPUACCT" . #t)
    ("CONFIG_CGROUP_PERF" . #t)
    ("CONFIG_SOCK_CGROUP_DATA" . #t)
    ("CONFIG_BLK_CGROUP_IOCOST" . #t)
    ("CONFIG_CGROUP_NET_PRIO" . #t)
    ("CONFIG_CGROUP_NET_CLASSID" . #t)
    ("CONFIG_MEMCG" . #t)
    ("CONFIG_MEMCG_SWAP" . #t)
    ("CONFIG_MEMCG_KMEM" . #t)
    ("CONFIG_CPUSETS" . #t)
    ("CONFIG_PROC_PID_CPUSET" . #t)
    ;; Allow disk encryption by default
    ("CONFIG_DM_CRYPT" . m)
    ;; Support zram on all kernel configs
    ("CONFIG_ZSWAP" . #t)
    ("CONFIG_ZSMALLOC" . #t)
    ("CONFIG_ZRAM" . m)
    ;; Accessibility support.
    ("CONFIG_ACCESSIBILITY" . #t)
    ("CONFIG_A11Y_BRAILLE_CONSOLE" . #t)
    ("CONFIG_SPEAKUP" . m)
    ("CONFIG_SPEAKUP_SYNTH_SOFT" . m)))

;; NOTE: Maybe it makes seance to provide two different configurations for
;; host and guest.
(define %default-extra-linux-coco-options
  `(,@%default-extra-linux-options
    ;; ???
    ("CONFIG_DRM_CIRRUS_QEMU" . m)
    ("CONFIG_FB_CIRRUS" . m)
    ("CONFIG_SND_HDA_CODEC_CIRRUS" . m)
    ("CONFIG_OVERLAY_FS" . m)
    ;; Kernel-based Virtual Machine (KVM) support
    ("CONFIG_KVM" . #t)
    ;; Enable support for KVM software-protected VMs
    ("CONFIG_KVM_SW_PROTECTED_VM" . #t)
    ;; KVM for Intel (and compatible) processors support
    ("CONFIG_KVM_INTEL" . #t)
    ;; Software Guard eXtensions (SGX) Virtualization
    ("CONFIG_X86_SGX_KVM" . #t)
    ;; Support x2apic
    ("CONFIG_X86_X2APIC" . #t)
    ;; Intel TDX (Trust Domain Extensions) - Guest Support
    ("CONFIG_INTEL_TDX_GUEST" . #t)
    ;; Software Guard eXtensions (SGX)
    ("CONFIG_X86_SGX" . #t)
    ;; Intel Trust Domain Extensions (TDX) host support
    ("CONFIG_INTEL_TDX_HOST" . #t)
    ;; Disable KSM for page merging
    ("CONFIG_KSM" . #f)
    ;; Disable Extended Industry Standard Architecture bus
    ("CONFIG_HAVE_EISA" . #f)
    ;; Enable Virtio block device and network drivers
    ("CONFIG_VIRTIO" . #t)
    ("CONFIG_VIRTIO_BLK" . #t)
    ("CONFIG_VIRTIO_NET" . #t)
    ;; Config options that aren't suggested by Intel but potentially needed
    ;; for initrd (see `%default-extra-linux-coco-options' docstring).
    ("CONFIG_VIRTIO_PCI" . #t)
    ("CONFIG_VIRTIO_BALLOON" . #t)
    ("CONFIG_VIRTIO_MMIO" . #t)
    ("CONFIG_FUSE_FS" . m)
    ("CONFIG_CIFS" . m)
    ;; TDX Guest virtualization driver
    ("CONFIG_TDX_GUEST_DRIVER" . m)
    ;; Disable Microsoft Hyper-V guest support
    ("CONFIG_HYPERV" . #f)
    ;; Enable support for Interrupt Remapping
    ("CONFIG_IRQ_REMAP" . #t)))

(define* (make-linux-coco* version source supported-systems
                           #:key
                           (extra-version #f)
                           ;; A function that takes an arch and a variant.
                           ;; See kernel-config for an example.
                           (configuration-file #f)
                           (defconfig "defconfig")
                           (extra-options %default-extra-linux-coco-options))
  (package
    (name (let ((basename "linux-coco"))
            (if extra-version
                (string-append basename "-" extra-version)
                basename)))
    (version version)
    (source source)
    (supported-systems supported-systems)
    (build-system gnu-build-system)
    (arguments
     (list
      #:modules '((guix build gnu-build-system)
                  (guix build utils)
                  (srfi srfi-1)
                  (srfi srfi-26)
                  (ice-9 ftw)
                  (ice-9 match))
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-/bin/pwd
            (lambda _
              (substitute* (find-files
                            "." "^Makefile(\\.include)?$")
                (("/bin/pwd") "pwd"))))
          (add-before 'configure 'set-environment
            (lambda* (#:key target #:allow-other-keys)
              ;; Avoid introducing timestamps.
              (setenv "KCONFIG_NOTIMESTAMP" "1")
              (setenv "KBUILD_BUILD_TIMESTAMP" (getenv "SOURCE_DATE_EPOCH"))
              ;; Other variables useful for reproducibility.
              (setenv "KBUILD_BUILD_VERSION" "1")
              (setenv "KBUILD_BUILD_USER" "guix")
              (setenv "KBUILD_BUILD_HOST" "guix")
              ;; Set ARCH and CROSS_COMPILE.
              (let ((arch #$(platform-linux-architecture
                             (lookup-platform-by-target-or-system
                              (or (%current-target-system)
                                  (%current-system))))))
                (setenv "ARCH" arch)
                (format #t "`ARCH' set to `~a'~%" (getenv "ARCH"))
                (when target
                  (setenv "CROSS_COMPILE" (string-append target "-"))
                  (format #t "`CROSS_COMPILE' set to `~a'~%"
                          (getenv "CROSS_COMPILE"))))

              ;; Allow EXTRAVERSION to be set via the environment.
              (substitute* "Makefile"
                (("^ *EXTRAVERSION[[:blank:]]*=")
                 "EXTRAVERSION ?="))
              (setenv "EXTRAVERSION"
                      #$(and extra-version
                             (string-append "-" extra-version)))
              ;; Use the maximum compression available for Zstd-compressed
              ;; modules.
              (setenv "ZSTD_CLEVEL" "19")))
          (replace 'configure
            (lambda _
              (let ((config
                     #$(match (let ((arch (platform-linux-architecture
                                           (lookup-platform-by-target-or-system
                                            (or (%current-target-system)
                                                (%current-system))))))
                                (and configuration-file arch
                                     (configuration-file
                                      arch
                                      #:variant (version-major+minor version))))
                         (#f            ;no config for this platform
                          #f)
                         ((? file-like? config)
                          config))))
                ;; Use a custom kernel configuration file or a default
                ;; configuration file.
                (if config
                    (begin
                      (copy-file config ".config")
                      (chmod ".config" #o666))
                    (invoke "make" #$defconfig))
                ;; Appending works even when the option wasn't in the file.
                ;; The last one prevails if duplicated.
                (let ((port (open-file ".config" "a"))
                      (extra-configuration #$(config->string extra-options)))
                  (display extra-configuration port)
                  (close-port port))
                (invoke "make" "oldconfig"))))
          (replace 'install
            (lambda* (#:key make-flags parallel-build? #:allow-other-keys)
              (let ((moddir (string-append #$output "/lib/modules"))
                    (dtbdir (string-append #$output "/lib/dtbs"))
                    (make-flags
                     (append make-flags
                             (list "-j"
                                   (if parallel-build?
                                       (number->string (parallel-job-count))
                                       "1")))))
                ;; Install kernel image, kernel configuration and link map.
                (for-each (lambda (file) (install-file file #$output))
                          (find-files "." "^(\\.config|bzImage|zImage|Image\
|vmlinuz|System\\.map|Module\\.symvers)$"))
                ;; Install device tree files
                (unless (null? (find-files "." "\\.dtb$"))
                  (mkdir-p dtbdir)
                  (apply invoke "make"
                         (string-append "INSTALL_DTBS_PATH=" dtbdir)
                         "dtbs_install" make-flags))
                ;; Install kernel modules
                (mkdir-p moddir)
                (apply invoke "make"
                       ;; Disable depmod because the Guix system's module
                       ;; directory is an union of potentially multiple
                       ;; packages.  It is not possible to use depmod to
                       ;; usefully calculate a dependency graph while building
                       ;; only one of them.
                       "DEPMOD=true"
                       (string-append "MODULE_DIR=" moddir)
                       (string-append "INSTALL_PATH=" #$output)
                       (string-append "INSTALL_MOD_PATH=" #$output)
                       "INSTALL_MOD_STRIP=1"
                       "modules_install" make-flags)
                (let* ((versions (filter (lambda (name)
                                           (not (string-prefix? "." name)))
                                         (scandir moddir)))
                       (version (match versions
                                  ((x) x))))
                  ;; There are symlinks to the build and source directory.
                  ;; Both will point to target /tmp/guix-build* and thus not
                  ;; be useful in a profile.  Delete the symlinks.
                  (false-if-file-not-found
                   (delete-file
                    (string-append moddir "/" version "/build")))
                  (false-if-file-not-found
                   (delete-file
                    (string-append moddir "/" version "/source"))))))))))
    (native-inputs
     (list perl
           bc
           openssl
           elfutils                  ;needed to enable CONFIG_STACK_VALIDATION
           flex
           bison
           util-linux          ;needed for hexdump
           ;; These are needed to compile the GCC plugins.
           gmp
           mpfr
           mpc
           ;; These are needed when building with the CONFIG_DEBUG_INFO_BTF
           ;; support.
           dwarves                      ;for pahole
           python-wrapper
           zlib
           ;; For Zstd compression of kernel modules.
           zstd))
    (home-page "")
    (synopsis "")
    (description "")
    (license license:gpl2)
    (properties (@@ (gnu packages linux)
                    %linux-libre-timeout-properties))))

(define-public linux-coco
  (make-linux-coco* "6.6-rc2" linux-tdx-source '("x86_64-linux")))
