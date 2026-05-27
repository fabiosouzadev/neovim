local root = vim.fn.stdpath("data") .. "/spikes/001-gitlab"
local lazypath = root .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true

require("lazy").setup({
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    build = function () require("gitlab.server").build(true) end,
    config = function()
      require("gitlab").setup()
    end,
  }
}, { root = root .. "/lazy" })

-- Keymaps para facilitar teste
vim.keymap.set("n", "<leader>gc", function() require("gitlab").choose_merge_request() end)
vim.keymap.set("n", "<leader>gr", function() require("gitlab").review() end)
vim.keymap.set("n", "<leader>gs", function() require("gitlab").summary() end)
