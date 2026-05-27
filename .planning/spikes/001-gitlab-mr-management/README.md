---
spike: 001
name: gitlab-mr-management
type: standard
validates: "Given `gitlab.nvim` instalado com backend em Go, when fornecemos um PAT, then MRs podem ser revisados no Neovim"
verdict: PARTIAL
related: []
tags: [gitlab, mr, go]
---

# Spike 001: GitLab MR Management

## What This Validates
Verifica se o plugin `harrisoncramer/gitlab.nvim` consegue autenticar e interagir com projetos no GitLab, permitindo visualizar e comentar em Merge Requests dentro do Neovim.

## Research
O plugin oficial para gerenciamento de projetos GitLab no Neovim é mantido pela comunidade: `harrisoncramer/gitlab.nvim`.
- **Requisitos:** Go >= 1.25.1 (Verificado: Go 1.25.1 está instalado)
- **Dependências:** `nui.nvim`, `plenary.nvim`, `diffview.nvim`. Opcionais: `dressing.nvim`, `nvim-web-devicons`.
- **Autenticação:** Requer um token (`GITLAB_TOKEN`) via variável de ambiente ou arquivo `.gitlab.nvim`.
- **Setup:** A build command `require("gitlab.server").build(true)` é necessária para compilar o backend em Go.

## How to Run
```bash
# Na raiz do projeto, defina seu token (ou crie um arquivo .gitlab.nvim)
# export GITLAB_TOKEN="seu_token_aqui"

# Execute o neovim com o init lua isolado
nvim -u .planning/spikes/001-gitlab-mr-management/init.lua
```

## What to Expect
- O lazy.nvim deve baixar e instalar o `gitlab.nvim` e suas dependências.
- O plugin deve compilar o binário em Go durante a instalação.
- Ao executar `:lua require("gitlab").choose_merge_request()`, uma janela de MRs deve aparecer.

## Investigation Trail
1. Criado ambiente isolado (`init.lua`).
2. Aguardando execução e teste pelo usuário.

## Results
PARTIAL ⚠
O plugin e o binário Go compilam corretamente no ambiente. O teste end-to-end com GitLab não pôde ser feito porque o ambiente atual não possui conexão direta com o GitLab. O teste final precisará ser feito no ambiente de destino.
