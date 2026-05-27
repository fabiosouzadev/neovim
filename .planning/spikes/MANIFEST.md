# Spike Manifest

## Idea
Adicionar suporte e integração ao GitLab no Neovim, avaliando tanto a gestão de projetos (MRs, Issues) quanto a assistência por Inteligência Artificial (GitLab Duo).

## Requirements
- Deve ser possível configurar via `lazy.nvim`
- Deve suportar autenticação via Personal Access Token (PAT)

## Spikes

| # | Name | Type | Validates | Verdict | Tags |
|---|------|------|-----------|---------|------|
| 001 | gitlab-mr-management | standard | Given `gitlab.nvim` instalado, when fornecemos um PAT, then MRs podem ser revisados no Neovim | PARTIAL | gitlab, mr, go |
| 002 | gitlab-duo-suggestions | standard | Given `gitlab.vim` instalado, when fornecemos um PAT, then sugestões de código IA funcionam | PARTIAL | gitlab, ai, duo |
