# Directory Structure

> Last mapped: 2026-05-15

## Root Layout

```
~/.config/nvim/
├── init.lua                     # Entry point — loads config modules
├── lazy-lock.json               # Plugin version lockfile
├── LICENSE                      # Apache 2.0 license
├── README.md                    # Project documentation
│
├── .editorconfig                # Editor indent/charset rules
├── .gitignore                   # Git ignore (compiled Lua, binaries)
├── .markdownlint-cli2.yaml      # Markdown lint configuration
├── .neoconf.json                # neodev/neoconf LSP settings
├── selene.toml                  # Selene Lua linter config (std=vim)
├── stylua.toml                  # StyLua formatter config
│
└── lua/                         # All Lua source code
    ├── config/                  # Core configuration
    │   ├── options.lua          # Neovim options and global vars
    │   ├── keymaps.lua          # Core keybindings
    │   ├── autocmds.lua         # Autocommands
    │   ├── lazy.lua             # Plugin manager bootstrap + spec
    │   └── custom/              # Custom utility modules
    │       └── fidget-spinner.lua # CodeCompanion → fidget progress bridge
    │
    └── plugins/                 # Plugin configurations (per-category)
        ├── ai/                  # AI-assisted coding
        │   └── copilot.lua      # Copilot + blink-copilot integration
        │
        ├── coding/              # Code editing features
        │   ├── autopairs.lua    # Auto-close brackets
        │   ├── blink.lua        # Completion engine (blink.cmp)
        │   ├── conform.lua      # Format on save (conform.nvim)
        │   ├── indent_line.lua  # Indent guides (indent-blankline)
        │   └── nvim-lint.lua    # Async linting
        │
        ├── dap/                 # Debugging
        │   └── init.lua         # DAP core + DAP UI setup
        │
        ├── editor/              # Editor enhancements
        │   ├── gitsigns.lua     # Git gutter signs + hunk operations
        │   ├── grug-far.lua     # Search and replace
        │   ├── hardtime.lua     # Vim habit trainer
        │   ├── harpoon2.lua     # Quick file bookmarks
        │   ├── mini.lua         # mini.ai + mini.surround + mini.statusline
        │   ├── navigator.lua    # Tmux-aware split navigation
        │   ├── neo-tree.lua     # File tree browser
        │   ├── nvim-treesitter.lua # Syntax, indentation, text objects
        │   ├── persistence.lua  # Session management
        │   ├── todo-comments.lua # TODO/FIXME highlighting
        │   ├── trouble.lua      # Diagnostics/quickfix list
        │   └── which-key.lua    # Keymap discovery
        │
        ├── langs/               # Language-specific configurations
        │   └── java.lua         # JDTLS, debug, test, mise JDK
        │
        ├── lsp/                 # Language Server Protocol
        │   ├── init.lua         # LSP core, Mason, server configs
        │   └── lazydev.lua      # Neovim Lua development support
        │
        └── ui/                  # User interface
            ├── colorschemes.lua # rose-pine (active), tokyonight, catppuccin
            ├── flash.lua        # Enhanced jump/search labels
            ├── noice.lua        # UI replacement (messages, cmdline, popup)
            ├── snacks.lua       # Snacks core features
            ├── snacks_dashboard.lua # Start screen dashboard
            ├── snacks_picker.lua    # File/search/LSP picker
            └── toggleterm.lua   # Floating terminal
```

## File Counts

| Directory            | Files | Purpose                |
| -------------------- | ----- | ---------------------- |
| Root                  | 10    | Config, license, lock  |
| `lua/config/`         | 4     | Core config            |
| `lua/config/custom/`  | 1     | Custom modules         |
| `lua/plugins/ai/`     | 1     | AI                     |
| `lua/plugins/coding/` | 5     | Code editing           |
| `lua/plugins/dap/`    | 1     | Debugging              |
| `lua/plugins/editor/` | 11    | Editor features        |
| `lua/plugins/langs/`  | 1     | Language support       |
| `lua/plugins/lsp/`    | 2     | LSP                    |
| `lua/plugins/ui/`     | 7     | Visual/UI              |
| **Total**             | **43**|                        |

## Naming Conventions

### Files
- Plugin config files are named after the primary plugin: `gitsigns.lua`, `blink.lua`
- Multi-plugin files use descriptive names: `colorschemes.lua`, `nvim-treesitter.lua`
- Entry points for categories use `init.lua` (e.g., `lsp/init.lua`, `dap/init.lua`)
- Snacks configs split by feature: `snacks.lua`, `snacks_dashboard.lua`, `snacks_picker.lua`

### Module Patterns
- Plugin specs return a Lua table (or table of tables) directly
- `config/` modules use `require()` side-effects (no return values)
- Autocommand groups prefixed with `fabiosouzadev_vim_`

## Key Locations

| What                    | Where                                   |
| ----------------------- | --------------------------------------- |
| Leader key definition    | `lua/config/options.lua:4`               |
| Plugin bootstrap         | `lua/config/lazy.lua:1-16`               |
| LSP server definitions   | `lua/plugins/lsp/init.lua:30-93`         |
| Mason ensure_installed   | `lua/plugins/lsp/init.lua:301-305`       |
| Java JDTLS setup         | `lua/plugins/langs/java.lua`             |
| Copilot config           | `lua/plugins/ai/copilot.lua`             |
| Colorscheme selection     | `lua/plugins/ui/colorschemes.lua:62`     |
| Dashboard layout          | `lua/plugins/ui/snacks_dashboard.lua`    |
| Picker keymaps            | `lua/plugins/ui/snacks_picker.lua`       |
