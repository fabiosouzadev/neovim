# Phase 2: Discussion Log

## Area: Nomenclatura e Separação de LSP e DAP
- **Options presented:** Manter `init.lua` vs Renomear para plugin principal.
- **User selection:** Renomear.
- **Notes:** O usuário escolheu renomear `init.lua` para os nomes específicos dos plugins (ex: `lspconfig.lua` e `nvim-dap.lua`) para garantir aderência estrita à regra de "one-file-per-plugin".

## Area: Separação do Mason
- **Options presented:** Arquivo próprio vs Manter junto com LSP.
- **User selection:** Aceitou sugestão do agente.
- **Notes:** O agente propôs colocar o Mason num arquivo separado porque ele cruza fronteiras (LSP, DAP, linters). O usuário concordou.

## Area: Configuração do Snacks
- **Options presented:** Única tabela `opts` vs Função `config`.
- **User selection:** Único arquivo, grande `opts`.
- **Notes:** O usuário quer um único arquivo `snacks.lua` com uma estrutura declarativa via `opts = {}` massiva, centralizando dashboards, pickers, e core em um local.
