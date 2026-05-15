# Research Summary: Neovim Config Professionalization

> Synthesized: 2026-05-15

## Key Findings

### Stack
- **LSP**: ts_ls (TypeScript), pyright/basedpyright (Python), intelephense (PHP) — all mature, well-supported
- **DAP**: js-debug-adapter (JS/TS), debugpy (Python), php-debug-adapter (PHP) — all available via Mason
- **Formatters**: Ruff (Python — replaces black+isort), Prettier (JS/TS), php-cs-fixer (PHP) — all via conform.nvim
- **Linters**: Ruff (Python — replaces flake8+pylint), ESLint (JS/TS), PHPStan (PHP) — all via nvim-lint
- **Trend**: Unified tools (Ruff, Biome) replacing multiple single-purpose tools

### Table Stakes
- Per-language LSP+format+lint+treesitter
- Bilingual documentation with keybind reference
- Clean, consolidated plugin architecture
- Sub-100ms startup

### Watch Out For
1. **Breaking changes during refactor** — test after each structural change, don't batch
2. **Plugin conflicts when merging files** — use `opts_extend`, test incrementally
3. **Over-eager lazy loading** — some plugins need early initialization
4. **DAP complexity** — use helper plugins per language, support launch.json
5. **Documentation drift** — keybind tables must match actual config

## Recommended Execution Order

Based on dependencies and risk analysis:

1. **Bug fixes first** — Low risk, high impact, no structural changes needed
2. **Plugin consolidation** — Structural refactor, test thoroughly
3. **Performance optimization** — Depends on clean structure
4. **Language support** — Depends on clean architecture and Mason infrastructure
5. **Documentation** — Last, when config is stable

## Technology Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Python LSP | basedpyright | Community fork with extra features, compatible with pyright |
| Python tooling | Ruff | Replaces 5+ tools in one, 10-100x faster |
| TypeScript LSP | ts_ls | Standard, widely supported |
| TypeScript formatting | prettier | Industry standard, broadest compatibility |
| TypeScript linting | eslint | Industry standard |
| PHP LSP | intelephense | Best-in-class, no viable alternative |
| PHP formatting | php-cs-fixer | Industry standard |
| PHP linting | phpstan | Industry standard static analysis |
| DAP virtual text | Add nvim-dap-virtual-text | High-value, low-effort improvement |
| Python DAP helper | Add nvim-dap-python | Simplifies debugpy configuration |
| Config consolidation | Flat files over deep directories | Fewer files, easier to navigate |
