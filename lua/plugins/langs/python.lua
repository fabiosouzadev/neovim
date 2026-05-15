local function path_exists(p) return vim.uv.fs_stat(p) ~= nil end

local function system(cmd)
  local out = vim.fn.system(cmd)
  return vim.trim(out)
end

local function get_mise_python()
  local p = system 'mise where python'
  if p ~= '' and path_exists(p .. '/bin/python') then return p .. '/bin/python' end
  return nil
end

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = 'recommended',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruff = {},
      },
    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'basedpyright', 'ruff' })
        end,
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = { 'ruff_format', 'ruff_organize_imports' }
    end,
  },
  {
    'mfussenegger/nvim-lint',
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.python = { 'ruff' }
    end,
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      local dap = require 'dap'
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = get_mise_python() or 'python',
        },
      }
    end,
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'debugpy' })
        end,
      },
    },
  },
}
