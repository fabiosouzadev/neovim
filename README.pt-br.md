# 🚀 fabiosouzadev/neovim

> **Produtividade brutal em projetos de software.**

Uma configuração de Neovim de nível profissional, modular e de alta performance, construída para o desenvolvimento moderno. Especificamente otimizada para **Java**, **TypeScript/JavaScript**, **Python** e **PHP**.

[English Version](README.md)

---

## ✨ Funcionalidades

- **🧩 Arquitetura Modular:** Sistema de plugins organizado com o padrão de um arquivo por plugin.
- **⚡ Performance Otimizada:** Componentes principais carregados via lazy-load para garantir inicialização quase instantânea.
- **🎨 UI Premium:** Equipado com `Snacks.nvim`, `Noice`, `Flash` e uma curadoria de esquemas de cores.
- **🛠️ LSP Integrado:** Suporte completo a servidores de linguagem com instalação automática de ferramentas via `Mason`.
- **🐞 Debugging Profissional:** Framework DAP centralizado com texto virtual e adaptadores específicos por linguagem.
- **📦 Gerenciamento de Versões:** Resolução dinâmica de runtimes via `mise` para todas as linguagens suportadas.

---

## ⌨️ Referência de Atalhos

### 🎯 Core & Geral
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<Esc>` | Limpar Busca | Limpar destaques de busca no modo normal |
| `<C-s>` | Salvar | Salvar buffer atual (Normal/Insert/Visual) |
| `<leader>l` | Lazy | Abrir gerenciador de plugins Lazy |
| `<leader>bD` | Fechar Buffer | Deletar buffer atual e fechar janela |
| `<Esc><Esc>` | Sair Terminal | Voltar para o modo normal a partir do terminal |
| `n` / `N` | Busca Nav | Próximo/Anterior resultado da busca (centralizado) |
| `<` / `>` | Indentação | Melhor indentação visual (mantém seleção) |

### 🧭 Navegação & Janelas
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<C-h/j/k/l>` | Foco Janela | Mover foco para janela esquerda/baixo/cima/direita |
| `<C-S-h/j/k/l>` | Mover Janela | Mover janela atual para esquerda/baixo/cima/direita |
| `s` / `S` | Flash | Salto otimizado / Seleção Treesitter |
| `[q` / `]q` | Quickfix | Navegar para item anterior/próximo da quickfix |
| `[t` / `]t` | Todo | Navegar para comentário TODO anterior/próximo |
| `\\` | Neo-tree | Revelar arquivo atual no explorador |

### 🔍 Busca (Snacks Picker)
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader><space>` | Smart Find | Busca inteligente de arquivos no workspace |
| `<leader>ff` | Find Files | Buscar arquivos por nome |
| `<leader>fg` | Live Grep | Buscar texto em todo o workspace |
| `<leader>fr` | Recentes | Abrir histórico de arquivos recentes |
| `<leader>fp` | Projetos | Listar e alternar entre projetos |
| `<leader>sb` | Buffer Lines | Buscar linhas no buffer atual |
| `<leader>sd` | Diagnostics | Listar diagnósticos do workspace |
| `<leader>su` | Undo | Histórico visual de desfazer (Undo) |
| `<leader>sk` | Keymaps | Busca interativa por todos os atalhos |
| `<leader>uC` | Temas | Listar e alternar esquemas de cores |

### 🛠️ LSP & Qualidade de Código
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `gd` | Definição | Pular para a definição |
| `gr` | Referências | Listar todas as referências do símbolo |
| `gi` | Implementação | Pular para a implementação |
| `gy` | Type Def | Pular para a definição de tipo |
| `K` | Hover | Mostrar documentação/assinatura sob o cursor |
| `grn` | Renomear | Renomear símbolo em todo o workspace |
| `gra` | Code Action | Mostrar ações de código disponíveis |
| `<leader>cf` | Formatar | Formatar buffer (Conform) |
| `[d` / `]d` | Diagnósticos | Ir para diagnóstico anterior/próximo |
| `[e` / `]e` | Erros | Ir para erro anterior/próximo |

### 🐙 Git
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `]c` / `[c` | Mudança | Pular para próxima/anterior alteração (hunk) |
| `<leader>gs` | Status | Abrir seletor de status do Git |
| `<leader>gl` | Log | Abrir seletor de log do Git |
| `<leader>ghp` | Preview | Pré-visualizar alterações do hunk atual |
| `<leader>ghs` | Stage | Estagiar (stage) hunk atual |
| `<leader>ghr` | Reset | Resetar hunk atual |
| `<leader>ghd` | Diff | Diff do arquivo atual contra o index |

### 🐞 Debugging (DAP)
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<F5>` | Start/Cont | Iniciar ou continuar sessão de debug |
| `<F1>` | Step Into | Entrar na chamada de função |
| `<F2>` | Step Over | Pular linha atual |
| `<F3>` | Step Out | Sair da função atual |
| `<leader>b` | Breakpoint | Alternar ponto de parada na linha |
| `<leader>B` | Cond Break | Alternar ponto de parada condicional |
| `<F7>` | UI Toggle | Alternar interface visual do DAP |
| `<leader>de` | Eval | Avaliar expressão sob o cursor |

### ☕ Específico para Java
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>co` | Organizar | Organizar imports (JDTLS) |
| `<leader>tc` | Test Class | Executar todos os testes na classe atual |
| `<leader>tm` | Test Method | Executar teste mais próximo |
| `<leader>cxv` | Extrair Var | Extrair para variável |
| `<leader>cgs` | Super | Ir para implementação pai (super) |

### 🧰 Ferramentas Especializadas
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>xx` | Trouble | Alternar lista de diagnósticos |
| `<leader>sr" | Grug-far | Busca e substituição global |
| `<leader>ha` | Harpoon | Adicionar arquivo ao Harpoon |
| `<leader>he` | Harpoon UI | Alternar menu rápido do Harpoon |
| `<leader>st` | Todo List | Listar todos os TODOs no workspace |

---

## 🌐 Matriz de Suporte a Linguagens

| Linguagem | LSP | Formatador | Linter | Debugger |
|-----------|-----|------------|--------|----------|
| **Java** | JDTLS | google-java-format | Checkstyle | java-debug |
| **TS/JS** | vtsls | Prettier | ESLint | js-debug |
| **Python** | basedpyright | Ruff | Ruff | debugpy |
| **PHP** | phpactor | php-cs-fixer | PHPStan | Xdebug |

---

## 🏗️ Arquitetura

A configuração segue um layout modular para máxima manutenibilidade:

```
.
├── init.lua              # Ponto de entrada
└── lua/
    ├── config/           # Configuração core
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins/          # Especificações de plugins
        ├── coding/       # Autocomplete, Snippets, Format
        ├── dap/          # Framework de Debugging
        ├── editor/       # Navegação, Git, Treesitter
        ├── langs/        # Configurações por linguagem
        ├── lsp/          # Configuração core de LSP
        └── ui/           # Tema, Statusline, Dashboard
```

---

## 🚀 Instalação

1. **Requisitos:**
   - Neovim >= 0.10.0
   - `mise` (para gerenciamento de runtimes)
   - `git`, `ripgrep`, `fd`, `fzf`
2. **Setup:**
   ```bash
   git clone https://github.com/fabiosouzadev/neovim.git ~/.config/nvim
   nvim
   ```

---

> [!TIP]
> Use `<leader>sk` para buscar interativamente por todos os atalhos disponíveis!
