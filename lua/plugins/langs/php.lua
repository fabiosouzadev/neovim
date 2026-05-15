local function path_exists(p) return vim.uv.fs_stat(p) ~= nil end

local function system(cmd)
  local out = vim.fn.system(cmd)
  return vim.trim(out)
end

local function get_mise_php()
  local p = system 'mise where php'
  if p ~= '' and path_exists(p .. '/bin/php') then return p .. '/bin/php' end
  return nil
end

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        phpactor = {},
      },
    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'phpactor', 'phpstan', 'php-cs-fixer' })
        end,
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { 'php_cs_fixer' }
    end,
  },
  {
    'mfussenegger/nvim-lint',
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = { 'phpstan' }
    end,
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      local dap = require 'dap'
      dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { vim.fn.stdpath 'data' .. '/mason/packages/php-debug-adapter/extension/out/phpDebug.js' },
      }
      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9003,
        },
      }
    end,
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'php-debug-adapter' })
        end,
      },
    },
  },
}
