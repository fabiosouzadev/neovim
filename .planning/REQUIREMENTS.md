# Requirements: fabiosouzadev/neovim

**Defined:** 2026-05-15
**Core Value:** Produtividade brutal em projetos de software

## v1 Requirements

Requirements for current milestone. Each maps to roadmap phases.

### Bug Fixes (BUGS)

- [ ] **BUGS-01**: LazyVim ghost `formatexpr` reference removed — no silent errors on format
- [ ] **BUGS-02**: JDTLS attach notification changed from error to info/debug level
- [ ] **BUGS-03**: `vim.g.have_nerd_font` evaluated correctly based on terminal capabilities
- [ ] **BUGS-04**: LazyVim `lazyvim_last_loc` marker renamed to project-specific name
- [ ] **BUGS-05**: LazyVim type annotations (`lazyvim.TSFeat`, `lazyvim.TSConfig`) removed or replaced

### Code Cleanup (CLEAN)

- [ ] **CLEAN-01**: All commented-out Telescope references removed from LSP and other files
- [ ] **CLEAN-02**: Commented-out mason-tool-installer blocks removed
- [ ] **CLEAN-03**: Commented-out toggleterm commands (llm, aider, spring-boot) removed
- [ ] **CLEAN-04**: Orphaned `lua/config/custom/fidget-spinner.lua` CodeCompanion module removed
- [ ] **CLEAN-05**: Line endings normalized to Unix (LF) across all Lua files
- [ ] **CLEAN-06**: Duplicate `<C-h/j/k/l>` keymaps in keymaps.lua removed (Navigator.nvim handles it)
- [ ] **CLEAN-07**: Duplicate `[q`/`]q` quickfix keymaps in keymaps.lua removed (Trouble handles it)

### Plugin Reorganization (REORG)

- [ ] **REORG-01**: Snacks config consolidated from 3 files into 1 (`plugins/ui/snacks*.lua` → single `snacks.lua`)
- [ ] **REORG-02**: One-file-per-plugin pattern maintained and enforced — each plugin gets its own file for easy discovery and maintenance
- [ ] **REORG-03**: Mason `ensure_installed` centralized with `opts_extend` pattern from lang files
- [ ] **REORG-04**: Plugin categories reviewed — ensure each file is in the correct directory (ui/coding/editor/lsp/dap/langs/ai)

### Performance (PERF)

- [ ] **PERF-01**: Plugins with `lazy = false` audited and converted to event/cmd/ft loading where safe
- [ ] **PERF-02**: Startup time measured and baselined with `nvim --startuptime`
- [ ] **PERF-03**: Treesitter `ensure_installed` limited to actually-used parsers
- [ ] **PERF-04**: Neo-tree changed from `lazy = false` to on-demand loading

### Java Improvement (JAVA)

- [ ] **JAVA-01**: blink.cmp LSP capabilities enabled for JDTLS (uncomment `get_lsp_capabilities`)
- [ ] **JAVA-02**: Runtime paths resolved dynamically via `mise where` instead of hardcoded paths
- [ ] **JAVA-03**: Java formatters added to conform.nvim (google-java-format or JDTLS formatter)
- [ ] **JAVA-04**: Java linters evaluated and added if beneficial (checkstyle via nvim-lint)

### TypeScript/JavaScript Support (TSJS)

- [ ] **TSJS-01**: LSP server configured — `ts_ls` with standard settings via Mason
- [ ] **TSJS-02**: DAP adapter configured — `js-debug-adapter` with Chrome/Node attach configs
- [ ] **TSJS-03**: Formatter configured — `prettier` (or `prettierd`) via conform.nvim
- [ ] **TSJS-04**: Linter configured — `eslint` via nvim-lint
- [ ] **TSJS-05**: Treesitter parsers added — `javascript`, `typescript`, `tsx`, `jsdoc` (jsdoc already installed)

### Python Support (PY)

- [ ] **PY-01**: LSP server configured — `basedpyright` (or `pyright`) via Mason
- [ ] **PY-02**: DAP adapter configured — `debugpy` via Mason + `nvim-dap-python` plugin
- [ ] **PY-03**: Formatter configured — `ruff_format` + `ruff_organize_imports` via conform.nvim
- [ ] **PY-04**: Linter configured — `ruff` via nvim-lint
- [ ] **PY-05**: Treesitter parsers added — `python`

### PHP Support (PHP)

- [ ] **PHP-01**: LSP server configured — `intelephense` via Mason
- [ ] **PHP-02**: DAP adapter configured — `php-debug-adapter` via Mason (Xdebug)
- [ ] **PHP-03**: Formatter configured — `php-cs-fixer` via conform.nvim
- [ ] **PHP-04**: Linter configured — `phpstan` via nvim-lint
- [ ] **PHP-05**: Treesitter parsers added — `php`, `phpdoc`

### DAP Enhancements (DAP)

- [ ] **DAP-01**: `nvim-dap-virtual-text` plugin added for inline variable display
- [ ] **DAP-02**: Mason-nvim-dap integration re-enabled for automatic adapter installation

### Documentation (DOCS)

- [ ] **DOCS-01**: README.md in English with full keybind reference table
- [ ] **DOCS-02**: README-pt_br.md in Portuguese with same content
- [ ] **DOCS-03**: Installation instructions (dependencies, clone, first launch)
- [ ] **DOCS-04**: Plugin list with descriptions and categories
- [ ] **DOCS-05**: Architecture overview (directory structure, design decisions)
- [ ] **DOCS-06**: Screenshots or terminal recordings of key features

## v2 Requirements

Deferred to future release. Tracked but not in current roadmap.

### Additional Languages

- **LANG-01**: Go support (gopls, delve, gofumpt)
- **LANG-02**: Rust support (rust-analyzer, codelldb)
- **LANG-03**: Docker/Compose support (dockerls, docker-compose-ls)
- **LANG-04**: Terraform/HCL support (terraformls, tflint)

### Advanced Features

- **ADV-01**: Neotest integration for unified test runner
- **ADV-02**: CodeCompanion or similar AI chat integration
- **ADV-03**: Project-specific settings via .nvim.lua or exrc
- **ADV-04**: Custom snippets per language

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Migration to LazyVim/NvChad/AstroNvim | From-scratch config by design — full control |
| Embedded database client | Use dedicated tools (DataGrip, DBeaver) |
| Custom colorscheme creation | Three mature themes already configured |
| Mobile/remote dev (code-server) | Not needed for personal workflow |
| Neovim plugin development framework | This is a user config, not a plugin |
| Biome over Prettier/ESLint | Broader ecosystem support with Prettier; revisit in v2 |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| BUGS-01..05 | Phase 1 | Pending |
| CLEAN-01..07 | Phase 1 | Pending |
| REORG-01..04 | Phase 2 | Pending |
| PERF-01..04 | Phase 3 | Pending |
| JAVA-01..04 | Phase 4 | Pending |
| TSJS-01..05 | Phase 5 | Pending |
| PY-01..05 | Phase 5 | Pending |
| PHP-01..05 | Phase 5 | Pending |
| DAP-01..02 | Phase 4 | Pending |
| DOCS-01..06 | Phase 6 | Pending |

**Coverage:**
- v1 requirements: 43 total
- Mapped to phases: 43
- Unmapped: 0 ✓

---
*Requirements defined: 2026-05-15*
*Last updated: 2026-05-15 after initial definition*
