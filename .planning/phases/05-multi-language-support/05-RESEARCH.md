# Phase 5: Multi-Language Support - Research

## 1. Domain & Scope
Implementação de suporte completo para TypeScript/JavaScript, Python e PHP.

## 2. Findings & Implementation Approach

### TS/JS (vtsls)
- **Mason Package:** `vtsls`.
- **LSP Config:** `lspconfig.vtsls.setup({})`.
- **Formatting:** `prettier` via `conform.nvim`.
- **Linting:** `eslint` via `nvim-lint`.
- **DAP:** `js-debug-adapter` (Mason: `js-debug-adapter`).
- **Mise:** `mise where node`.

### Python (basedpyright)
- **Mason Package:** `basedpyright`.
- **LSP Config:** `lspconfig.basedpyright.setup({})`.
- **Formatting/Linting:** `ruff` via `conform.nvim` e `nvim-lint`.
- **DAP:** `debugpy` (Mason: `debugpy`).
- **Mise:** `mise where python`.

### PHP (phpactor)
- **Mason Package:** `phpactor`.
- **LSP Config:** `lspconfig.phpactor.setup({})`.
- **Formatting:** `php-cs-fixer` via `conform.nvim`.
- **Linting:** `phpstan` via `nvim-lint`.
- **DAP:** `php-debug-adapter` (Mason: `php-debug-adapter`).
- **Mise:** `mise where php`.

## 3. Implementation Patterns
- Cada linguagem terá seu próprio arquivo em `lua/plugins/langs/*.lua`.
- O padrão de `get_mise_java` será adaptado para cada linguagem (`get_mise_node`, `get_mise_python`, `get_mise_php`).
- DAP adapters serão registrados dentro de cada arquivo de linguagem usando as tabelas `dap.adapters` e `dap.configurations`.
- Mason `ensure_installed` será estendido via `opts.dependencies` no `lspconfig` e `dap`.
