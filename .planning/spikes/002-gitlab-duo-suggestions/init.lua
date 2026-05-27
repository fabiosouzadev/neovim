local root = vim.fn.stdpath("data") .. "/spikes/002-gitlab-duo"
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
    "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
    -- Alternativamente pode usar a URL: "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git"
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- O setup instala automaticamente o language server em ~/.local/share/nvim/gitlab-code-suggestions-language-server-*
      require("gitlab").setup({
        -- Configurações padrão podem ser customizadas aqui
      })
      
      -- Keymap para completion via omnifunc
      vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { desc = "GitLab Duo: Omnicomplete" })
    end,
  }
}, { root = root .. "/lazy" })
