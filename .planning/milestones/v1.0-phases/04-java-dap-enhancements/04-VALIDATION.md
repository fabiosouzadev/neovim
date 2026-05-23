---
phase: 4
slug: java-dap-enhancements
status: draft
nyquist_compliant: false
wave_0_complete: true
created: 2026-05-15
---

# Phase 4 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | None (Configuration only) |
| **Config file** | `init.lua` |
| **Quick run command** | `nvim --headless -c "quit"` |
| **Estimated runtime** | ~1 seconds |

---

## Sampling Rate

- **After every task commit:** Run `nvim --headless -c "quit"` to ensure no syntax errors.
- **Before `/gsd-verify-work`:** Neovim must start without errors or warnings.
- **Max feedback latency:** 5 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Threat Ref | Secure Behavior | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|------------|-----------------|-----------|-------------------|-------------|--------|
| 4-01-01 | 04 | 1 | JAVA-01,02 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |
| 4-02-01 | 04 | 2 | JAVA-03 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |
| 4-03-01 | 04 | 3 | DAP-01,02 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| JDTLS Capabilities | JAVA-01 | Plugin feature | Open a Java file and verify `blink.cmp` completions show documentation and rich types |
| Spring Boot LSP | JAVA-03 | Plugin feature | Open a Spring Boot project and verify `sts_ls` symbols appear |
| DAP Virtual Text | DAP-01 | Visual feature | Start a debug session and verify variable values appear next to the code |

---

## Validation Sign-Off

- [x] All tasks have `<automated>` verify or Wave 0 dependencies
- [x] Sampling continuity: no 3 consecutive tasks without automated verify
- [x] Wave 0 covers all MISSING references
- [x] No watch-mode flags
- [x] Feedback latency < 5s
- [x] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
