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
      -- vim.keymap.set('n', '<leader>tl', "<cmd>TermExec cmd='llm -m ollama:llama3'<cr>", { desc = 'Abrir LLM CLI' })
      -- vim.keymap.set('n', '<leader>ti', "<cmd>TermExec cmd='aider --model ollama:deepseek-coder'<cr>", { desc = 'Abrir Aider' })

      -- Atalho para Rodar o Projeto com Perfil 'pet' no Terminal Flutuante
      -- Ideal para validação rápida de Arquiteto
      -- vim.keymap.set('n', '<leader>rp', function()
      --   local cmd = "./mvnw spring-boot:run \
      --     -Dspring-boot.run.profiles=pet \
      --     -Dspring-boot.run.jvmArguments=\"-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005\""
      --   require("toggleterm.terminal").Terminal:new({ cmd = cmd, close_on_exit = false }):toggle()
      -- end, { desc = "Run Spring Boot (Pet Profile)" })

    end,
  },
}
