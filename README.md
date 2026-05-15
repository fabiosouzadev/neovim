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

### 🎯 Core & General
| Key | Action | Description |
|-----|--------|-------------|
| `<Esc>` | Clear Search | Clear search highlights in normal mode |
| `<C-s>` | Save | Save current buffer (Normal/Insert/Visual) |
| `<leader>l` | Lazy | Open Lazy plugin manager |
| `<leader>bD` | Close Buffer | Delete current buffer and close window |
| `<Esc><Esc>` | Exit Terminal | Return to normal mode from terminal |
| `n` / `N` | Search Nav | Next/Previous search result (centered) |
| `<` / `>` | Indent | Better visual indenting (remains in visual mode) |

### 🧭 Navigation & Windows
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h/j/k/l>` | Window Focus | Move focus to left/lower/upper/right window |
| `<C-S-h/j/k/l>` | Window Move | Move current window left/lower/upper/right |
| `s` / `S` | Flash | Enhanced jump / Treesitter selection |
| `[q` / `]q` | Quickfix | Navigate to previous/next quickfix item |
| `[t` / `]t` | Todo | Navigate to previous/next TODO comment |
| `\\` | Neo-tree | Reveal current file in explorer |

### 🔍 Search (Snacks Picker)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader><space>` | Smart Find | Smart file search across workspace |
| `<leader>ff` | Find Files | Search for files by name |
| `<leader>fg` | Live Grep | Search for text in the entire workspace |
| `<leader>fr` | Recent | Open recent files history |
| `<leader>fp` | Projects | List and switch between projects |
| `<leader>sb` | Buffer Lines | Search lines in current buffer |
| `<leader>sd` | Diagnostics | List workspace diagnostics |
| `<leader>su` | Undo | Visual undo history |
| `<leader>sk` | Keymaps | Interactive search for all keybindings |
| `<leader>uC` | Themes | List and switch colorschemes |

### 🛠️ LSP & Code Quality
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Definition | Jump to definition |
| `gr` | References | List all symbol references |
| `gi` | Implementation | Jump to implementation |
| `gy` | Type Def | Jump to type definition |
| `K` | Hover | Show documentation/signature under cursor |
| `grn` | Rename | Rename symbol across workspace |
| `gra` | Code Action | Show available code actions |
| `<leader>cf` | Format | Format buffer (Conform) |
| `[d` / `]d` | Diagnostics | Go to previous/next diagnostic line |
| `[e` / `]e` | Errors | Go to previous/next error |

### 🐙 Git
| Key | Action | Description |
|-----|--------|-------------|
| `]c` / `[c` | Change | Jump to next/prev git hunk |
| `<leader>gs` | Status | Open Git status picker |
| `<leader>gl` | Log | Open Git log picker |
| `<leader>ghp` | Preview | Preview current hunk changes |
| `<leader>ghs` | Stage | Stage current hunk |
| `<leader>ghr` | Reset | Reset current hunk |
| `<leader>ghd` | Diff | Diff current file against index |

### 🐞 Debugging (DAP)
| Key | Action | Description |
|-----|--------|-------------|
| `<F5>` | Start/Cont | Start or continue debugging session |
| `<F1>` | Step Into | Step into function call |
| `<F2>` | Step Over | Step over current line |
| `<F3>` | Step Out | Step out of current function |
| `<leader>b` | Breakpoint | Toggle line breakpoint |
| `<leader>B` | Cond Break | Toggle conditional breakpoint |
| `<F7>` | UI Toggle | Toggle DAP UI interface |
| `<leader>de` | Eval | Evaluate expression under cursor |

### ☕ Java Specific
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>co` | Organize | Organize imports (JDTLS) |
| `<leader>tc` | Test Class | Run all tests in current class |
| `<leader>tm` | Test Method | Run nearest test method |
| `<leader>cxv` | Extract Var | Extract to variable |
| `<leader>cgs` | Super | Go to super implementation |

### 🧰 Specialized Tools
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>xx` | Trouble | Toggle diagnostics list |
| `<leader>sr" | Grug-far | Global search and replace |
| `<leader>ha` | Harpoon | Add file to Harpoon |
| `<leader>he` | Harpoon UI | Toggle Harpoon quick menu |
| `<leader>st` | Todo List | List all TODOs in workspace |

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
