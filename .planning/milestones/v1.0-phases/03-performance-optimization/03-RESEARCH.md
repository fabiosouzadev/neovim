# Phase 3: Performance Optimization - Research

## 1. Domain & Scope
O objetivo da fase é otimizar o tempo de inicialização estabelecendo eventos de lazy-loading mais granulares e removendo dependências imediatas (`lazy = false`) desnecessárias.

## 2. Findings & Implementation Approach

### PERF-01: Conversão de `lazy = false` para eventos
- **Target Files & Actions:**
  - `lua/plugins/editor/hardtime.lua`: Remover `lazy = false`, adicionar `event = { "BufReadPost", "BufNewFile", "BufWritePre" }`.
  - `lua/plugins/editor/nvim-treesitter.lua`: Remover `lazy = false`, adicionar `event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" }` (VeryLazy garante que inicie suavemente após o startup).
  - Outros plugins (ex: `gitsigns.lua`, `indent_line.lua`, `mini.lua`) não têm triggers declarados e por isso carregam no startup. Serão convertidos:
    - `gitsigns.lua` -> `event = { "BufReadPost", "BufNewFile", "BufWritePre" }`
    - `indent_line.lua` -> `event = { "BufReadPost", "BufNewFile", "BufWritePre" }`
    - `mini.lua` -> `event = "VeryLazy"` (já que fornece statusline, pode ser carregado pós-UI principal).

### PERF-02: Measurement & Baseline
- O plano incluirá validação usando `nvim --startuptime` (embora a medição exata seja local e manual, a infraestrutura será posta em prática).

### PERF-03: Treesitter Parsers
- **Target File:** `lua/plugins/editor/nvim-treesitter.lua`
- **Action:** A lista `ensure_installed` será atualizada para refletir o conjunto mais amplo solicitado pelo usuário, englobando as linguagens de programação fundamentais e web standard.
- **Lista:** `"bash", "c", "html", "javascript", "jsdoc", "json", "lua", "luadoc", "luap", "markdown", "markdown_inline", "python", "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml", "java", "php", "phpdoc"`.

### PERF-04: Neo-tree On-Demand
- **Target File:** `lua/plugins/editor/neo-tree.lua`
- **Action:** Remover `lazy = false`.
- **Implementation:** Como o arquivo já possui a tabela `keys`, o `lazy.nvim` automaticamente fará o lazy-loading atrelado ao mapeamento `\` / `<leader>e`. Isso satisfaz perfeitamente a decisão do usuário de "via teclado".

## 3. Plan Requirements
The planner must:
1. Create tasks to modify `hardtime.lua`, `nvim-treesitter.lua`, and `neo-tree.lua` to remove `lazy = false` and add appropriate triggers.
2. Create tasks to add lazy-loading events (`BufReadPost`, `BufNewFile`, `VeryLazy`) to `gitsigns.lua`, `indent_line.lua`, and `mini.lua`.
3. Create tasks to update the `ensure_installed` array in `nvim-treesitter.lua`.
