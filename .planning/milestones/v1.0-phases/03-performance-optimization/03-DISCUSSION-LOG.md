# Phase 3: Discussion Log

## Area: Estratégia de Carregamento do Neo-tree
- **Options presented:** Somente comandos/teclas vs Automático.
- **User selection:** via teclado
- **Notes:** O usuário confirmou que o carregamento do Neo-tree deve ocorrer de forma explícita através do uso do atalho mapeado (`<leader>e`) ou comandos. O `lazy = false` será removido.

## Area: Lista de Parsers do Treesitter
- **Options presented:** Estrita (Apenas primárias) vs Ampla (Utilitários incluídos).
- **User selection:** Mais amplo
- **Notes:** O usuário escolheu manter uma base ampla para os parsers do Treesitter (incluindo gramáticas comuns como json, html, bash, etc.) além das focadas no roadmap (Java, Python, JS, PHP).

## Area: Eventos de Lazy-loading Padrão
- **Options presented:** `VeryLazy` vs `BufReadPost` / `BufNewFile`.
- **User selection:** As Duas estrategias analise e me traga
- **Notes:** O usuário pediu para que ambas as estratégias sejam aplicadas combinadas através da análise do agente durante a implementação. Componentes gerais irão para `VeryLazy` e analisadores sintáticos e formatadores irão para os eventos de Buffer.
