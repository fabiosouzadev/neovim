# Phase 1: Bug Fixes & Code Cleanup - Plan

> Generated: 2026-05-15

## Goal
Resolve all 12 identified concerns and remove dead code without structural changes.

## Tasks

### Wave 1: Critical Bug Fixes
- [ ] 1. **Remove Ghost `formatexpr`:** In `lua/config/options.lua`, delete `opt.formatexpr`. (BUGS-01)
- [ ] 2. **Enable Nerd Font:** In `lua/config/options.lua`, set `vim.g.have_nerd_font = true`. (BUGS-03)
- [ ] 3. **Fix JDTLS Notification:** In `lua/plugins/langs/java.lua`, change `vim.notify` severity. (BUGS-02)
- [ ] 4. **Rename Marker:** In `lua/config/autocmds.lua`, change `lazyvim_last_loc` to `custom_last_loc`. (BUGS-04)
- [ ] 5. **Clean LazyDev:** In `lua/plugins/lsp/lazydev.lua`, remove `LazyVim` references. (BUGS-05)

### Wave 2: Code Cleanup
- [ ] 6. **Delete Commented Code:** Remove commented Telescope, Mason, and DAP configurations from `lua/config/options.lua`, `lua/plugins/lsp/init.lua`, `lua/plugins/dap/init.lua`, and `lua/plugins/langs/java.lua`. (CLEAN-01, CLEAN-02)
- [ ] 7. **Clean ToggleTerm:** Remove LLM keymaps from `lua/plugins/ui/toggleterm.lua`. (CLEAN-03)
- [ ] 8. **Fix Java Runtimes:** In `lua/plugins/langs/java.lua`, update hardcoded mise paths to use `vim.env.JAVA_HOME_XX` fallbacks. (CLEAN-04)
- [ ] 9. **Enable blink.cmp for Java:** Uncomment capabilities line in `lua/plugins/langs/java.lua:306`. (CLEAN-07)
- [ ] 10. **Remove Fidget Spinner:** Delete `lua/config/custom/fidget-spinner.lua`. (CLEAN-06)

### Wave 3: Line Endings
- [ ] 11. **Normalize Line Endings:** Run `dos2unix` or `stylua` to convert CRLF to LF in `.lua` files. (CLEAN-05)
