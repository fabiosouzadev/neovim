# Phase 4: Java & DAP Enhancements Context

> Captured: 2026-05-15

## Domain
Suporte avançado a Java (LSP, DAP, Formatação, Linting, Spring Boot) e melhorias na experiência de Debugging.

## Decisions

### 1. Escopo de Java: Spring Boot e Qualidade de Código
- **Decision:** Implementar suporte a Spring Boot E Formatação/Linting.
- **Context:** O conflito entre Roadmap e Requirements foi resolvido incluindo ambos. O suporte a Spring Boot será integrado ao LSP (provavelmente via `spring-boot-ls`). A formatação e linting serão tratados com `google-java-format`.

### 2. Gestão de Runtimes Java (mise)
- **Decision:** Opção A (Lista fixa de versões, caminhos dinâmicos do mise).
- **Context:** Manteremos a lista de runtimes declarada (11, 21, 26), mas todos os caminhos serão resolvidos em tempo de execução via `mise where`, eliminando fallbacks manuais para pastas fixas no home.

### 3. Ferramentas de Qualidade
- **Decision:** `google-java-format` via `conform.nvim`.
- **Context:** O usuário prefere o padrão do Google via `conform.nvim` em vez do formatador interno do Eclipse/JDTLS. Não há um arquivo de configuração de checkstyle customizado no momento.

### 4. Organização do DAP
- **Decision:** Agrupados no arquivo principal (`lua/plugins/dap/nvim-dap.lua`).
- **Context:** Apesar da regra de "um arquivo por plugin", extensões pequenas e integrações diretas do DAP (como `virtual-text` e `mason-nvim-dap`) serão centralizadas no arquivo do plugin principal para manter a coesão da configuração de debug.

## Canonical References
- `.planning/REQUIREMENTS.md` (JAVA-01..04, DAP-01..02)
- `.planning/ROADMAP.md`

## Specific Ideas
- Ativar `blink.cmp` capabilities no JDTLS para melhorar o autocomplete.
- Integrar `nvim-dap-virtual-text` para visualização de variáveis inline durante o debug.
- Garantir que o `mason-nvim-dap` instale automaticamente os adaptadores necessários.
