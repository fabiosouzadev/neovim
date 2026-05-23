---
phase: 4
slug: java-dap-enhancements
status: draft
nyquist_compliant: true
wave_0_complete: true
created: 2026-05-15
---

# Phase 4 — Java & DAP Enhancements Plan

## Overview
Refactor Java configuration for dynamic runtime management, add Spring Boot support, and enhance the DAP experience with virtual text and automatic adapter installation.

## Wave 1: Java Runtime & Capabilities

### Task 4-01-01: Refactor `java.lua` for dynamic runtimes
- **Goal:** Remove hardcoded paths and use `mise where`.
- **Action:**
  - Update `runtimes` in `jdtls` opts to resolve paths using `mise where java@11`, `21`, etc.
  - Ensure `capabilities` for `blink.cmp` are correctly passed to `jdtls.start_or_attach`.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

## Wave 2: Spring Boot & Quality

### Task 4-02-01: Add Spring Boot support and Formatters
- **Goal:** Integrate `sts_ls` and `google-java-format`.
- **Action:**
  - Add `spring-boot-ls` and `google-java-format` to Mason in `java.lua`.
  - Configure `sts_ls` in `lspconfig` (via `java.lua`).
  - Uncomment/Enable `google-java-format` in `conform.lua`.
- **Validation:** `<automated>` `nvim --headless -c "quit"`

## Wave 3: DAP Enhancements

### Task 4-03-01: Enhance DAP with virtual text and Mason integration
- **Goal:** Improve debugging UX.
- **Action:**
  - Add `nvim-dap-virtual-text` as a dependency in `nvim-dap.lua`.
  - Add `mason-nvim-dap.nvim` to `nvim-dap.lua` and configure automatic installation.
- **Validation:** `<automated>` `nvim --headless -c "quit"`
