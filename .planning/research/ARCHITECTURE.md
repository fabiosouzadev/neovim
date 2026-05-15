# Architecture Research: Neovim Config Organization

> Researched: 2026-05-15

## Recommended Architecture Pattern

### Directory Structure (Best Practice 2025)

```
~/.config/nvim/
├── init.lua                 # Minimal: options → keymaps → autocmds → lazy
├── lua/
│   ├── config/              # Core config (no plugins)
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── autocmds.lua
│   │   └── lazy.lua         # Plugin manager bootstrap
│   ├── plugins/             # Plugin specs (auto-imported by lazy.nvim)
│   │   ├── coding.lua       # Completion, formatting, linting, pairs
│   │   ├── editor.lua       # File navigation, git, search, sessions
│   │   ├── lsp.lua          # LSP core, Mason, lazydev
│   │   ├── dap.lua          # Debug adapter protocol
│   │   ├── ui.lua           # Colors, statusline, notifications, dashboard
│   │   └── ai.lua           # AI-assisted coding
│   └── plugins/langs/       # Language-specific (one file per language)
│       ├── java.lua          # JDTLS, debug, test, treesitter
│       ├── typescript.lua    # ts_ls, js-debug, prettier, eslint
│       ├── python.lua        # pyright, debugpy, ruff
│       └── php.lua           # intelephense, php-debug, php-cs-fixer
```

### Key Architecture Decisions

1. **Flat plugin files over deep directories** — Instead of `plugins/editor/gitsigns.lua`, `plugins/editor/neo-tree.lua` etc., consolidate related plugins into single files: `plugins/editor.lua`. This reduces file count and makes it easier to see the full picture.

2. **One file per language in `langs/`** — Each language gets its own file that bundles treesitter parsers, LSP, DAP, formatters, and linters. This isolation prevents cross-language conflicts.

3. **Shared infrastructure in category files** — Core plugins (Mason, blink.cmp, conform, nvim-lint, nvim-dap) go in category files. Language files extend them via `opts_extend`.

4. **No custom modules unless necessary** — Avoid `lua/config/custom/` unless truly needed. Custom logic should live close to where it's used.

## Data Flow

```
init.lua
  → config/options.lua      (vim.g.*, vim.opt.*)
  → config/keymaps.lua       (core keymaps)
  → config/autocmds.lua      (autocommands)
  → config/lazy.lua          (bootstrap + import plugins/)
      → plugins/ui.lua       (colorschemes, noice, snacks, statusline)
      → plugins/coding.lua   (blink, conform, lint, pairs, indent)
      → plugins/editor.lua   (neo-tree, gitsigns, harpoon, flash, trouble, which-key, etc.)
      → plugins/lsp.lua      (lspconfig, mason, fidget, lazydev)
      → plugins/dap.lua      (nvim-dap, dap-ui, dap-virtual-text)
      → plugins/ai.lua       (copilot, blink-copilot)
      → plugins/langs/       (per-language configs extending above)
```

## Component Boundaries

| Component | Owns | Extends |
|-----------|------|---------|
| `lsp.lua` | Mason, lspconfig, keymaps, diagnostics | Extended by langs/ via `opts.servers` |
| `dap.lua` | nvim-dap core, dap-ui, keymaps | Extended by langs/ via `dap.configurations` |
| `coding.lua` | blink.cmp, conform, nvim-lint, autopairs | Extended by langs/ via `formatters_by_ft`, `linters_by_ft` |
| `langs/*.lua` | Language-specific treesitter, LSP servers, DAP configs, formatters, linters | Extends lsp, dap, coding |

## Build Order (Dependencies)

1. **Phase 1**: Fix bugs and clean code (no structural changes)
2. **Phase 2**: Consolidate plugin files (structural refactor)
3. **Phase 3**: Optimize lazy-loading (performance)
4. **Phase 4**: Add language support (depends on clean architecture)
5. **Phase 5**: Documentation (depends on stable config)
