# Phase 4: Discussion Log

## Area: Spring Boot vs Formatters
- **Options presented:** Priorizar Spring Boot vs Priorizar Formatters.
- **User selection:** Spring boot, mas formatacao/ linting com google-java-format
- **Notes:** O usuário optou por incluir ambos os conjuntos de funcionalidades nesta fase.

## Area: Gestão de Runtimes Java (mise)
- **Options presented:** Opção A (Lista fixa, caminhos dinâmicos) vs Opção B (Auto-detecção total).
- **User selection:** Opção A
- **Notes:** Manter a lista de versões explícitas (11, 21, etc) facilita o controle de quais runtimes o LSP conhece, mas os caminhos devem ser buscados dinamicamente no mise.

## Area: Formatadores e Linters Java
- **Options presented:** JDTLS Formatter vs google-java-format via conform.
- **User selection:** google-java-format via conform.nvim
- **Notes:** O usuário confirmou a preferência pelo `google-java-format`.

## Area: Organização do DAP
- **Options presented:** Arquivos separados vs Agrupados no DAP principal.
- **User selection:** Agrupados no dap principal
- **Notes:** Preferência por centralizar extensões do DAP no arquivo `lua/plugins/dap/nvim-dap.lua`.
