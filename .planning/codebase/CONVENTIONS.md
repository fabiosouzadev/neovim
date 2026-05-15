# Code Conventions

> Last mapped: 2026-05-15

## Lua Style

### Formatting (StyLua)

Configured in `stylua.toml`:

```toml
column_width = 160
line_endings = "Unix"
indent_type = "Spaces"
indent_width = 2
quote_style = "AutoPreferSingle"
call_parentheses = "None"
collapse_simple_statement = "Always"

[sort_requires]
enabled = true
```

**Key conventions:**
- **2-space indentation** (not tabs)
- **Single quotes preferred** (auto-detect)
- **No call parentheses** for single-arg calls: `require 'foo'` instead of `require('foo')`
- **Collapsed simple statements**: `if cond then return end` on one line
- **Wide column width** (160) — avoids excessive wrapping
- **Unix line endings**

### Linting (Selene)

Configured in `selene.toml`:

```toml
std="vim"

[lints]
mixed_table="allow"
```

Uses vim globals standard. Allows mixed tables (common in Neovim plugin specs).

### EditorConfig

```ini
root = true
[*]
insert_final_newline = true
indent_style = space
indent_size = 2
charset = utf-8
```

## Plugin Spec Patterns

### Standard Plugin Return Pattern
Every plugin file returns a lazy.nvim spec table:

```lua
-- Single plugin
return {
  "author/plugin.nvim",
  opts = {},
}

-- Multiple plugins
return {
  { "author/plugin-a.nvim", opts = {} },
  { "author/plugin-b.nvim", opts = {} },
}
```

### Lazy Loading Strategies Used

| Strategy      | Example                                         |
| ------------- | ----------------------------------------------- |
| `event`        | `InsertEnter`, `BufWritePre`, `VimEnter`, `VeryLazy` |
| `cmd`          | `Copilot`, `Mason`, `GrugFar`, `ConformInfo`    |
| `ft`           | `lua` (lazydev), `java` (jdtls)                 |
| `keys`         | Most editor plugins                              |
| `lazy = false` | treesitter, neo-tree, hardtime, snacks_picker   |

### Type Annotations
Plugin specs frequently use LuaDoc/EmmyLua annotations:

```lua
---@module 'blink.cmp'
---@type blink.cmp.Config
opts = { ... }

---@module 'lazy'
---@type LazySpec
return { ... }
```

### Diagnostic Suppression
Common pattern to suppress noisy LSP diagnostics:

```lua
---@diagnostic disable-next-line: missing-fields
opts = { ... }
---@diagnostic disable-line: missing-fields
```

## Keymap Conventions

### Core Keymaps (`config/keymaps.lua`)
- Use `vim.keymap.set()` directly
- Include `desc` for which-key discoverability
- Support multiple modes when needed: `{ "i", "x", "n", "s" }`

### Plugin Keymaps
- Defined in `keys` table within lazy.nvim spec
- Lazy-load triggered by keymap press
- Use `<leader>` prefix consistently

### LSP Keymaps (`lsp/init.lua`)
- Defined in `LspAttach` autocmd callback
- Buffer-local via helper function `map(keys, func, desc, mode)`
- Prefixed with `gr` (LSP standard): `grn`, `gra`, `grr`, `grd`, `gri`, `grt`

### Java Keymaps (`langs/java.lua`)
- Registered via `which-key.add()` in `LspAttach` callback
- Extract operations under `<leader>cx`
- Test operations under `<leader>t`

## Autocommand Conventions

### Group Naming
All autocommand groups prefixed with `fabiosouzadev_vim_`:

```lua
local function augroup(name)
  return vim.api.nvim_create_augroup('fabiosouzadev_vim_' .. name, { clear = true })
end
```

### Standard Autocommands
| Group              | Event(s)                          | Purpose                      |
| ------------------ | --------------------------------- | ---------------------------- |
| `checktime`         | FocusGained, TermClose, TermLeave | Reload changed files         |
| `highlight_yank`    | TextYankPost                      | Flash yanked text            |
| `resize_splits`     | VimResized                        | Equalize window sizes        |
| `last_loc`          | BufReadPost                       | Jump to last cursor position |
| `close_with_q`      | FileType                          | Close utility windows with q |
| `man_unlisted`      | FileType (man)                    | Hide man pages from buflist  |
| `wrap_spell`        | FileType (text, markdown, etc.)   | Enable wrap and spell        |
| `json_conceal`      | FileType (json, jsonc, json5)     | Disable conceal for JSON     |
| `auto_create_dir`   | BufWritePre                       | Create parent dirs on save   |

## Global Variables

| Variable                   | Default | Purpose                           |
| -------------------------- | ------- | --------------------------------- |
| `vim.g.mapleader`           | `' '`   | Leader key (Space)                |
| `vim.g.maplocalleader`      | `'\\'`  | Local leader (backslash)          |
| `vim.g.autoformat`          | `true`  | Enable auto-formatting            |
| `vim.g.snacks_animate`      | `false` | Disable Snacks animations         |
| `vim.g.ai_cmp`              | `true`  | Use AI completion source          |
| `vim.g.have_nerd_font`      | `false` | Nerd Font availability flag       |
| `vim.g.root_spec`           | table   | Root detection priority           |
| `vim.g.root_lsp_ignore`     | copilot | LSP servers to ignore for root    |
| `vim.g.deprecation_warnings`| `false` | Hide deprecation warnings         |
| `vim.g.trouble_lualine`     | `true`  | Show trouble symbols in lualine   |

## Modeline Convention

Most files end with a Vim modeline:

```lua
-- vim: ts=2 sts=2 sw=2 et
```

This ensures consistent formatting even without StyLua.
