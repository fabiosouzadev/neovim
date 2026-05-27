return {
  "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
  -- Note: The git@ URL requires SSH keys configured for GitLab.
  -- Use "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git" if you prefer HTTPS.
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitlab").setup({})

    -- Optional: Configure omni completion keymap
    vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { desc = "GitLab Duo: Omnicomplete" })
  end,
}
