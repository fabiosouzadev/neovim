return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  build = function()
    require("gitlab.server").build(true)
  end,
  config = function()
    require("gitlab").setup()
  end,
  keys = {
    { "<leader>gl", "<cmd>lua require('gitlab').choose_merge_request()<CR>", desc = "GitLab: List MRs" },
    { "<leader>gr", "<cmd>lua require('gitlab').review()<CR>", desc = "GitLab: Review current branch MR" },
    { "<leader>gs", "<cmd>lua require('gitlab').summary()<CR>", desc = "GitLab: MR Summary" },
  },
}
