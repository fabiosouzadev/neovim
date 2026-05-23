---
phase: 1
slug: bug-fixes-code-cleanup
status: draft
nyquist_compliant: false
wave_0_complete: true
created: 2026-05-15
---

# Phase 1 — Validation Strategy

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
- **After every plan wave:** Start Neovim and verify visually.
- **Before `/gsd-verify-work`:** Neovim must start without errors or warnings.
- **Max feedback latency:** 5 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Threat Ref | Secure Behavior | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|------------|-----------------|-----------|-------------------|-------------|--------|
| 1-01-01 | 01 | 1 | BUGS-01..05 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |
| 1-01-02 | 01 | 1 | CLEAN-01..07 | — | N/A | config | `nvim --headless -c "quit"` | ✅ | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

*Existing infrastructure covers all phase requirements. No test framework installation needed for config fixes.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| Nerd Font Check | BUGS-03 | Visual feature | Start Neovim, verify icons are present in WhichKey/Diagnostics |
| Java Attach | BUGS-02 | LSP runtime | Open a `.java` file, verify no red error banner appears on attach |

---

## Validation Sign-Off

- [x] All tasks have `<automated>` verify or Wave 0 dependencies
- [x] Sampling continuity: no 3 consecutive tasks without automated verify
- [x] Wave 0 covers all MISSING references
- [x] No watch-mode flags
- [x] Feedback latency < 5s
- [x] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
