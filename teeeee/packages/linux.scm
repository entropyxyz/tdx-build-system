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

(define tdx-base-v6.6rc2-2023.12.05-patches
  '("x86-tdx-Zero-out-the-missing-RSI-in-TDX_HYPERCALL-ma.patch"
    "x86-tdx-Skip-saving-output-regs-when-SEAMCALL-fails-.patch"
    "x86-tdx-Make-macros-of-TDCALLs-consistent-with-the-s.patch"
    "x86-tdx-Rename-__tdx_module_call-to-__tdcall.patch"
    "x86-tdx-Pass-TDCALL-SEAMCALL-input-output-registers-.patch"
    "x86-tdx-Extend-TDX_MODULE_CALL-to-support-more-TDCAL.patch"
    "x86-tdx-Make-TDX_HYPERCALL-asm-similar-to-TDX_MODULE.patch"
    "x86-tdx-Reimplement-__tdx_hypercall-using-TDX_MODULE.patch"
    "x86-tdx-Remove-struct-tdx_hypercall_args.patch"
    "x86-virt-tdx-Wire-up-basic-SEAMCALL-functions.patch"
    "x86-virt-tdx-Make-TDX_MODULE_CALL-handle-SEAMCALL-UD.patch"
    "x86-virt-tdx-Adjust-struct-tdx_module_args-to-use-x8.patch"
    "x86-virt-tdx-Detect-TDX-during-kernel-boot.patch"
    "x86-tdx-Define-TDX-supported-page-sizes-as-macros.patch"
    "x86-virt-tdx-Make-INTEL_TDX_HOST-depend-on-X86_X2API.patch"
    "x86-cpu-Detect-TDX-partial-write-machine-check-errat.patch"
    "x86-virt-tdx-Handle-SEAMCALL-no-entropy-error-in-com.patch"
    "x86-virt-tdx-Add-SEAMCALL-error-printing-for-module-.patch"
    "x86-virt-tdx-Add-skeleton-to-enable-TDX-on-demand.patch"
    "x86-virt-tdx-Get-information-about-TDX-module-and-TD.patch"
    "x86-virt-tdx-Use-all-system-memory-when-initializing.patch"
    "x86-virt-tdx-Add-placeholder-to-construct-TDMRs-to-c.patch"
    "x86-virt-tdx-Fill-out-TDMRs-to-cover-all-TDX-memory-.patch"
    "x86-virt-tdx-Allocate-and-set-up-PAMTs-for-TDMRs.patch"
    "x86-virt-tdx-Designate-reserved-areas-for-all-TDMRs.patch"
    "x86-virt-tdx-Configure-TDX-module-with-the-TDMRs-and.patch"
    "x86-virt-tdx-Configure-global-KeyID-on-all-packages.patch"
    "x86-virt-tdx-Initialize-all-TDMRs.patch"
    "x86-kexec-Flush-cache-of-TDX-private-memory.patch"
    "x86-virt-tdx-Keep-TDMRs-when-module-initialization-i.patch"
    "x86-virt-tdx-Improve-readability-of-module-initializ.patch"
    "x86-kexec-Reset-TDX-private-memory-on-platforms-with.patch"
    "x86-virt-tdx-Handle-TDX-interaction-with-ACPI-S3-and.patch"
    "x86-mce-Improve-error-log-of-kernel-space-TDX-MC-due.patch"
    "Documentation-x86-Add-documentation-for-TDX-host-sup.patch"
    "KVM-Tweak-kvm_hva_range-and-hva_handler_t-to-allow-r.patch"
    "KVM-Use-gfn-instead-of-hva-for-mmu_notifier_retry.patch"
    "KVM-PPC-Drop-dead-code-related-to-KVM_ARCH_WANT_MMU_.patch"
    "KVM-PPC-Return-1-unconditionally-for-KVM_CAP_SYNC_MM.patch"
    "KVM-Convert-KVM_ARCH_WANT_MMU_NOTIFIER-to-CONFIG_KVM.patch"
    "KVM-Introduce-KVM_SET_USER_MEMORY_REGION2.patch"
    "KVM-Add-KVM_EXIT_MEMORY_FAULT-exit-to-report-faults-.patch"
    "KVM-Add-a-dedicated-mmu_notifier-flag-for-reclaiming.patch"
    "KVM-Drop-.on_unlock-mmu_notifier-hook.patch"
    "KVM-Set-the-stage-for-handling-only-shared-mappings-.patch"
    "KVM-Introduce-per-page-memory-attributes.patch"
    "mm-Add-AS_UNMOVABLE-to-mark-mapping-as-completely-un.patch"
    "security-Export-security_inode_init_security_anon-fo.patch"
    "KVM-Add-KVM_CREATE_GUEST_MEMFD-ioctl-for-guest-speci.patch"
    "KVM-Add-transparent-hugepage-support-for-dedicated-g.patch"
    "KVM-x86-Reset-vcpu-run-exit_reason-early-in-KVM_RUN.patch"
    "KVM-x86-Disallow-hugepages-when-memory-attributes-ar.patch"
    "KVM-x86-mmu-Handle-page-fault-for-private-memory.patch"
    "KVM-Drop-superfluous-__KVM_VCPU_MULTIPLE_ADDRESS_SPA.patch"
    "KVM-Allow-arch-code-to-track-number-of-memslot-addre.patch"
    "KVM-x86-Add-support-for-protected-VMs-that-can-utili.patch"
    "KVM-selftests-Drop-unused-kvm_userspace_memory_regio.patch"
    "KVM-selftests-Convert-lib-s-mem-regions-to-KVM_SET_U.patch"
    "KVM-selftests-Add-support-for-creating-private-memsl.patch"
    "KVM-selftests-Add-helpers-to-convert-guest-memory-b-.patch"
    "KVM-selftests-Add-helpers-to-do-KVM_HC_MAP_GPA_RANGE.patch"
    "KVM-selftests-Introduce-VM-shape-to-allow-tests-to-s.patch"
    "KVM-selftests-Add-GUEST_SYNC-1-6-macros-for-synchron.patch"
    "KVM-selftests-Add-x86-only-selftest-for-private-memo.patch"
    "KVM-selftests-Add-KVM_SET_USER_MEMORY_REGION2-helper.patch"
    "KVM-selftests-Expand-set_memory_region_test-to-valid.patch"
    "KVM-selftests-Add-basic-selftest-for-guest_memfd.patch"
    "KVM-selftests-Test-KVM-exit-behavior-for-private-mem.patch"
    "KVM-Assert-that-mmu_invalidate_in_progress-never-goe.patch"
    "KVM-Actually-truncate-the-inode-when-doing-PUNCH_HOL.patch"
    "KVM-WARN-if-any-MMU-invalidation-sequence-doesn-t-ad.patch"
    "KVM-WARN-if-there-are-danging-MMU-invalidations-at-V.patch"
    "KVM-Fix-MMU-invalidation-bookkeeping-in-guest_memfd.patch"
    "KVM-Disallow-hugepages-for-incompatible-gmem-binding.patch"
    "KVM-x86-mmu-Track-PRIVATE-impact-on-hugepage-mapping.patch"
    "KVM-x86-mmu-Zap-shared-only-memslots-when-private-at.patch"
    "KVM-Always-add-relevant-ranges-to-invalidation-set-w.patch"
    "KVM-x86-mmu-Drop-repeated-add-of-to-be-invalidated-r.patch"
    "KVM-selftests-Refactor-private-mem-conversions-to-pr.patch"
    "KVM-selftests-Add-a-pure-PUNCH_HOLE-on-guest_memfd-t.patch"
    "KVM-Rename-guest_mem.c-to-guest_memfd.c.patch"
    "efi-unaccepted-Make-sure-unaccepted-table-is-mapped.patch"
    "KVM-Add-new-members-to-struct-kvm_gfn_range-to-opera.patch"
    "x86-mtrr-Mask-out-keyid-bits-from-variable-mtrr-mask.patch"
    "KVM-x86-Add-is_vm_type_supported-callback.patch"
    "KVM-x86-mmu-Pass-around-full-64-bit-error-code-for-t.patch"
    "KVM-x86-Use-PFERR_GUEST_ENC_MASK-to-indicate-fault-i.patch"
    "KVM-VMX-Move-out-vmx_x86_ops-to-main.c-to-wrap-VMX-a.patch"
    "KVM-x86-vmx-initialize-loaded_vmcss_on_cpu-in-vmx_ha.patch"
    "KVM-x86-vmx-Refactor-KVM-VMX-module-init-exit-functi.patch"
    "KVM-VMX-Reorder-vmx-initialization-with-kvm-vendor-i.patch"
    "KVM-TDX-Initialize-the-TDX-module-when-loading-the-K.patch"
    "KVM-TDX-Add-placeholders-for-TDX-VM-vcpu-structure.patch"
    "KVM-TDX-Make-TDX-VM-type-supported.patch"
    "The-start-of-TDX-KVM-patch-series-TDX-architectural-.patch"
    "KVM-TDX-Define-TDX-architectural-definitions.patch"
    "KVM-TDX-Add-TDX-architectural-error-codes.patch"
    "KVM-TDX-Add-C-wrapper-functions-for-SEAMCALLs-to-the.patch"
    "KVM-TDX-Retry-SEAMCALL-on-the-lack-of-entropy-error.patch"
    "KVM-TDX-Add-helper-functions-to-print-TDX-SEAMCALL-e.patch"
    "The-start-of-TDX-KVM-patch-series-TD-VM-creation-des.patch"
    "x86-cpu-Add-helper-functions-to-allocate-free-TDX-pr.patch"
    "x86-virt-tdx-Add-a-helper-function-to-return-system-.patch"
    "KVM-TDX-Add-place-holder-for-TDX-VM-specific-mem_enc.patch"
    "KVM-TDX-x86-Add-ioctl-to-get-TDX-systemwide-paramete.patch"
    "KVM-x86-tdx-Make-KVM_CAP_MAX_VCPUS-backend-specific.patch"
    "KVM-TDX-create-destroy-VM-structure.patch"
    "KVM-TDX-initialize-VM-with-TDX-specific-parameters.patch"
    "KVM-TDX-Make-pmu_intel.c-ignore-guest-TD-case.patch"
    "KVM-TDX-Refuse-to-unplug-the-last-cpu-on-the-package.patch"
    "The-start-of-TDX-KVM-patch-series-TD-vcpu-creation-d.patch"
    "KVM-TDX-allocate-free-TDX-vcpu-structure.patch"
    "KVM-TDX-Do-TDX-specific-vcpu-initialization.patch"
    "The-start-of-TDX-KVM-patch-series-KVM-MMU-GPA-shared.patch"
    "KVM-x86-mmu-introduce-config-for-PRIVATE-KVM-MMU.patch"
    "KVM-x86-mmu-Add-address-conversion-functions-for-TDX.patch"
    "The-start-of-TDX-KVM-patch-series-KVM-TDP-MMU-hooks.patch"
    "KVM-Allow-page-sized-MMU-caches-to-be-initialized-wi.patch"
    "KVM-x86-mmu-Replace-hardcoded-value-0-for-the-initia.patch"
    "KVM-x86-mmu-Allow-non-zero-value-for-non-present-SPT.patch"
    "KVM-x86-mmu-Add-Suppress-VE-bit-to-shadow_mmio_mask-.patch"
    "KVM-x86-mmu-Track-shadow-MMIO-value-on-a-per-VM-basi.patch"
    "KVM-x86-mmu-Disallow-fast-page-fault-on-private-GPA.patch"
    "KVM-x86-mmu-Allow-per-VM-override-of-the-TDP-max-pag.patch"
    "KVM-VMX-Introduce-test-mode-related-to-EPT-violation.patch"
    "The-start-of-TDX-KVM-patch-series-KVM-TDP-refactorin.patch"
    "KVM-x86-mmu-Assume-guest-MMIOs-are-shared.patch"
    "KVM-x86-tdp_mmu-Init-role-member-of-struct-kvm_mmu_p.patch"
    "KVM-x86-mmu-Add-a-new-is_private-member-for-union-kv.patch"
    "KVM-x86-mmu-Add-a-private-pointer-to-struct-kvm_mmu_.patch"
    "KVM-x86-tdp_mmu-Don-t-zap-private-pages-for-unsuppor.patch"
    "KVM-x86-tdp_mmu-Sprinkle-__must_check.patch"
    "KVM-x86-tdp_mmu-Support-TDX-private-mapping-for-TDP-.patch"
    "The-start-of-TDX-KVM-patch-series-TD-finalization.patch"
    "KVM-x86-mmu-TDX-Do-not-enable-page-track-for-TD-gues.patch"
    "KVM-VMX-Split-out-guts-of-EPT-violation-to-common-ex.patch"
    "KVM-VMX-Move-setting-of-EPT-MMU-masks-to-common-VT-x.patch"
    "KVM-TDX-Add-accessors-VMX-VMCS-helpers.patch"
    "KVM-TDX-Add-load_mmu_pgd-method-for-TDX.patch"
    "KVM-TDX-Retry-seamcall-when-TDX_OPERAND_BUSY-with-op.patch"
    "KVM-TDX-Require-TDP-MMU-and-mmio-caching-for-TDX.patch"
    "KVM-TDX-TDP-MMU-TDX-support.patch"
    "KVM-TDX-MTRR-implement-get_mt_mask-for-TDX.patch"
    "The-start-of-TDX-KVM-patch-series-TDX-EPT-violation.patch"
    "KVM-x86-mmu-Introduce-kvm_mmu_map_tdp_page-for-use-b.patch"
    "KVM-TDX-Create-initial-guest-memory.patch"
    "KVM-TDX-Finalize-VM-initialization.patch"
    "The-start-of-TDX-KVM-patch-series-TD-vcpu-enter-exit.patch"
    "KVM-TDX-Implement-TDX-vcpu-enter-exit-path.patch"
    "KVM-TDX-vcpu_run-save-restore-host-state-host-kernel.patch"
    "KVM-TDX-restore-host-xsave-state-when-exit-from-the-.patch"
    "KVM-x86-Allow-to-update-cached-values-in-kvm_user_re.patch"
    "KVM-TDX-restore-user-ret-MSRs.patch"
    "KVM-TDX-Add-TSX_CTRL-msr-into-uret_msrs-list.patch"
    "The-start-of-TDX-KVM-patch-series-TD-vcpu-exits-inte.patch"
    "KVM-TDX-complete-interrupts-after-tdexit.patch"
    "KVM-TDX-restore-debug-store-when-TD-exit.patch"
    "KVM-TDX-handle-vcpu-migration-over-logical-processor.patch"
    "KVM-x86-Add-a-switch_db_regs-flag-to-handle-TDX-s-au.patch"
    "KVM-TDX-Add-support-for-find-pending-IRQ-in-a-protec.patch"
    "KVM-x86-Assume-timer-IRQ-was-injected-if-APIC-state-.patch"
    "KVM-TDX-remove-use-of-struct-vcpu_vmx-from-posted_in.patch"
    "KVM-TDX-Implement-interrupt-injection.patch"
    "KVM-TDX-Implements-vcpu-request_immediate_exit.patch"
    "KVM-TDX-Implement-methods-to-inject-NMI.patch"
    "KVM-VMX-Modify-NMI-and-INTR-handlers-to-take-intr_in.patch"
    "KVM-VMX-Move-NMI-exception-handler-to-common-helper.patch"
    "KVM-x86-Split-core-of-hypercall-emulation-to-helper-.patch"
    "KVM-TDX-Add-a-place-holder-to-handle-TDX-VM-exit.patch"
    "KVM-TDX-Handle-vmentry-failure-for-INTEL-TD-guest.patch"
    "KVM-TDX-handle-EXIT_REASON_OTHER_SMI.patch"
    "KVM-TDX-handle-ept-violation-misconfig-exit.patch"
    "KVM-TDX-handle-EXCEPTION_NMI-and-EXTERNAL_INTERRUPT.patch"
    "KVM-TDX-Handle-EXIT_REASON_OTHER_SMI-with-MSMI.patch"
    "KVM-TDX-Add-a-place-holder-for-handler-of-TDX-hyperc.patch"
    "KVM-TDX-handle-KVM-hypercall-with-TDG.VP.VMCALL.patch"
    "KVM-TDX-Add-KVM-Exit-for-TDX-TDG.VP.VMCALL.patch"
    "KVM-TDX-Handle-TDX-PV-port-io-hypercall.patch"
    "KVM-TDX-Handle-TDX-PV-CPUID-hypercall.patch"
    "KVM-TDX-Handle-TDX-PV-HLT-hypercall.patch"
    "KVM-TDX-Handle-TDX-PV-rdmsr-wrmsr-hypercall.patch"
    "KVM-TDX-Implement-callbacks-for-MSR-operations-for-T.patch"
    "KVM-TDX-Handle-TDX-PV-MMIO-hypercall.patch"
    "KVM-TDX-Handle-MSR-MTRRCap-and-MTRRDefType-access.patch"
    "KVM-TDX-Handle-MSR-IA32_FEAT_CTL-MSR-and-IA32_MCG_EX.patch"
    "KVM-TDX-Handle-TDG.VP.VMCALL-GetTdVmCallInfo-hyperca.patch"
    "KVM-TDX-Silently-discard-SMI-request.patch"
    "KVM-TDX-Silently-ignore-INIT-SIPI.patch"
    "KVM-TDX-Add-methods-to-ignore-accesses-to-CPU-state.patch"
    "KVM-TDX-Add-methods-to-ignore-guest-instruction-emul.patch"
    "KVM-TDX-Add-a-method-to-ignore-dirty-logging.patch"
    "KVM-TDX-Add-methods-to-ignore-VMX-preemption-timer.patch"
    "KVM-TDX-Add-methods-to-ignore-accesses-to-TSC.patch"
    "KVM-TDX-Ignore-setting-up-mce.patch"
    "KVM-TDX-Add-a-method-to-ignore-for-TDX-to-ignore-hyp.patch"
    "KVM-TDX-Add-methods-to-ignore-virtual-apic-related-o.patch"
    "KVM-TDX-Inhibit-APICv-for-TDX-guest.patch"
    "Documentation-virt-kvm-Document-on-Trust-Domain-Exte.patch"
    "KVM-x86-design-documentation-on-TDX-support-of-x86-K.patch"
    "KVM-TDX-Add-hint-TDX-ioctl-to-release-Secure-EPT.patch"
    "RFC-KVM-x86-Add-x86-callback-to-check-cpuid.patch"
    "RFC-KVM-x86-TDX-Add-check-for-KVM_SET_CPUID2.patch"
    "the-end-of-the-first-phase-of-TDX-KVM-patch-series.patch"
    "RFC-KVM-TDX-tdp_mmu-Use-workqueue-to-zap-TDX-Secure-.patch"
    "Bump-KVM_EXIT_TDX-to-avoid-merge-conflict.patch"
    "Bump-KVM_CAP-to-avoid-merge-conflict.patch"
    "Bump-KVM_EXIT_MEMORY_FAULT-to-avoid-merge-conflict.patch"
    "KVM-TDX-Make-TDH.VP.ENTER-preserve-RBP.patch"
    "x86-virt-tdx-Explicitly-save-restore-RBP-for-seamcal.patch"
    "KVM-TDX-Allow-NO_RBP_MOD-unsupported-case.patch"
    "KVM-TDX-Emulate-Xen-MTRR-disablement.patch"
    "KVM-TDX-Check-if-all-present-CPUs-are-online.patch"
    "KVM-Add-missing-trace-names-for-KVM-exit-reason.patch"
    "KVM-Add-trace-names-for-kvm-exit-reason-MEMORY_FAULT.patch"
    "KVM-selftests-Test-KVM_HC_MAP_GPA_RANGE.patch"))

