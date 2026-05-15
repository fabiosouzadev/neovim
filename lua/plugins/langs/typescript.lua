local function path_exists(p) return vim.uv.fs_stat(p) ~= nil end

local function system(cmd)
  local out = vim.fn.system(cmd)
  return vim.trim(out)
end

local function get_mise_node()
  local p = system 'mise where node'
  if p ~= '' and path_exists(p .. '/bin/node') then return p .. '/bin/node' end
  return nil
end

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        vtsls = {
          -- settings = {
          --   typescript = {
          --     updateImportsOnRenameFileConfiguration = {
          --       enabled = "always",
          --     },
          --   },
          -- },
        },
      },
    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'vtsls', 'prettier', 'eslint_d' })
        end,
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.javascript = { 'prettier' }
      opts.formatters_by_ft.typescript = { 'prettier' }
      opts.formatters_by_ft.javascriptreact = { 'prettier' }
      opts.formatters_by_ft.typescriptreact = { 'prettier' }
    end,
  },
  {
    'mfussenegger/nvim-lint',
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.javascript = { 'eslint_d' }
      opts.linters_by_ft.typescript = { 'eslint_d' }
      opts.linters_by_ft.javascriptreact = { 'eslint_d' }
      opts.linters_by_ft.typescriptreact = { 'eslint_d' }
    end,
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      local dap = require 'dap'
      if not dap.adapters['pwa-node'] then
        dap.adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = {
              vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
              '${port}',
            },
          },
        }
      end
      for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
        dap.configurations[language] = dap.configurations[language] or {}
        table.insert(dap.configurations[language], {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        })
      end
    end,
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'js-debug-adapter' })
        end,
      },
    },
  },
}
