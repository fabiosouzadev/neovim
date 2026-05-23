# Phase 1: Bug Fixes & Code Cleanup Discussion Log

> Logged: 2026-05-15

## Area: Java Runtime Path Resolution
- **Options presented:** Dynamically call `mise` on startup vs using environment variables?
- **User selected:** Env vars
- **Notes:** User prefers relying on environment variables for faster startup.

## Area: Nerd Font Configuration
- **Options presented:** Set to always `true` vs keep it configurable?
- **User selected:** True
- **Notes:** Simple approach; assumes Nerd Fonts are available.

## Area: Duplicate Keymap Handling
- **Options presented:** Delete core keymaps vs keep as fallback?
- **User selected:** Fallback
- **Notes:** Protects core navigation if plugins are ever removed.

## Area: Project Naming Prefix
- **Options presented:** What to replace `lazyvim_` prefixes with?
- **User selected:** custom_
- **Notes:** Simple generic prefix instead of project-specific or nvim-specific.
