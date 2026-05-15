# fabiosouzadev/neovim

## What This Is

Configuração pessoal de Neovim construída do zero com lazy.nvim, focada em produtividade máxima para desenvolvimento de software. Suporte primário a Java (via JDTLS + mise), com expansão planejada para Node/TypeScript, Python e PHP. Usa Snacks como framework de UI unificado (picker, dashboard, explorer, notifier).

A personal Neovim configuration built from scratch with lazy.nvim, focused on maximum productivity for software development. Primary Java support (via JDTLS + mise), with planned expansion to Node/TypeScript, Python, and PHP. Uses Snacks as unified UI framework.

## Core Value

**Produtividade brutal em projetos de software** — cada atalho, cada plugin, cada automação existe para eliminar fricção entre a intenção do desenvolvedor e o código escrito.

## Requirements

### Validated

<!-- Shipped and confirmed valuable — inferred from existing codebase. -->

- ✓ Modular plugin architecture with lazy.nvim (7 categories, 42 plugins) — existing
- ✓ Lua LSP with full workspace support (lua_ls via Mason) — existing
- ✓ Java development with JDTLS, mise JDK management, debug, and test — existing
- ✓ GitHub Copilot AI completion integrated with blink.cmp — existing
- ✓ blink.cmp completion engine with Rust fuzzy matcher — existing
- ✓ Snacks picker for files, grep, LSP, git, and GitHub — existing
- ✓ Snacks dashboard with recent files, projects, and git status — existing
- ✓ Git integration via gitsigns (hunks, blame, diff) and Snacks git pickers — existing
- ✓ Neo-tree file browser and Snacks explorer — existing
- ✓ Harpoon v2 quick file bookmarks — existing
- ✓ Flash enhanced jump/search with labels — existing
- ✓ Which-key keymap discovery — existing
- ✓ Trouble diagnostics and quickfix list — existing
- ✓ Format-on-save via conform.nvim (stylua, shfmt) — existing
- ✓ Async linting via nvim-lint (markdownlint) — existing
- ✓ nvim-dap debugging framework with DAP UI — existing
- ✓ Treesitter syntax highlighting, indentation, text objects — existing
- ✓ Mini.nvim (ai text objects, surround, statusline) — existing
- ✓ Session management via persistence.nvim — existing
- ✓ Floating terminal via toggleterm.nvim — existing
- ✓ Tmux-aware split navigation via Navigator.nvim — existing
- ✓ Multiple colorschemes (rose-pine active, tokyonight, catppuccin) — existing
- ✓ Noice UI replacement (messages, cmdline, popupmenu) — existing
- ✓ Hardtime vim habit training — existing

### Active

<!-- Current scope. Building toward these. -->

- [ ] Bilingual documentation — comprehensive README.md (English primary) + README-pt_br.md with keybinds, installation, plugin list
- [ ] Fix all identified bugs and concerns (12 issues from CONCERNS.md)
- [ ] Remove LazyVim ghost references (formatexpr, lazyvim_last_loc, type annotations)
- [ ] Fix JDTLS error-level debug notification on attach
- [ ] Clean dead/commented-out code (Telescope refs, mason-tool-installer, toggleterm commands)
- [ ] Normalize line endings to Unix (LF) across all files
- [ ] Consolidate split plugin configs (Snacks 3→1 file, related configs)
- [ ] Optimize lazy-loading (review `lazy = false` plugins, ensure proper events/commands)
- [ ] Remove orphaned CodeCompanion fidget-spinner module
- [ ] Improve Java support — enable blink.cmp capabilities for JDTLS, dynamic runtime paths
- [ ] Node.js/TypeScript full support — LSP (ts_ls/vtsls), DAP (js-debug-adapter), formatter (prettier), linter (eslint), treesitter
- [ ] Python full support — LSP (pyright/basedpyright), DAP (debugpy), formatter (black/ruff), linter (ruff), treesitter
- [ ] PHP full support — LSP (intelephense), DAP (php-debug), formatter (php-cs-fixer), linter (phpstan), treesitter
- [ ] Evaluate and set `vim.g.have_nerd_font` correctly

### Out of Scope

<!-- Explicit boundaries. Includes reasoning to prevent re-adding. -->

- Migration to LazyVim/NvChad/AstroNvim distribution — this is a from-scratch config by design
- Mobile/remote development features (code-server, etc.) — not needed
- Plugin development framework — this is a user config, not a plugin
- Real-time collaboration features — not needed for personal use
- Language support beyond Java/Node/TS/Python/PHP in v1 — expand later as needed

## Context

- **Repository:** `fabiosouzadev/neovim` at `~/.config/nvim`
- **Managed by:** Chezmoi dotfiles (the repo is part of a larger dotfiles system)
- **Platform:** macOS primary
- **Terminal:** Compatible with non-Nerd-Font terminals (fallback icons configured)
- **External tools:** mise (Java version manager), rg (ripgrep), git, aichat CLI
- **Codebase size:** 43 files, ~2500 lines of Lua
- **Current state:** Functional and productive, but has 12 identified concerns (3 high, 5 medium, 4 low priority)
- **Prior work:** Codebase mapped on 2026-05-15 (see `.planning/codebase/`)

## Constraints

- **Tech stack**: Lua only — all configuration in Lua, no VimScript
- **Plugin manager**: lazy.nvim — already invested, no migration planned
- **Backward compat**: Must work with Neovim stable (latest release)
- **No Nerd Font assumption**: Config must degrade gracefully without Nerd Fonts (user may or may not have them)
- **Cross-platform awareness**: Config may be deployed to Linux via Chezmoi (macOS primary)

## Key Decisions

<!-- Decisions that constrain future work. Add throughout project lifecycle. -->

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Snacks over Telescope | Already migrated, Snacks provides unified UI (picker + dashboard + explorer + notifier) | ✓ Good |
| blink.cmp over nvim-cmp | Rust fuzzy matcher for performance, modern architecture | ✓ Good |
| Mason for tool management | Centralized LSP/DAP/formatter/linter installation | ✓ Good |
| mise for Java JDK | Multi-version JDK management, integrates with project-level configs | ✓ Good |
| From-scratch over distribution | Full control, deep understanding of every plugin and keymap | ✓ Good |
| One lang file per language | `langs/java.lua` pattern — isolates language-specific config | — Pending |
| README in English + pt_br | Bilingual docs — English primary for broader audience, Portuguese for native comfort | — Pending |

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition** (via `/gsd-transition`):
1. Requirements invalidated? → Move to Out of Scope with reason
2. Requirements validated? → Move to Validated with phase reference
3. New requirements emerged? → Add to Active
4. Decisions to log? → Add to Key Decisions
5. "What This Is" still accurate? → Update if drifted

**After each milestone** (via `/gsd-complete-milestone`):
1. Full review of all sections
2. Core Value check — still the right priority?
3. Audit Out of Scope — reasons still valid?
4. Update Context with current state

---
*Last updated: 2026-05-15 after initialization*
