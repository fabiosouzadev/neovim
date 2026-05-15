# Phase 2: Plugin Reorganization Context

> Captured: 2026-05-15

## Domain
Clean architecture with one-file-per-plugin pattern. Consolidação de configs do Snacks, separação de Mason e LSP/DAP.

## Decisions

### 1. Nomenclatura e Separação de LSP e DAP
- **Decision:** Renomear arquivos `init.lua`.
- **Context:** Os arquivos `lua/plugins/lsp/init.lua` e `lua/plugins/dap/init.lua` serão renomeados para refletir o plugin principal (ex: `lspconfig.lua` e `nvim-dap.lua`) para seguir estritamente o padrão "um arquivo por plugin". O carregamento continuará automático através da estrutura do `lazy.nvim`.

### 2. Separação do Mason
- **Decision:** Mover o Mason para um arquivo próprio.
- **Context:** O agente sugeriu e o usuário aprovou extrair o `mason.nvim` e seus utilitários complementares (ex: `mason-lspconfig.nvim`, etc.) para um arquivo independente (ex: `lua/plugins/lsp/mason.lua` ou `lua/plugins/mason.lua`). O Mason passa a ser uma entidade gerida separadamente usando o padrão `opts_extend = { "ensure_installed" }` caso necessário para plugar dependências dos "langs".

### 3. Configuração do Snacks
- **Decision:** Consolidação em um único arquivo usando uma grande tabela `opts`.
- **Context:** Todo o setup do `snacks.nvim` (core, dashboard, picker) será unificado em `lua/plugins/ui/snacks.lua` utilizando a configuração declarativa via `opts = {}` (em oposição a usar a função `config`).

## Canonical References
- `.planning/REQUIREMENTS.md`
- `.planning/ROADMAP.md`
- `.planning/codebase/CONVENTIONS.md`

## Code Context
- **`lua/plugins/lsp/init.lua`**: Será renomeado e limpo.
- **`lua/plugins/dap/init.lua`**: Será renomeado e limpo.
- **`lua/plugins/ui/snacks_*.lua`**: Os três arquivos atuais serão unificados em um só (`snacks.lua`).
