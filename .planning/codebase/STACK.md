# Technology Stack

> Last mapped: 2026-05-15

## Language & Runtime

| Property       | Value                             |
| -------------- | --------------------------------- |
| Language        | Lua                               |
| Runtime         | Neovim (LuaJIT)                   |
| Config format   | Lua modules                       |
| Entry point     | `init.lua`                        |
| Min Neovim ver  | Latest stable (uses `vim.uv` API) |

## Plugin Manager

| Property   | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Manager     | [lazy.nvim](https://github.com/folke/lazy.nvim) (stable branch)          |
| Lock file   | `lazy-lock.json`                                                          |
| Plugin count| ~42 plugins                                                               |
| Rocks       | Disabled (`rocks.enabled = false`)                                        |
| Auto-update | Disabled (`checker.enabled = false`)                                      |

### Plugin Import Strategy

Plugins are loaded via `{ import = 'plugins.<category>' }` in `lua/config/lazy.lua`:

```lua
spec = {
  { import = 'plugins.ui' },
  { import = 'plugins.coding' },
  { import = 'plugins.editor' },
  { import = 'plugins.lsp' },
  { import = 'plugins.dap' },
  { import = 'plugins.langs' },
  { import = 'plugins.ai' },
}
```

## Core Dependencies (from lazy-lock.json)

### UI Framework
- **snacks.nvim** — Multi-purpose UI framework (picker, dashboard, explorer, notifier, scroll, indent, input, words, scope)
- **noice.nvim** — Complete UI replacement for messages, cmdline, and popupmenu
- **nui.nvim** — UI component library (dependency for neo-tree, noice, hardtime)
- **nvim-web-devicons** — File icons

### Colorschemes
- **rose-pine** — Active colorscheme (priority 1000, auto variant)
- **tokyonight.nvim** — Alternative (style: moon, lazy-loaded)
- **catppuccin** — Alternative (auto flavour, lazy-loaded, extensive integrations)

### Code Intelligence
- **nvim-lspconfig** — LSP client configuration
- **mason.nvim** / **mason-lspconfig.nvim** — LSP/tool installer
- **nvim-treesitter** — Syntax highlighting, indentation, folding
- **nvim-treesitter-textobjects** — Treesitter-based text objects and motions
- **lazydev.nvim** — Neovim Lua development support
- **fidget.nvim** — LSP progress indicator

### Completion & Snippets
- **blink.cmp** — Autocompletion engine (Rust-based fuzzy matcher)
- **blink-copilot** — Copilot source for blink.cmp
- **friendly-snippets** — Snippet collection

### AI
- **copilot.lua** — GitHub Copilot integration (JS, TS, Java enabled)

### Editor Features
- **neo-tree.nvim** — File system browser
- **harpoon** (v2) — Quick file navigation
- **flash.nvim** — Enhanced jump/search with labels
- **grug-far.nvim** — Search and replace across files
- **which-key.nvim** — Keymap hints
- **mini.nvim** — AI text objects, surround, statusline
- **gitsigns.nvim** — Git decorations and hunk management
- **todo-comments.nvim** — Highlight TODO/FIXME/HACK comments
- **trouble.nvim** — Diagnostics and quickfix list
- **persistence.nvim** — Session management
- **hardtime.nvim** — Vim habit training
- **Navigator.nvim** — Tmux-aware window navigation
- **toggleterm.nvim** — Floating terminal
- **indent-blankline.nvim** — Indentation guides
- **nvim-autopairs** — Auto-close brackets
- **nvim-ts-autotag** — Auto-close HTML/JSX tags

### Debugging
- **nvim-dap** — Debug Adapter Protocol client
- **nvim-dap-ui** — DAP visual interface
- **nvim-nio** — Async I/O for DAP UI

### Language-Specific
- **nvim-jdtls** — Eclipse JDTLS for Java development (via mise for JDK management)
- **java-debug-adapter** — Java debugging (Mason-installed)
- **java-test** — Java test runner (Mason-installed)

## External Tool Dependencies

### Installed via Mason (`ensure_installed`)
- `lua-language-server` — Lua LSP
- `stylua` — Lua formatter
- `shfmt` — Shell formatter
- `jdtls` — Java LSP
- `lemminx` — XML LSP
- `java-debug-adapter` — Java DAP
- `java-test` — Java test support

### External (Expected on PATH)
- `rg` (ripgrep) — Used as `grepprg`
- `git` — Version control, gitsigns, snacks git integration
- `mise` — Java version manager (for JDTLS and project JDK resolution)
- `aichat` — AI CLI tool (launched via toggleterm)

## Linting Configuration

| Tool            | Filetype   | Source        |
| --------------- | ---------- | ------------- |
| markdownlint     | markdown   | nvim-lint     |
| markdownlint-cli2| markdown   | config file   |

## Formatting Configuration

| Formatter | Filetype | Format on Save |
| --------- | -------- | -------------- |
| stylua     | lua      | Yes            |
| shfmt      | sh       | Yes            |
| LSP fallback | others | Yes (500ms timeout) |

**Disabled format-on-save for:** C, C++

## Configuration Files

| File                      | Purpose                       |
| ------------------------- | ----------------------------- |
| `stylua.toml`              | StyLua formatter config       |
| `selene.toml`              | Selene linter config (std=vim)|
| `.editorconfig`            | Editor indent/charset rules   |
| `.neoconf.json`            | neodev/neoconf LSP settings   |
| `.markdownlint-cli2.yaml`  | Markdown lint config          |
| `.gitignore`               | Git ignore rules              |
| `lazy-lock.json`           | Plugin version lockfile       |
