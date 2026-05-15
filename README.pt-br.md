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

### 🎯 Geral
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>e` | Explorer | Alternar explorador de arquivos (Snacks) |
| `<leader><space>` | Smart Find | Busca inteligente de arquivos (Snacks) |
| `<leader>ff` | Find Files | Buscar arquivos por nome |
| `<leader>fg` | Live Grep | Buscar texto no workspace |
| `<C-s>` | Salvar | Salvar buffer atual |
| `<leader>l` | Lazy | Abrir gerenciador de plugins Lazy |

### 🔍 Busca & Navegação
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `gd` | Definição | Ir para definição (Snacks) |
| `gr` | Referências | Listar todas as referências (Snacks) |
| `gy` | Type Def | Ir para definição de tipo |
| `K` | Hover | Mostrar documentação sob o cursor |
| `<leader>sb` | Buffer Lines | Buscar linhas no buffer atual |
| `<leader>sw` | Grep Word | Buscar palavra sob o cursor |

### 🛠️ LSP & Qualidade
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `grn` | Renomear | Renomear símbolo sob o cursor |
| `gra` | Code Action | Mostrar ações de código disponíveis |
| `<leader>cf` | Formatar | Formatar buffer atual (Conform) |
| `[d` / `]d` | Prev/Next | Navegar pelos diagnósticos |

### 🐞 Debugging (DAP)
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<F5>` | Continuar | Iniciar ou continuar execução |
| `<F1>` | Step Into | Entrar na função |
| `<F2>` | Step Over | Pular linha |
| `<leader>b` | Breakpoint | Alternar ponto de parada |
| `<F7>` | UI Toggle | Alternar interface do DAP |

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
