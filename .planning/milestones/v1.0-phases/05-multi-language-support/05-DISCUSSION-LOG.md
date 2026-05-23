# Phase 5: Discussion Log

## Area: Escolha de Servidores LSP
- **Options presented:** `ts_ls` vs `vtsls` (TS); `intelephense` vs `phpactor` (PHP).
- **User selection:** `vtsls` e `phpactor`.
- **Notes:** O usuário optou pelas ferramentas mais modernas e open-source/feature-rich.

## Area: Organização do DAP
- **Options presented:** Centralizado em `nvim-dap.lua` vs Isolado em `langs/*.lua`.
- **User selection:** `langs/*.lua`.
- **Notes:** Manter a configuração de debug próxima à definição da linguagem facilita a manutenção e o carregamento condicional.

## Area: Gerenciamento de Versões (mise)
- **Options presented:** Global PATH vs mise.
- **User selection:** via mise.
- **Notes:** Consistência com a abordagem adotada para o Java na Fase 4.

## Area: Ferramentas de Linting/Formatting
- **Options presented:** Packs sugeridos (Prettier/ESLint, Ruff, PHP-CS-Fixer/PHPStan).
- **User selection:** "ok for all".
- **Notes:** Ferramentas padrão de mercado confirmadas.
