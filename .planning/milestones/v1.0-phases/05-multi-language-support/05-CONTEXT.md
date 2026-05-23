# Phase 5: Multi-Language Support Context

> Captured: 2026-05-15

## Domain
Expansão do suporte a linguagens para TypeScript/JavaScript, Python e PHP, incluindo LSP, DAP, Formatação e Linting.

## Decisions

### 1. Stack Tecnológica por Linguagem
- **TypeScript/JavaScript:**
  - LSP: `vtsls` (preferido sobre `ts_ls`).
  - Linter: `eslint` via `nvim-lint`.
  - Formatter: `prettier` via `conform.nvim`.
  - DAP: `js-debug-adapter`.
- **Python:**
  - LSP: `basedpyright`.
  - Linter/Formatter: `ruff` (consolidado).
  - DAP: `debugpy`.
- **PHP:**
  - LSP: `phpactor` (preferido sobre `intelephense`).
  - Linter: `phpstan`.
  - Formatter: `php-cs-fixer`.
  - DAP: `xdebug`.

### 2. Organização e Padrões
- **DAP Location:** As configurações de DAP (adaptadores e configurações de inicialização) serão mantidas nos respectivos arquivos `lua/plugins/langs/*.lua`, seguindo o padrão de isolamento por linguagem.
- **mise Integration:** Todos os binários e runtimes (node, python, php) serão resolvidos dinamicamente via `mise where` para garantir portabilidade e isolamento de versões.
- **Mason integration:** Os servidores e ferramentas serão adicionados ao `ensure_installed` do Mason dentro de cada arquivo de linguagem usando a funcionalidade de extensão de opções do `lazy.nvim`.

## Canonical References
- `.planning/REQUIREMENTS.md` (TSJS-01..05, PY-01..05, PHP-01..05)
- `.planning/ROADMAP.md`
