# Phase 1: Bug Fixes & Code Cleanup Context

> Captured: 2026-05-15

## Domain
Resolve all 12 identified concerns and remove dead code without structural changes.

## Decisions

### 1. Java Runtime Path Resolution
- **Decision:** Use Environment Variables.
- **Context:** Rather than dynamically running `mise where` on every startup (which adds overhead), the system will rely on environment variables (e.g., `$JAVA_HOME_11`, `$JAVA_HOME_21`) configured outside of Neovim.

### 2. Nerd Font Configuration
- **Decision:** Set `vim.g.have_nerd_font = true`.
- **Context:** Assumes Nerd Fonts are always available, unlocking all UI icons without complex dynamic checks.

### 3. Duplicate Keymap Handling
- **Decision:** Keep core keymaps as a fallback.
- **Context:** Do not delete the core `<C-h/j/k/l>` and `[q`/`]q` keybindings. Keep them so that if Trouble or Navigator are ever removed/disabled, window and quickfix navigation still works.

### 4. Project Naming Prefix
- **Decision:** Use `custom_` prefix.
- **Context:** Replace LazyVim markers like `lazyvim_last_loc` with `custom_last_loc`.

## Canonical References
- `.planning/codebase/CONCERNS.md`

## Code Context
- **`lua/config/options.lua`:** Target for Nerd Font fix and removing ghost formatexpr.
- **`lua/config/autocmds.lua`:** Target for renaming `lazyvim_last_loc` to `custom_last_loc`.
- **`lua/config/keymaps.lua`:** Target for keeping duplicate keymaps (fallback).
- **`lua/plugins/langs/java.lua`:** Target for removing error-level attach notification and switching to env vars for runtimes.
- **`lua/plugins/lsp/lazydev.lua`:** Target for removing LazyVim words/paths.
