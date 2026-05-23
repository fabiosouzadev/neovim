# Phase 2: Plugin Reorganization - Research

## 1. Domain & Scope
The goal of this phase is to reorganize the plugin structure to enforce the one-file-per-plugin pattern, centralize Snacks.nvim configuration, and properly separate Mason.nvim.

## 2. Findings & Implementation Approach

### REORG-01: Snacks Consolidation
- **Target Files:** 
  - `lua/plugins/ui/snacks.lua`
  - `lua/plugins/ui/snacks_dashboard.lua`
  - `lua/plugins/ui/snacks_picker.lua`
- **Action:** Merge all three into `snacks.lua`.
- **Implementation:** Create a single `opts = { ... }` table containing the `dashboard`, `picker`, `explorer`, and the core components (`indent`, `input`, `notifier`, etc.). Move all keymaps from `snacks_picker.lua` to the `keys` table in the unified `snacks.lua`. Delete `snacks_dashboard.lua` and `snacks_picker.lua`.

### REORG-02: `init.lua` Naming Convention
- **Target Files:**
  - `lua/plugins/lsp/init.lua` -> `lua/plugins/lsp/lspconfig.lua`
  - `lua/plugins/dap/init.lua` -> `lua/plugins/dap/nvim-dap.lua`
- **Action:** Rename files to match the core plugin they configure.
- **Implementation:** Move and commit the renamed files.

### REORG-03: Mason Separation & `opts_extend`
- **Target File:** `lua/plugins/lsp/init.lua` (current location of Mason)
- **Action:** Extract Mason into its own file `lua/plugins/lsp/mason.lua`.
- **Implementation:** 
  - Take the `mason-org/mason.nvim` spec at the bottom of `lsp/init.lua` and move it to `mason.lua`.
  - Ensure `opts_extend = { "ensure_installed" }` is kept in `mason.lua` so that other language files (like `java.lua`) can safely append to `ensure_installed`.
  - Also move `mason-lspconfig.nvim` to `mason.lua` or leave it as a dependency of `nvim-lspconfig`. We will keep `mason-lspconfig.nvim` as a dependency of `nvim-lspconfig` in `lspconfig.lua` (since it bridges the two), but `mason.nvim` itself will be standalone.

### REORG-04: Plugin Category Review
- The current categories (`ui`, `editor`, `coding`, `ai`, `dap`, `lsp`, `langs`) are sound. The only violations of the one-file-per-plugin rule were the Snacks files and the `init.lua` files containing multiple specs (like Mason inside LSP). By applying the above changes, we will be compliant.

## 3. Plan Requirements
The planner must:
1. Create tasks to rename the `init.lua` files.
2. Create tasks to extract `mason.lua`.
3. Create tasks to unify the `snacks.lua` configurations and delete the redundant ones.
