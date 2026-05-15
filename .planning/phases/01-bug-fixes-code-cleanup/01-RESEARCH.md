# Phase 1: Bug Fixes & Code Cleanup - Research

> Researched: 2026-05-15

## 1. Domain & Scope
The goal of this phase is to resolve 12 specific technical debt items ("concerns") and remove dead code. This is purely a cleanup phase; no structural changes to the architecture will occur.

## 2. Findings per Concern

### BUGS-01: Ghost `formatexpr` Reference
- **File:** `lua/config/options.lua:64`
- **Issue:** `opt.formatexpr = 'v:lua.LazyVim.format.formatexpr()'`
- **Fix:** Delete this line entirely. `conform.nvim` handles formatting.

### BUGS-02: JDTLS Error Notification
- **File:** `lua/plugins/langs/java.lua:294`
- **Issue:** `vim.notify('lsp server (jdtls) attached - attach_jdtls', "error")`
- **Fix:** Change the severity to `vim.log.levels.INFO` (or delete it).

### BUGS-03: Nerd Font Flag
- **File:** `lua/config/options.lua:40`
- **Issue:** `vim.g.have_nerd_font = false`
- **Fix:** Change to `vim.g.have_nerd_font = true` per user decision.

### BUGS-04: LazyVim Last Loc Marker
- **File:** `lua/config/autocmds.lua:40-41`
- **Issue:** Uses `vim.b[buf].lazyvim_last_loc`
- **Fix:** Rename to `custom_last_loc` per user decision.

### BUGS-05: LazyVim Library References
- **File:** `lua/plugins/lsp/lazydev.lua:10, 12`
- **Issue:** Registers `LazyVim` in lua language server workspace.
- **Fix:** Remove the lines referencing `LazyVim`.

### CLEAN-01: Commented Code in Options & LSP
- **Files:** `lua/config/options.lua`, `lua/plugins/lsp/init.lua`
- **Issue:** Large blocks of commented out Telescope and Mason configuration.
- **Fix:** Delete all commented out code blocks (especially lines 263-270, 278-291 in `lsp/init.lua`).

### CLEAN-02: Commented Code in DAP & Java
- **Files:** `lua/plugins/dap/init.lua`, `lua/plugins/langs/java.lua`
- **Issue:** Old Mason integration and old java DAP settings commented out.
- **Fix:** Delete lines 136-159 in `dap/init.lua` and other commented code.

### CLEAN-03: Commented Code in ToggleTerm
- **File:** `lua/plugins/ui/toggleterm.lua`
- **Issue:** Old keymaps for LLM and Pet profile.
- **Fix:** Delete lines 13-14, 18-23.

### CLEAN-04: Hardcoded Java Runtimes
- **File:** `lua/plugins/langs/java.lua:271-285`
- **Fix:** Update the `path` assignments to use environment variables first.
  - `path = vim.env.JAVA_HOME_11 or vim.fn.expand '~/.local/share/mise/installs/java/temurin-11'`
  - `path = vim.env.JAVA_HOME_21 or vim.fn.expand '~/.local/share/mise/installs/java/21'`
  - `path = vim.env.JAVA_HOME_26 or vim.fn.expand '~/.local/share/mise/installs/java/latest'`

### CLEAN-05: Line Endings
- **Files:** Various (identified in CONCERNS.md)
- **Fix:** Run a script or `dos2unix` across all `.lua` files in `lua/`.

### CLEAN-06: CodeCompanion Orphan
- **File:** `lua/config/custom/fidget-spinner.lua`
- **Fix:** Delete this file, it's not used and depends on an uninstalled plugin.

### CLEAN-07: blink.cmp Capabilities
- **File:** `lua/plugins/langs/java.lua:306`
- **Issue:** `capabilities = require('blink.cmp').get_lsp_capabilities() or nil` is commented out.
- **Fix:** Uncomment it to enable autocomplete for Java.

### NOTE on Keymaps
The duplicate keymaps in `keymaps.lua` for window navigation and quickfix will be KEPT as a fallback per user decision.

## 3. Plan Requirements
The planner must:
1. Create tasks to modify `options.lua`, `autocmds.lua`, `lazydev.lua`, `java.lua`, `lsp/init.lua`, `dap/init.lua`, `toggleterm.lua`.
2. Create a task to delete `fidget-spinner.lua`.
3. Create a bash task to normalize line endings (`find lua -name "*.lua" -exec dos2unix {} +` or similar depending on OS).
