# fabiosouzadev/neovim — GSD Project Guide

## Project Context

Personal Neovim configuration built from scratch with lazy.nvim. Focused on maximum productivity for Java, TypeScript, Python, and PHP development.

**Core Value:** Brutal productivity in software projects.

## Current State

See `.planning/STATE.md` for current phase and progress.
See `.planning/ROADMAP.md` for full roadmap (6 phases).
See `.planning/REQUIREMENTS.md` for all 43 requirements with REQ-IDs.

## Architecture

- **Entry:** `init.lua` → options → keymaps → autocmds → lazy
- **Plugins:** `lua/plugins/` organized by category (ui, coding, editor, lsp, dap, langs, ai)
- **Pattern:** One file per plugin, one file per language in `langs/`
- **Plugin Manager:** lazy.nvim with directory auto-import

## Conventions

- Lua only, 2-space indent, single quotes (StyLua enforced)
- Autocommand groups prefixed `fabiosouzadev_vim_`
- Leader: `<Space>`, Local Leader: `\`
- All keymaps include `desc` for which-key

## Key Files

| File | Purpose |
|------|---------|
| `.planning/PROJECT.md` | Project context and requirements |
| `.planning/ROADMAP.md` | 6-phase execution plan |
| `.planning/STATE.md` | Current progress |
| `.planning/REQUIREMENTS.md` | 43 checkable requirements |
| `.planning/codebase/CONCERNS.md` | 12 identified issues |
| `.planning/research/SUMMARY.md` | Technology research findings |

## Workflow

This project uses the GSD workflow. Run `/gsd-progress` to check status.
Next step: `/gsd-discuss-phase 1` or `/gsd-plan-phase 1`.
