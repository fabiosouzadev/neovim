# Phase 3: Performance Optimization Plan

> Created: 2026-05-15
> Based on: `03-RESEARCH.md` and `03-VALIDATION.md`

## Overview
Optimize Neovim startup time by aggressively applying lazy-loading events to UI and buffer-specific plugins, and refining the Treesitter parser dependencies.

## Wave 1: Lazy-Loading and Neo-tree

### Task 3-01-01: Remove `lazy = false` from non-essential plugins
- **Goal:** Stop eager loading.
- **Action:**
  - `lua/plugins/editor/hardtime.lua`: Remove `lazy = false` and add `event = { "BufReadPost", "BufNewFile", "BufWritePre" }`.
  - `lua/plugins/editor/nvim-treesitter.lua`: Remove `lazy = false` and add `event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" }`.
  - `lua/plugins/editor/neo-tree.lua`: Remove `lazy = false`. It will load on its `keys`.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

### Task 3-01-02: Add events to implicitly eager plugins
- **Goal:** Ensure plugins that lack events don't load immediately.
- **Action:**
  - `lua/plugins/editor/gitsigns.lua`: Add `event = { "BufReadPost", "BufNewFile", "BufWritePre" }` to the `lewis6991/gitsigns.nvim` spec.
  - `lua/plugins/coding/indent_line.lua`: Add `event = { "BufReadPost", "BufNewFile", "BufWritePre" }` to the `lukas-reineke/indent-blankline.nvim` spec.
  - `lua/plugins/editor/mini.lua`: Add `event = "VeryLazy"` to the `echasnovski/mini.nvim` spec.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

## Wave 2: Treesitter Parsers

### Task 3-02-01: Update `ensure_installed` array
- **Goal:** Solidify the "broad but used" parser set.
- **Action:**
  - Modify `lua/plugins/editor/nvim-treesitter.lua` to ensure the `ensure_installed` table contains exactly: `"bash", "c", "html", "javascript", "jsdoc", "json", "lua", "luadoc", "luap", "markdown", "markdown_inline", "python", "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml", "java", "php", "phpdoc"`.
- **Validation:** `<automated>` `nvim --headless -c "quit"`
