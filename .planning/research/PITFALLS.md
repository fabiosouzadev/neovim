# Pitfalls Research: Neovim Configuration

> Researched: 2026-05-15

## Critical Pitfalls

### 1. Breaking Working Config During Refactor
**Risk:** HIGH — Restructuring plugin files can break lazy.nvim module resolution
**Warning signs:** Plugins not loading, keymaps missing, LSP not attaching
**Prevention:**
- Test after each structural change (don't batch refactors)
- Use `nvim --startuptime` before and after each change
- Keep lazy-lock.json committed for rollback
- Run `:checkhealth` after major changes
**Phase:** Phase 2 (Plugin Consolidation)

### 2. Plugin Conflicts When Merging Files
**Risk:** MEDIUM — Multiple `opts` tables for the same plugin in different files can conflict
**Warning signs:** Plugin behavior changes unexpectedly, options being overridden
**Prevention:**
- Use `opts_extend` for additive fields (ensure_installed, sources.default)
- Test merged configs incrementally
- Check lazy.nvim's merge behavior: later specs override earlier ones
**Phase:** Phase 2 (Plugin Consolidation)

### 3. Mason ensure_installed Growing Unbounded
**Risk:** LOW — Adding too many tools slows first-launch experience
**Warning signs:** First launch takes >5 minutes downloading tools
**Prevention:**
- Only add tools you actively use
- Use `opts_extend` so each lang file adds its own tools
- Consider per-platform guards for tools that don't work on all OSes
**Phase:** Phase 4 (Language Support)

### 4. Over-Eager Lazy Loading Breaking Features
**Risk:** MEDIUM — Moving plugins to lazy-load can break features that depend on early initialization
**Warning signs:** Features work on second use but not first, race conditions
**Prevention:**
- Profile with `:Lazy profile` before changing loading behavior
- Test each change: does the feature work on first file open?
- Some plugins genuinely need `lazy = false` (snacks.nvim, treesitter)
**Phase:** Phase 3 (Performance)

### 5. DAP Configuration Complexity
**Risk:** MEDIUM — Each language has different DAP setup requirements
**Warning signs:** "No configuration found for X" errors, breakpoints not hitting
**Prevention:**
- Use language-specific helper plugins (nvim-dap-python, nvim-jdtls)
- Test each language's debug setup with a minimal project
- Support VSCode launch.json for project-specific configs
**Phase:** Phase 4 (Language Support)

### 6. Nerd Font Assumption Inconsistency
**Risk:** LOW — Some plugins may hardcode icons while `have_nerd_font = false`
**Warning signs:** Garbled characters in UI, broken icons
**Prevention:**
- Set `vim.g.have_nerd_font` correctly based on actual terminal
- Test with and without Nerd Font
- Ensure all plugins respect the flag
**Phase:** Phase 1 (Bug Fixes)

### 7. Documentation Drift
**Risk:** MEDIUM — README keybind tables become outdated as config evolves
**Warning signs:** Users report wrong keybindings, docs don't match reality
**Prevention:**
- Generate keybind tables from actual config where possible
- Review docs after each structural change
- Include "last verified" dates in README
**Phase:** Phase 5 (Documentation) + ongoing

### 8. Cross-Platform Path Issues
**Risk:** LOW — Hardcoded paths (mise, Mason) may differ on Linux vs macOS
**Warning signs:** Tools not found on Linux deployment via Chezmoi
**Prevention:**
- Use `vim.fn.stdpath()` and `vim.fn.expand()` for all paths
- Test on both macOS and Linux (or at least validate paths exist)
- Use `mise where` dynamically instead of hardcoded paths
**Phase:** Phase 1 (Bug Fixes) — Java runtime paths
