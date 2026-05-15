# Stack Research: Neovim Multi-Language Configuration 2025/2026

> Researched: 2026-05-15

## Recommended LSP Servers

| Language | LSP Server | Why | Confidence |
|----------|-----------|-----|------------|
| **Lua** | `lua_ls` | ✅ Already in use. Industry standard for Neovim config development | High |
| **Java** | `jdtls` (via nvim-jdtls) | ✅ Already in use. Only viable Java LSP for Neovim | High |
| **TypeScript/JS** | `ts_ls` or `vtsls` | `ts_ls` is the standard. `vtsls` is gaining traction for advanced features (inlay hints, organize imports). Consider `vtsls` for better TS experience | High |
| **Python** | `basedpyright` or `pyright` | `basedpyright` is a community fork with additional features. `pyright` is the Microsoft standard. Both excellent | High |
| **PHP** | `intelephense` | Best-in-class PHP LSP. Premium features require license but free tier is excellent | High |
| **XML** | `lemminx` | ✅ Already in use. Standard for XML/Maven POM editing | High |

### What NOT to use
- `tsserver` (old name) — replaced by `ts_ls`
- `pylsp` — slower than pyright, less features
- `phpactor` — less mature than intelephense
- `null-ls` — archived, replaced by conform.nvim + nvim-lint

## Recommended DAP Adapters

| Language | Adapter | Installation | Notes |
|----------|---------|-------------|-------|
| **Java** | `java-debug-adapter` + `java-test` | ✅ Already via Mason | Integrated with nvim-jdtls |
| **TypeScript/JS** | `js-debug-adapter` | Mason | Microsoft's official adapter, supports Chrome DevTools Protocol |
| **Python** | `debugpy` | Mason | Use with `nvim-dap-python` plugin for simplified setup |
| **PHP** | `php-debug-adapter` | Mason | Requires Xdebug extension in PHP runtime |

### DAP Ecosystem Additions
- **nvim-dap-virtual-text** — Display variable values inline (not currently installed, highly recommended)
- **nvim-dap-python** — Simplified Python DAP config with test debugging support
- **mason-nvim-dap.nvim** — Auto-install and configure DAP adapters (currently commented out)

## Recommended Formatters

| Language | Formatter | Why | Via |
|----------|----------|-----|-----|
| **Lua** | `stylua` | ✅ Already in use | conform.nvim |
| **Shell** | `shfmt` | ✅ Already in use | conform.nvim |
| **TypeScript/JS** | `prettier` or `biome` | Prettier is standard. **Biome** is 10-100x faster and handles both formatting AND linting | conform.nvim |
| **Python** | `ruff_format` | Ruff replaces black+isort in a single blazing-fast tool | conform.nvim |
| **PHP** | `php-cs-fixer` or `pint` | php-cs-fixer is standard. Laravel projects use pint | conform.nvim |
| **Java** | `google-java-format` | Optional — JDTLS can format via LSP fallback | conform.nvim |

## Recommended Linters

| Language | Linter | Why | Via |
|----------|--------|-----|-----|
| **Markdown** | `markdownlint` | ✅ Already in use | nvim-lint |
| **TypeScript/JS** | `eslint` or `biome` | eslint is standard. Biome is unified formatter+linter | nvim-lint |
| **Python** | `ruff` | Replaces flake8+pylint+isort, extremely fast | nvim-lint (or ruff LSP) |
| **PHP** | `phpstan` | Industry standard PHP static analysis | nvim-lint |

## Key Technology Decisions

### Ruff for Python (Strong Recommend)
- Replaces: black, isort, flake8, pylint, pycodestyle
- Written in Rust, 10-100x faster than alternatives
- Can be used as both LSP (`ruff-lsp`) AND formatter/linter
- **Decision**: Use Ruff as formatter + linter for Python. Use pyright/basedpyright as LSP for type checking

### Biome vs Prettier+ESLint for JS/TS
- **Biome**: Single tool for formatting + linting, ~35x faster than Prettier
- **Prettier+ESLint**: Industry standard, more ecosystem support
- **Decision**: Start with Prettier+ESLint (broader compatibility), document Biome as alternative

### Mason ensure_installed Strategy
All tools should be declared in Mason's `ensure_installed` to auto-install on first launch.
