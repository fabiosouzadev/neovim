# Phase 6: Documentation - Research

## 1. Domain & Scope
Criação de documentação completa e premium para o projeto, cobrindo Tour de Funcionalidades, Referência de Atalhos, Matriz de Linguagens e Visão Geral da Arquitetura.

## 2. Findings & Implementation Approach

### Keymaps Inventory
- **Core:** `<Esc>` (nohlsearch), `<leader>xq` (quickfix), `<leader>cd` (diagnostics), `<leader>l` (lazy), `<C-s>` (save).
- **Navigation:** `<C-h/j/k/l>` (split focus), `<C-S-h/j/k/l>` (split move).
- **Snacks (UI):** `<leader>e` (explorer), `<leader>ff` (find files), `<leader>fg` (grep), `<leader>gs` (git status).
- **LSP:** `grn` (rename), `gra` (code action), `grr` (references), `grd` (definition), `K` (hover).
- **DAP:** `<F5>` (continue), `<F1>` (step into), `<F2>` (step over), `<leader>b` (toggle breakpoint).
- **Java:** `<leader>co` (organize imports), `<leader>tt` (test class).

### Language Matrix
- **Java:** JDTLS, Google Java Format, Checkstyle, DAP.
- **TypeScript:** vtsls, Prettier, ESLint, JS Debug Adapter.
- **Python:** basedpyright, Ruff, Debugpy.
- **PHP:** phpactor, php-cs-fixer, phpstan, Xdebug.

### Architecture
- **Entry:** `init.lua`.
- **Config:** `lua/config/` (options, keymaps, autocmds).
- **Plugins:** `lua/plugins/` (coding, dap, editor, langs, lsp, ui).

## 3. Plan Requirements
The planner must:
1. Criar `README.md` (English) com tour, tabelas e arquitetura.
2. Criar `README.pt-br.md` (Português) com o mesmo conteúdo traduzido.
3. Garantir a estética rica com emojis e alerts.
