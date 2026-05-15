---
phase: 5
slug: multi-language-support
status: draft
nyquist_compliant: true
wave_0_complete: true
created: 2026-05-15
---

# Phase 5 — Multi-Language Support Plan

## Overview
Implement support for TypeScript/JavaScript, Python, and PHP following the modular pattern and integrating with `mise`.

## Wave 1: TypeScript & JavaScript

### Task 5-01-01: Create `lua/plugins/langs/typescript.lua`
- **Goal:** Comprehensive TS/JS support.
- **Action:**
  - Setup `vtsls` in LSP.
  - Setup `prettier` in `conform.nvim`.
  - Setup `eslint` in `nvim-lint`.
  - Setup `js-debug-adapter` in DAP.
  - Implement `get_mise_node` helper.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

## Wave 2: Python

### Task 5-02-01: Create `lua/plugins/langs/python.lua`
- **Goal:** Robust Python support.
- **Action:**
  - Setup `basedpyright` in LSP.
  - Setup `ruff` in `conform.nvim` and `nvim-lint`.
  - Setup `debugpy` in DAP.
  - Implement `get_mise_python` helper.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

## Wave 3: PHP

### Task 5-03-01: Create `lua/plugins/langs/php.lua`
- **Goal:** Full PHP support.
- **Action:**
  - Setup `phpactor` in LSP.
  - Setup `php-cs-fixer` in `conform.nvim`.
  - Setup `phpstan` in `nvim-lint`.
  - Setup `php-debug-adapter` in DAP.
  - Implement `get_mise_php` helper.
- **Validation:** `<automated>` `nvim --headless -c "quit"`
