---
phase: 2
slug: plugin-reorganization
status: draft
nyquist_compliant: true
wave_0_complete: true
created: 2026-05-15
---

# Phase 2 — Plugin Reorganization Plan

> Created: 2026-05-15
> Based on: `02-RESEARCH.md` and `02-VALIDATION.md`

## Overview
Reorganize plugin files to enforce the one-file-per-plugin architectural pattern, centralize Snacks configuration, and extract Mason into its own dedicated file.

## Wave 1: LSP, DAP, and Mason Restructuring

### Task 2-01-01: Rename `lsp/init.lua` and `dap/init.lua`
- **Goal:** Adhere to one-file-per-plugin rule.
- **Action:** 
  - Rename `lua/plugins/lsp/init.lua` to `lua/plugins/lsp/lspconfig.lua`.
  - Rename `lua/plugins/dap/init.lua` to `lua/plugins/dap/nvim-dap.lua`.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

### Task 2-01-02: Extract Mason to its own file
- **Goal:** Isolate Mason plugin to its own file since it manages tools across domains.
- **Action:** 
  - Create `lua/plugins/lsp/mason.lua`.
  - Move the `mason-org/mason.nvim` standalone block (the one with `cmd = "Mason"`) from `lspconfig.lua` into `mason.lua`.
  - Ensure `opts_extend = { 'ensure_installed' }` is present in the `mason.lua` spec.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

## Wave 2: Snacks Consolidation

### Task 2-02-01: Consolidate Snacks into a single file
- **Goal:** Unify all Snacks.nvim features into one file with a single `opts` table.
- **Action:**
  - Open `lua/plugins/ui/snacks.lua`.
  - Add the `dashboard` table from `snacks_dashboard.lua` into `opts`.
  - Add the `picker` and `explorer` tables from `snacks_picker.lua` into `opts`.
  - Move all `keys` bindings from `snacks_picker.lua` to `snacks.lua`.
  - Delete `lua/plugins/ui/snacks_dashboard.lua`.
  - Delete `lua/plugins/ui/snacks_picker.lua`.
- **Validation:** `<automated>` `nvim --headless -c "quit"`
