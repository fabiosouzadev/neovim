# 🚀 fabiosouzadev/neovim

> **Brutal productivity in software projects.**

A professional-grade, modular, and high-performance Neovim configuration built for modern development. Specifically optimized for **Java**, **TypeScript/JavaScript**, **Python**, and **PHP**.

[Português (Brasil)](README.pt-br.md)

---

## ✨ Features

- **🧩 Modular Architecture:** Organized plugin system with one-file-per-plugin pattern.
- **⚡ Performance Optimized:** Lazy-loaded core components to ensure near-instant startup.
- **🎨 Premium UI:** Powered by `Snacks.nvim`, `Noice`, `Flash`, and a curated selection of colorschemes.
- **🛠️ Integrated LSP:** Full language server support with automatic tool installation via `Mason`.
- **🐞 Professional Debugging:** Centralized DAP framework with virtual text and language-specific adapters.
- **📦 Version Management:** Dynamic runtime resolution via `mise` for all supported languages.

---

## ⌨️ Keymaps Reference

### 🎯 General
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Explorer | Toggle file explorer (Snacks) |
| `<leader><space>` | Smart Find | Smart find files (Snacks) |
| `<leader>ff` | Find Files | Search for files by name |
| `<leader>fg` | Live Grep | Search for text in workspace |
| `<C-s>` | Save | Save current buffer |
| `<leader>l` | Lazy | Open Lazy plugin manager |

### 🔍 Search & Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Definition | Go to definition (Snacks) |
| `gr` | References | List all references (Snacks) |
| `gy` | Type Def | Go to type definition |
| `K` | Hover | Show documentation under cursor |
| `<leader>sb` | Buffer Lines | Search lines in current buffer |
| `<leader>sw` | Grep Word | Search for word under cursor |

### 🛠️ LSP & Quality
| Key | Action | Description |
|-----|--------|-------------|
| `grn` | Rename | Rename symbol under cursor |
| `gra` | Code Action | Show available code actions |
| `<leader>cf` | Format | Format current buffer (Conform) |
| `[d` / `]d` | Prev/Next | Navigate diagnostics |

### 🐞 Debugging (DAP)
| Key | Action | Description |
|-----|--------|-------------|
| `<F5>` | Continue | Start or continue execution |
| `<F1>` | Step Into | Step into function |
| `<F2>` | Step Over | Step over line |
| `<leader>b` | Breakpoint | Toggle breakpoint |
| `<F7>` | UI Toggle | Toggle DAP UI |

---

## 🌐 Language Support Matrix

| Language | LSP | Formatter | Linter | Debugger |
|----------|-----|-----------|--------|----------|
| **Java** | JDTLS | google-java-format | Checkstyle | java-debug |
| **TS/JS** | vtsls | Prettier | ESLint | js-debug |
| **Python** | basedpyright | Ruff | Ruff | debugpy |
| **PHP** | phpactor | php-cs-fixer | PHPStan | Xdebug |

---

## 🏗️ Architecture

The configuration follows a modular layout for maximum maintainability:

```
.
├── init.lua              # Entry point
└── lua/
    ├── config/           # Core configuration
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins/          # Plugin specifications
        ├── coding/       # Autocomplete, Snippets, Format
        ├── dap/          # Debugging framework
        ├── editor/       # Navigation, Git, Treesitter
        ├── langs/        # Language-specific setups
        ├── lsp/          # Core LSP configuration
        └── ui/           # Theme, Statusline, Dashboard
```

---

## 🚀 Installation

1. **Requirements:**
   - Neovim >= 0.10.0
   - `mise` (for runtime management)
   - `git`, `ripgrep`, `fd`, `fzf`
2. **Setup:**
   ```bash
   git clone https://github.com/fabiosouzadev/neovim.git ~/.config/nvim
   nvim
   ```

---

> [!TIP]
> Use `<leader>sk` to search through all available keymaps interactively!
