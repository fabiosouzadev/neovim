-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@module 'which-key'
  ---@type wk.Opts
  ---@diagnostic disable-next-line: missing-fields
  opts_extend = { "spec" },
  opts = {
    -- preset = "helix"
    defaults = {},
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
    -- spec = {
    --   {
    --     mode = { "n", "x" },
    --     { "<leader><tab>", group = "tabs" },
    --     { "<leader>c", group = "code" },
    --     { "<leader>d", group = "debug" },
    --     { "<leader>dp", group = "profiler" },
    --     { "<leader>f", group = "file/find" },
    --     { "<leader>g", group = "git" },
    --     { "<leader>gh", group = "Git [H]unk" },
    --     { "<leader>q", group = "quit/session" },
    --     { "<leader>s", group = "[S]earch" },
    --     { "<leader>u", group = "ui" },
    --     { "<leader>x", group = "diagnostics/quickfix" },
    --     { "[", group = "prev" },
    --     { "]", group = "next" },
    --     { "g", group = "goto" },
    --     { "gs", group = "surround" },
    --     { "z", group = "fold" },
    --     {
    --       "<leader>b",
    --       group = "buffer",
    --       expand = function()
    --         return require("which-key.extras").expand.buf()
    --       end,
    --     },
    --     {
    --       "<leader>w",
    --       group = "windows",
    --       proxy = "<c-w>",
    --       expand = function()
    --         return require("which-key.extras").expand.win()
    --       end,
    --     },
    --     -- better descriptions
    --     { "gx", desc = "Open with system app" },
    --   },
    -- },
    -- Document existing key chains
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>gh', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
      { 'gr', group = 'LSP Actions', mode = { 'n' } },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    -- {
    --   "<c-w><space>",
    --   function()
    --     require("which-key").show({ keys = "<c-w>", loop = true })
    --   end,
    --   desc = "Window Hydra Mode (which-key)",
    -- },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    if not vim.tbl_isempty(opts.defaults) then
      LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
      wk.register(opts.defaults)
    end
  end,
}