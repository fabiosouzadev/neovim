# Phase 6: Documentation Context

> Captured: 2026-05-15

## Domain
Consolidação da documentação técnica e de usuário para o projeto `fabiosouzadev/neovim`.

## Decisions

### 1. Estratégia de Idioma
- **Primário:** Inglês (`README.md`).
- **Secundário:** Português (`README.pt-br.md`).
- Ambos devem conter o mesmo nível de detalhe e manter a paridade de informações.

### 2. Estrutura e Formato
- **Modelo:** Consolidado. Toda a informação (Tour, Keymaps, Suporte a Linguagens, Arquitetura) deve residir nos arquivos README principais.
- **Estética:** Rica e premium. Uso intensivo de emojis, tabelas formatadas, blocos de alerta (GitHub alerts) e seções bem definidas.

### 3. Conteúdo Obrigatório
- **Feature Tour:** Destaque para Snacks, Neo-tree, Telescope e LSP.
- **Keymaps Reference:** Tabela completa de atalhos (Core + Plugins).
- **Language Matrix:** Tabela de suporte (LSP, DAP, Format, Lint) para Java, TS/JS, Python e PHP.
- **Architecture Overview:** Breve explicação da estrutura modular (`lua/plugins/langs/`, etc.).

## Canonical References
- `.planning/REQUIREMENTS.md` (DOCS-01..04)
- `.planning/ROADMAP.md`
