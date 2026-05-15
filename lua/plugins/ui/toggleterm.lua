return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        float_opts = { border = 'curved' },
      }

      -- Atalhos rápidos
      vim.keymap.set('n', '<leader>ta', "<cmd>TermExec cmd='aichat'<cr>", { desc = 'Abrir Aichat' })


    end,
  },
}
