# Testing

> Last mapped: 2026-05-15

## Overview

This Neovim configuration does **not have automated tests**. This is typical for personal Neovim configurations, which are generally validated through interactive use rather than automated test suites.

## Current Testing Approach

### Manual / Interactive Validation
- **Plugin loading:** Verified via `:Lazy` UI (plugin manager dashboard)
- **LSP functionality:** Verified via `:LspInfo`, `:Mason`, and actual editing
- **Treesitter:** Verified via `:TSInstallInfo` and syntax highlighting behavior
- **Formatting:** Verified via `:ConformInfo` and `<leader>cf` (format buffer)
- **Linting:** Verified via `nvim-lint` auto-triggers (BufEnter, BufWritePost, InsertLeave)
- **DAP:** Verified via `:DapUI` toggle and breakpoint interaction

### Health Checks
Neovim's built-in `:checkhealth` provides diagnostic verification for:
- Plugin health status
- Provider availability (clipboard, python, node, etc.)
- LSP server status
- Treesitter parser installation

### Startup Performance
- **`:Lazy profile`** — Shows plugin load times
- **`lazy-lock.json`** — Tracks exact plugin commits for reproducibility

## Linting Tools (Code Quality)

### StyLua (Formatter)
- **Config:** `stylua.toml`
- **Enforces:** 2-space indent, single quotes, Unix line endings, 160 col width
- **Run:** Automatically on save for `.lua` files via `conform.nvim`

### Selene (Lua Linter)
- **Config:** `selene.toml`
- **Standard:** `vim` (knows about Vim globals)
- **Lints:** `mixed_table = allow`
- **Note:** Not integrated into nvim-lint — configured for external use

### markdownlint
- **Config:** `.markdownlint-cli2.yaml`
- **Integration:** Via `nvim-lint` for markdown files

## Potential Testing Improvements

### Recommended Additions
1. **Lua module tests** — For custom modules like `config/custom/fidget-spinner.lua`
2. **Startup tests** — Verify `nvim --headless` loads without errors
3. **Plugin spec validation** — Verify all plugin specs are valid lazy.nvim configs
4. **CI pipeline** — Run `stylua --check` and `selene` on commits

### Testing Frameworks Available
- **plenary.nvim** — Already in dependencies (used by neo-tree, todo-comments), includes `plenary.busted` test runner
- **vusted** — Alternative, uses busted for Neovim plugin testing
- **mini.test** — From mini.nvim (already installed), lightweight test runner

## File Integrity

### Lock File (`lazy-lock.json`)
- Pins all 42 plugins to exact git commits
- Ensures reproducible installations across machines
- Updated automatically by lazy.nvim on plugin updates
