# External Integrations

> Last mapped: 2026-05-15

## AI Services

### GitHub Copilot
- **Plugin:** `zbirenbaum/copilot.lua`
- **Activation:** On `InsertEnter` event
- **Enabled filetypes:** JavaScript, TypeScript, Java
- **Panel:** Disabled
- **Suggestions:** Manual trigger (auto_trigger = false), accepts with `<Tab>`
- **Completion integration:** Copilot feeds into `blink.cmp` via `blink-copilot` provider (score_offset = 100)
- **Ghost text:** Enabled when `vim.g.ai_cmp = true`

### aichat CLI
- **Access:** Via `toggleterm.nvim` floating terminal
- **Keymap:** `<leader>ta` — opens `aichat` in floating terminal
- **Note:** External tool, must be installed on PATH

## Version Management

### mise (formerly rtx)
- **Purpose:** Java version management for JDTLS and project runtimes
- **Integration points:**
  - `lua/plugins/langs/java.lua` — resolves JDK paths via `mise where java@21` and `mise where java`
  - JDTLS always uses Java 21+ (from mise)
  - Project Java resolved from local mise config
- **Configured JDK runtimes:**
  - JavaSE-11: `~/.local/share/mise/installs/java/temurin-11`
  - JavaSE-21: `~/.local/share/mise/installs/java/21`
  - JavaSE-26: `~/.local/share/mise/installs/java/latest`

## Git Integration

### gitsigns.nvim
- **Signs:** Custom ASCII signs (`+`, `~`, `_`, `‾`)
- **Features:** Hunk navigation, staging, reset, blame, diff
- **Snacks toggle:** `<leader>uG` toggles git signs visibility

### Snacks Picker — Git
- **Branch picker:** `<leader>gb`
- **Log viewer:** `<leader>gl`, `<leader>gL` (line), `<leader>gf` (file)
- **Status:** `<leader>gs`
- **Stash:** `<leader>gS`
- **Diff (hunks):** `<leader>gd`

### Snacks Picker — GitHub
- **Issues (open):** `<leader>gi`
- **Issues (all):** `<leader>gI`
- **PRs (open):** `<leader>gp`
- **PRs (all):** `<leader>gP`
- **Note:** Requires `gh` CLI on PATH

## LSP Servers

### Active Servers
| Server             | Language   | Configuration                          |
| ------------------ | ---------- | -------------------------------------- |
| `lua_ls`            | Lua        | Full config with runtime paths, hints  |
| `jdtls` (nvim-jdtls)| Java       | Custom launcher via Mason, mise JDK    |
| `lemminx`           | XML        | Format disabled, line width 280        |

### LSP Features
- **Document highlighting** — on CursorHold (when supported)
- **Inlay hints** — toggle with `<leader>th`
- **Diagnostics** — virtual text with severity-based formatting
- **Keymaps:** `grn` (rename), `gra` (code action), `grr` (references), `grd` (definition), `gri` (implementation), etc.

## Debugging (DAP)

### Java Debug
- **Adapter:** `java-debug-adapter` (Mason)
- **Test runner:** `java-test` (Mason)
- **Attach config:** Remote attach to `127.0.0.1:5005`
- **Features:** Hot code replace (auto), main class scan

### DAP Configuration
- **VSCode launch.json:** Supported (via `dap.ext.vscode`)
- **JSON parsing:** Uses `plenary.json` to strip comments from launch.json

## File System

### Neo-tree
- **Purpose:** File system browser
- **Toggle:** `\` to reveal/close
- **Dependencies:** plenary.nvim, nui.nvim, nvim-web-devicons

### Snacks Explorer
- **Purpose:** Alternative file explorer
- **Toggle:** `<leader>e`

## Terminal Integration

### toggleterm.nvim
- **Direction:** Float (with curved border)
- **Quick commands:**
  - `<leader>ta` — Open `aichat`

### Navigator.nvim
- **Purpose:** Tmux-aware split navigation
- **Keymaps:** `<C-h/j/k/l>` for directional movement, `<C-\>` for previous

## Session Management

### persistence.nvim
- **Trigger:** `BufReadPre`
- **Keymaps:**
  - `<leader>qs` — Restore session
  - `<leader>qS` — Select session
  - `<leader>ql` — Restore last session
  - `<leader>qd` — Stop saving current session