(define tdx-base-v6.14rc3-2025-02-21-patches
  '("KVM-x86-Have-____kvm_emulate_hypercall-read-the-GPRs.patch"
    "KVM-x86-Move-pv_unhaulted-check-out-of-kvm_vcpu_has_.patch"
    "KVM-TDX-Add-a-place-holder-to-handle-TDX-VM-exit.patch"
    "KVM-TDX-Add-a-place-holder-for-handler-of-TDX-hyperc.patch"
    "KVM-TDX-Handle-KVM-hypercall-with-TDG.VP.VMCALL.patch"
    "KVM-TDX-Handle-TDG.VP.VMCALL-MapGPA.patch"
    "KVM-TDX-Handle-TDG.VP.VMCALL-ReportFatalError.patch"
    "KVM-TDX-Handle-TDX-PV-port-I-O-hypercall.patch"
    "KVM-TDX-Handle-TDX-PV-MMIO-hypercall.patch"
    "KVM-TDX-Add-support-for-find-pending-IRQ-in-a-protec.patch"
    "KVM-TDX-Disable-PI-wakeup-for-IPIv.patch"
    "KVM-VMX-Move-posted-interrupt-delivery-code-to-commo.patch"
    "KVM-TDX-Implement-non-NMI-interrupt-injection.patch"
    "KVM-x86-Assume-timer-IRQ-was-injected-if-APIC-state-.patch"
    "KVM-TDX-Wait-lapic-expire-when-timer-IRQ-was-injecte.patch"
    "KVM-TDX-Implement-methods-to-inject-NMI.patch"
    "KVM-TDX-Handle-SMI-request-as-CONFIG_KVM_SMM.patch"
    "KVM-TDX-Always-block-INIT-SIPI.patch"
    "KVM-TDX-Enforce-KVM_IRQCHIP_SPLIT-for-TDX-guests.patch"
    "KVM-TDX-Force-APICv-active-for-TDX-guest.patch"
    "KVM-TDX-Add-methods-to-ignore-virtual-apic-related-o.patch"
    "KVM-VMX-Move-emulation_required-to-struct-vcpu_vt.patch"
    "KVM-VMX-Add-a-helper-for-NMI-handling.patch"
    "KVM-TDX-Handle-EXCEPTION_NMI-and-EXTERNAL_INTERRUPT.patch"
    "KVM-TDX-Handle-EXIT_REASON_OTHER_SMI.patch"
    "KVM-TDX-Handle-EPT-violation-misconfig-exit.patch"
    "KVM-TDX-Detect-unexpected-SEPT-violations-due-to-pen.patch"
    "KVM-TDX-Retry-locally-in-TDX-EPT-violation-handler-o.patch"
    "KVM-TDX-Kick-off-vCPUs-when-SEAMCALL-is-busy-during-.patch"
    "KVM-TDX-Handle-TDX-PV-CPUID-hypercall.patch"
    "KVM-TDX-Handle-TDX-PV-HLT-hypercall.patch"
    "KVM-x86-Move-KVM_MAX_MCE_BANKS-to-header-file.patch"
    "KVM-TDX-Implement-callbacks-for-MSR-operations.patch"
    "KVM-TDX-Handle-TDX-PV-rdmsr-wrmsr-hypercall.patch"
    "KVM-TDX-Enable-guest-access-to-LMCE-related-MSRs.patch"
    "KVM-TDX-Handle-TDG.VP.VMCALL-GetTdVmCallInfo-hyperca.patch"
    "KVM-TDX-Add-methods-to-ignore-accesses-to-CPU-state.patch"
    "KVM-TDX-Add-method-to-ignore-guest-instruction-emula.patch"
    "KVM-TDX-Add-methods-to-ignore-VMX-preemption-timer.patch"
    "KVM-TDX-Add-methods-to-ignore-accesses-to-TSC.patch"
    "KVM-TDX-Ignore-setting-up-mce.patch"
    "KVM-TDX-Add-a-method-to-ignore-hypercall-patching.patch"
    "KVM-TDX-Make-TDX-VM-type-supported.patch"
    "KVM-TDX-Enable-guest-access-to-MTRR-MSRs.patch"
    "Documentation-virt-kvm-Document-on-Trust-Domain-Exte.patch"
    "KVM-x86-mmu-Bail-out-kvm_tdp_map_page-when-VM-dead.patch"
    "Consider-squashing-to-KVM-VMX-Refactor-VMX-module-in.patch"
    "KVM-selftests-Add-printf-attribute-to-_no_printf.patch"
    "KVM-selftests-Add-function-to-allow-one-to-one-GVA-t.patch"
    "KVM-selftests-Expose-function-that-sets-up-sregs-bas.patch"
    "KVM-selftests-Store-initial-stack-address-in-struct-.patch"
    "KVM-selftests-Refactor-steps-in-vCPU-descriptor-tabl.patch"
    "KVM-selftests-Update-kvm_init_vm_address_properties-.patch"
    "KVM-selftests-Add-helper-functions-to-create-TDX-VMs.patch"
    "KVM-selftests-TDX-Use-KVM_TDX_CAPABILITIES-to-valida.patch"
    "KVM-selftests-TDX-Update-load_td_memory_region-for-V.patch"
    "KVM-selftests-TDX-Add-TDX-lifecycle-test.patch"
    "KVM-selftests-TDX-Add-report_fatal_error-test.patch"
    "KVM-selftests-TDX-Adding-test-case-for-TDX-port-IO.patch"
    "KVM-selftests-TDX-Add-basic-TDX-CPUID-test.patch"
    "KVM-selftests-TDX-Add-basic-get_td_vmcall_info-test.patch"
    "KVM-selftests-TDX-Add-TDX-IO-writes-test.patch"
    "KVM-selftests-TDX-Add-TDX-IO-reads-test.patch"
    "KVM-selftests-TDX-Add-TDX-MSR-read-write-tests.patch"
    "KVM-selftests-TDX-Add-TDX-HLT-exit-test.patch"
    "KVM-selftests-TDX-Add-TDX-MMIO-reads-test.patch"
    "KVM-selftests-TDX-Add-TDX-MMIO-writes-test.patch"
    "KVM-selftests-TDX-Add-TDX-CPUID-TDVMCALL-test.patch"
    "KVM-selftests-TDX-Verify-the-behavior-when-host-cons.patch"
    "KVM-selftests-TDX-Add-TDG.VP.INFO-test.patch"
    "KVM-selftests-Add-functions-to-allow-mapping-as-shar.patch"
    "KVM-selftests-TDX-Add-shared-memory-test.patch"
    "KVM-selftests-Expose-____vm_vaddr_alloc.patch"
    "KVM-selftests-TDX-Add-support-for-TDG.MEM.PAGE.ACCEP.patch"
    "KVM-selftests-TDX-Add-support-for-TDG.VP.VEINFO.GET.patch"
    "KVM-selftests-Propagate-KVM_EXIT_MEMORY_FAULT-to-use.patch"
    "KVM-selftests-TDX-Add-TDX-UPM-selftest.patch"
    "KVM-selftests-TDX-Add-TDX-UPM-selftests-for-implicit.patch"
    "KVM-selftests-TDX-Test-LOG_DIRTY_PAGES-flag-to-a-non.patch"))

(define (patch-subtree->patch-series subtree)
  (match subtree
    ("tdx-base-v6.14rc3-2025-02-21"
     tdx-base-v6.14rc3-2025-02-21-patches)
    ("tdx-base-v6.6rc2-2023.12.05"
     tdx-base-v6.6rc2-2023.12.05-patches)))

(define (intel-tdx-pach-directory base)
  (file-union
   "intel-tdx-patch-list"
   (let loop ((i 0)
              (l (patch-subtree->patch-series base))
              (acc '()))
     (if (nil? l)
         acc
         (let ((f (car l)))
           (loop (+ 1 i)
                 (cdr l)
                 (cons (list
                        (string-append (format #f "~3,,,'0@a" i) "-" f)
                        (local-file (search-patch-subtree base f)))
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
                  (find-files #$(intel-tdx-pach-directory
                                 "tdx-base-v6.6rc2-2023.12.05")
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
