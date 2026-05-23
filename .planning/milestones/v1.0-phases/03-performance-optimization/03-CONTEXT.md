# Phase 3: Performance Optimization Context

> Captured: 2026-05-15

## Domain
Melhoria de performance de inicialização configurando eventos de carregamento tardio (lazy-loading) e otimização das dependências iniciais.

## Decisions

### 1. Estratégia de Carregamento do Neo-tree
- **Decision:** Carregar apenas via teclado (comandos e keymaps).
- **Context:** O Neo-tree perderá a diretiva `lazy = false` e passará a carregar sob demanda apenas quando ativado através dos atalhos (ex: `<leader>e`) ou do comando explícito (`:Neotree`). O projeto preza por não impactar a inicialização com componentes de UI que podem não ser usados imediatamente.

### 2. Lista de Parsers do Treesitter
- **Decision:** Conjunto base amplo.
- **Context:** Embora a premissa seja remover dependências desnecessárias, a suíte manterá os utilitários comuns (como `html`, `css`, `json`, `yaml`, `bash`, `markdown`, etc.) juntamente com as linguagens primárias (Java, Python, JS/TS, PHP, Lua) para suportar um workflow poliglota fluido sem precisar instalar manualmente gramáticas básicas o tempo todo.

### 3. Eventos de Lazy-loading Padrão
- **Decision:** Abordagem híbrida (Análise combinada).
- **Context:** O agente adotará ambas as estratégias conforme a finalidade do plugin:
  - `VeryLazy`: Para componentes de UI, utilitários assíncronos e ferramentas não atreladas a arquivos que precisam estar prontos pouco tempo após o startup sem bloquear a inicialização principal.
  - `BufReadPost` / `BufNewFile`: Para utilitários textuais, lints, analisadores e formatadores (ex: `todo-comments`, `hardtime`, `nvim-treesitter`) que só são relevantes quando há código em tela.

## Canonical References
- `.planning/REQUIREMENTS.md` (PERF-01..04)
- `.planning/ROADMAP.md`

## Specific Ideas
- A baseline de performance deve ser considerada na transição da Fase 3. Os plugins marcados com `lazy = false` devem ser os estritamente essenciais (geralmente colorscheme).
