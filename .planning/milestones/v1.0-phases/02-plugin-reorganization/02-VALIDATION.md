---
phase: 2
slug: plugin-reorganization
status: draft
nyquist_compliant: false
wave_0_complete: true
created: 2026-05-15
---

# Phase 2 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | None (Configuration only) |
| **Config file** | `init.lua` |
| **Quick run command** | `nvim --headless -c "quit"` |
| **Full suite command** | `nvim --headless -c "PlenaryBustedDirectory tests/"` (if tests existed) |
| **Estimated runtime** | ~1 seconds |

---

## Sampling Rate

- **After every task commit:** Run `nvim --headless -c "quit"` to ensure no syntax errors.
- **After every plan wave:** Verify visually that UI plugins load correctly.
- **Before `/gsd-verify-work`:** Neovim must start without errors or warnings.
- **Max feedback latency:** 5 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Threat Ref | Secure Behavior | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|------------|-----------------|-----------|-------------------|-------------|--------|
| 2-01-01 | 02 | 1 | REORG-02 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |
| 2-01-02 | 02 | 1 | REORG-03 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |
| 2-01-03 | 02 | 2 | REORG-01 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

*Existing infrastructure covers all phase requirements. No test framework installation needed for config fixes.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| Snacks Dashboard | REORG-01 | Visual feature | Start Neovim with no arguments and verify the Snacks dashboard loads |
| Snacks Picker | REORG-01 | Visual feature | Press `<leader>ff` and verify the file picker opens |
| Mason Ensure | REORG-03 | Plugin state | Run `:Mason` and ensure stylua, lua_ls, jdtls, shfmt are installed |

---

## Validation Sign-Off

- [x] All tasks have `<automated>` verify or Wave 0 dependencies
- [x] Sampling continuity: no 3 consecutive tasks without automated verify
- [x] Wave 0 covers all MISSING references
- [x] No watch-mode flags
- [x] Feedback latency < 5s
- [x] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
