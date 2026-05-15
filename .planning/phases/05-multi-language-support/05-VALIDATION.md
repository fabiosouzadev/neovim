---
phase: 5
slug: multi-language-support
status: draft
nyquist_compliant: true
wave_0_complete: true
created: 2026-05-15
---

# Phase 5 — Validation Strategy

> Per-phase validation contract for Multi-Language Support.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | None (Configuration only) |
| **Config file** | `init.lua` |
| **Quick run command** | `nvim --headless -c "quit"` |
| **Estimated runtime** | ~2 seconds |

---

## Sampling Rate

- **After every file creation:** Run `nvim --headless -c "quit"` to ensure no syntax errors and Mason package recognition.
- **Before `/gsd-verify-work`:** Neovim must start without errors or warnings.

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Status |
|---------|------|------|-------------|--------|
| 5-01-01 | 05 | 1 | TSJS-01..05 | ⬜ pending |
| 5-02-01 | 05 | 2 | PY-01..05 | ⬜ pending |
| 5-03-01 | 05 | 3 | PHP-01..05 | ⬜ pending |

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| TS LSP & Format | TSJS-01,04 | Visual/Plugin | Abrir `.ts`, verificar `vtsls` anexado e formatação no save. |
| Python Ruff | PY-04 | Visual/Plugin | Abrir `.py`, verificar erros do `ruff` e formatação no save. |
| PHP Debug | PHP-03 | Visual/Plugin | Abrir `.php`, setar breakpoint e verificar se `xdebug` conecta. |

---

## Validation Sign-Off

- [x] All tasks have `<automated>` verify or Wave 0 dependencies
- [x] Sampling continuity: no 3 consecutive tasks without automated verify
- [x] Wave 0 covers all MISSING references
- [x] No watch-mode flags
- [x] Feedback latency < 5s
- [x] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
