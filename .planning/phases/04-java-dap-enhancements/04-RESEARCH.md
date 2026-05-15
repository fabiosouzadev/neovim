# Phase 4: Java & DAP Enhancements - Research

## 1. Domain & Scope
Melhoria do ecossistema Java (LSP, DAP, Formatação, Linting, Spring Boot) e centralização de ferramentas de Debug.

## 2. Findings & Implementation Approach

### JAVA-01 & JAVA-02: JDTLS & mise
- **Target File:** `lua/plugins/langs/java.lua`
- **Action:** 
  - Refatorar a tabela `runtimes` para usar `mise where java@11`, `mise where java@21`, etc., de forma dinâmica.
  - Ativar as capabilities do `blink.cmp` explicitamente no JDTLS.
  - Corrigir fallbacks de caminhos para não depender de caminhos fixos no home do usuário.

### JAVA-03: Spring Boot Support
- **Target File:** `lua/plugins/langs/java.lua`
- **Action:**
  - Adicionar `spring-boot-ls` ao Mason.
  - Configurar `sts_ls` (Spring Boot Language Server) na lista de servidores do `lspconfig`.
  - Integrar o suporte de análise de projeto Spring Boot no JDTLS.

### JAVA-04: Quality (Formatting & Linting)
- **Target Files:** 
  - `lua/plugins/coding/conform.lua` (Formatação)
  - `lua/plugins/langs/java.lua` (Linting/Mason)
- **Action:**
  - Ativar `google-java-format` no `conform.lua`.
  - Adicionar `checkstyle` ao Mason no `java.lua`.
  - Configurar `nvim-lint` para usar `checkstyle` se um arquivo de config for encontrado (ou usar default).

### DAP-01 & DAP-02: DAP Enhancements
- **Target File:** `lua/plugins/dap/nvim-dap.lua`
- **Action:**
  - Adicionar `theHamsta/nvim-dap-virtual-text` como dependência e configurar.
  - Adicionar `jay-babu/mason-nvim-dap.nvim` para gerenciar a instalação de adaptadores automaticamente.

## 3. Plan Requirements
The planner must:
1. Atualizar o `java.lua` com as novas configurações de runtimes e Spring Boot.
2. Centralizar extensões do DAP em `nvim-dap.lua`.
3. Ativar formatação Java em `conform.lua`.
