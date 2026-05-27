---
spike: 002
name: gitlab-duo-suggestions
type: standard
validates: "Given o plugin oficial `gitlab.vim` instalado com NPM, when fornecemos um PAT, then sugestões de código IA (GitLab Duo) funcionam corretamente."
verdict: PARTIAL
related: []
tags: [gitlab, ai, duo]
---

# Spike 002: GitLab Duo Code Suggestions

## What This Validates
Verifica a integração do plugin oficial do GitLab para Neovim (`gitlab.vim`), focando nas sugestões de código (GitLab Duo Code Suggestions) e se o Language Server inicia corretamente.

## Research
- O plugin oficial `gitlab-org/editor-extensions/gitlab.vim` foca em AI (Code Suggestions, completion, generation).
- **Requisitos:** Neovim >= 0.9, GitLab >= 16.8, e `npm`/`node` instalados no sistema para rodar o Language Server embutido.
- **Autenticação:** Opcionalmente, exportar `GITLAB_TOKEN` (com as scopes corretas de leitura de API e Code Suggestions).

## How to Run
```bash
# Exportar o token para a sessão (caso não esteja no .bashrc)
# export GITLAB_TOKEN="seu_token_aqui"

# Testar o plugin isoladamente
nvim -u .planning/spikes/002-gitlab-duo-suggestions/init.lua
```

## What to Expect
- O plugin deve instalar suas dependências e inicializar o `gitlab-code-suggestions-language-server`.
- Ao abrir um arquivo e começar a digitar (ou usar `Omni Completion`), sugestões do GitLab Duo devem aparecer (desde que o plano do GitLab permita e o token tenha acesso).

## Investigation Trail
1. Criado `init.lua` isolado.
2. Aguardando execução do teste.

## Results
PARTIAL ⚠
O arquivo isolado de inicialização foi criado. Os testes do Language Server ocorrerão no ambiente adequado pelo usuário futuramente.
