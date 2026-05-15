# Concerns & Technical Debt

> Last mapped: 2026-05-15

## 🔴 High Priority

### 1. LazyVim Ghost References
**Files:** `lua/config/options.lua`, `lua/config/autocmds.lua`, `lua/plugins/lsp/lazydev.lua`

The config references LazyVim conventions without actually depending on LazyVim:
- `opt.formatexpr = 'v:lua.LazyVim.format.formatexpr()'` in `options.lua:64` — calls `LazyVim.format.formatexpr()` which does **not exist** (LazyVim is not installed)
- `vim.b[buf].lazyvim_last_loc` marker used in `autocmds.lua:40` — naming suggests LazyVim dependency
- `lazydev.lua:10` references `{ path = "LazyVim", words = { "LazyVim" } }` — unnecessary library entry

**Impact:** `formatexpr` likely throws silent errors. The others are cosmetic but misleading.

**Recommendation:** Replace `LazyVim.format.formatexpr()` with a direct implementation or remove the formatexpr override entirely.

### 2. JDTLS Error-Level Notification on Attach
**File:** `lua/plugins/langs/java.lua:294`

```lua
vim.notify('lsp server (jdtls) attached - attach_jdtls', "error")
```

A debug notification is left at `error` severity level. This fires every time a Java file is opened and produces a red notification that looks like an actual error.

**Recommendation:** Remove or change to `vim.log.levels.DEBUG` / `vim.log.levels.INFO`.

### 3. Nerd Font Flag Set to `false`
**File:** `lua/config/options.lua:40`

```lua
vim.g.have_nerd_font = false
```

This affects multiple plugins (which-key icons, gitsigns, diagnostics, lazy.nvim UI, mini.statusline). If the user has a Nerd Font installed, this should be `true` to unlock icon-based UIs.

**Impact:** Degraded visual experience across the entire config.

## 🟡 Medium Priority

### 4. Duplicate Keymap Definitions
**Files:** `lua/config/keymaps.lua`, `lua/plugins/editor/navigator.lua`

Window navigation `<C-h/j/k/l>` defined in both `keymaps.lua:55-58` and `navigator.lua:12-15`. Navigator.nvim overwrites the basic keymaps, but having both creates confusion.

**Recommendation:** Remove the basic window navigation keymaps from `keymaps.lua` since Navigator.nvim handles it with tmux awareness.

### 5. Duplicate Quickfix `[q`/`]q` Keymaps
**Files:** `lua/config/keymaps.lua:16-17`, `lua/plugins/editor/trouble.lua:20-46`

Quickfix navigation defined in both core keymaps and trouble.nvim. Trouble.nvim's version is smarter (checks if Trouble is open first).

**Recommendation:** Remove the basic `[q`/`]q` from `keymaps.lua`.

### 6. Hardcoded Java Runtime Paths
**File:** `lua/plugins/langs/java.lua:271-285`

```lua
runtimes = {
  { name = 'JavaSE-11', path = vim.fn.expand '~/.local/share/mise/installs/java/temurin-11' },
  { name = 'JavaSE-21', path = vim.fn.expand '~/.local/share/mise/installs/java/21' },
  { name = 'JavaSE-26', path = vim.fn.expand '~/.local/share/mise/installs/java/latest' },
}
```

Paths are hardcoded to specific mise installation directories. If mise layout changes or the user uses a different Java manager, these break silently.

**Recommendation:** Use `mise where java@<version>` dynamically (like `get_jdtls_java()` does) or validate paths exist before adding them.

### 7. Commented-Out Code Proliferation
**Files:** Multiple plugin files

Significant amounts of commented-out code suggesting experimentation or migration:
- `lua/plugins/lsp/init.lua:149-180` — Telescope references commented out (migrated to Snacks picker + native LSP)
- `lua/plugins/lsp/init.lua:263-270` — mason-tool-installer commented out
- `lua/plugins/lsp/init.lua:278-291` — Another mason-tool-installer block
- `lua/plugins/dap/init.lua:136-159` — mason-nvim-dap commented out
- `lua/plugins/ui/toggleterm.lua:13-23` — Commented keymaps for llm, aider, spring-boot
- Various `-- vim.keymap.set(...)` lines

**Recommendation:** Clean up dead code. If needed for reference, move to a `NOTES.md` or git history.

### 8. `blink.cmp` Capabilities Not Enabled for JDTLS
**File:** `lua/plugins/langs/java.lua:306`

```lua
-- capabilities = require('blink.cmp').get_lsp_capabilities() or nil,
```

blink.cmp LSP capabilities are commented out for JDTLS. This may result in suboptimal completion behavior for Java files.

**Recommendation:** Uncomment if blink.cmp is the active completion engine.

## 🟢 Low Priority

### 9. CodeCompanion Fidget Spinner Without CodeCompanion
**File:** `lua/config/custom/fidget-spinner.lua`

This module creates autocommand hooks for `CodeCompanionRequestStarted` and `CodeCompanionRequestFinished` events, but CodeCompanion is **not installed** (not in lazy-lock.json or any plugin spec).

**Impact:** Dead code. The autocommands fire but never match any events.

**Recommendation:** Remove the module or add CodeCompanion to the plugin setup.

### 10. Mixed Line Endings in Source Files
**Files:** Some files use CRLF (`\r\n`), others use LF (`\n`)

Files with CRLF: `blink.lua`, `conform.lua`, `harpoon2.lua`, `grug-far.lua`, `which-key.lua`, `nvim-treesitter.lua`, `flash.lua`, `noice.lua`, `snacks_picker.lua`, `persistence.lua`, `todo-comments.lua`, `trouble.lua`, `lsp/init.lua`, `lsp/lazydev.lua`

Files with LF: `init.lua`, `autopairs.lua`, `nvim-lint.lua`, `dap/init.lua`, all config files, all UI files except above

**Impact:** Inconsistency. StyLua config specifies `line_endings = "Unix"` but some files have CRLF.

**Recommendation:** Run `stylua` across all files to normalize line endings, or use `dos2unix`.

### 11. `.gitignore` Missing `.planning/` Directory
**File:** `.gitignore`

The `.planning/` directory (created by GSD tooling) is not excluded from git.

**Recommendation:** Add `.planning/` to `.gitignore` if it shouldn't be committed.

### 12. Treesitter Type Annotations Reference LazyVim Types
**File:** `lua/plugins/editor/nvim-treesitter.lua:13-15, 38`

```lua
---@type lazyvim.TSFeat
---@param opts lazyvim.TSConfig
```

These type annotations reference LazyVim types that don't exist in this config.

**Impact:** Type hints are non-functional; purely cosmetic.

## Summary

| Priority | Count | Categories                                        |
| -------- | ----- | ------------------------------------------------- |
| 🔴 High  | 3     | Ghost deps, debug noise, nerd font flag            |
| 🟡 Medium| 5     | Duplicate keymaps, hardcoded paths, dead code      |
| 🟢 Low   | 4     | Orphaned modules, line endings, gitignore, types   |
