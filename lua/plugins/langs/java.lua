-- This is the same as in lspconfig.configs.jdtls, but avoids
-- needing to require that when this module loads.
local java_filetypes = { 'java' }

-- Utility function to extend or override a config table, similar to the way
-- that Plugin.opts works.
---@param config table
---@param custom function | table | nil
local function extend_or_override(config, custom, ...)
  if type(custom) == 'function' then
    config = custom(config, ...) or config
  elseif custom then
    config = vim.tbl_deep_extend('force', config, custom)
  end
  return config
end

local function path_exists(p) return vim.uv.fs_stat(p) ~= nil end

local function system(cmd)
  local out = vim.fn.system(cmd)
  return vim.trim(out)
end

-- --------------------------------------------------------------------
-- MISE HELPERS
-- --------------------------------------------------------------------

-- Java fixo para rodar JDTLS (sempre 21+)
local function get_jdtls_java()
  local p = system 'mise where java@21'
  if p ~= '' and path_exists(p .. '/bin/java') then return p .. '/bin/java' end

  -- fallback
  return vim.fn.expand '~/.local/share/mise/installs/java/21/bin/java'
end

-- Java do projeto (pega versão local do mise)
local function get_project_java()
  local p = system 'mise where java'
  if p ~= '' and path_exists(p .. '/bin/java') then return p end
  return nil
end

-- --------------------------------------------------------------------
-- JDTLS HELPERS
-- --------------------------------------------------------------------

local function get_mason_jdtls_path() return vim.fn.stdpath 'data' .. '/mason/packages/jdtls' end

local function get_launcher()
  local base = get_mason_jdtls_path()
  local jar = vim.fn.glob(base .. '/plugins/org.eclipse.equinox.launcher_*.jar')
  return jar
end

local function get_config_dir()
  if vim.fn.has 'mac' == 1 then
    return get_mason_jdtls_path() .. '/config_mac'
  elseif vim.fn.has 'win32' == 1 then
    return get_mason_jdtls_path() .. '/config_win'
  end
  return get_mason_jdtls_path() .. '/config_linux'
end

local function get_root_dir()
  local markers = {
    '.git',
    'mvnw',
    'gradlew',
    'pom.xml',
    'build.gradle',
    'build.gradle.kts',
    'settings.gradle',
    'settings.gradle.kts',
  }

  return vim.fs.root(0, markers)
end

local function get_project_name(root_dir) return root_dir and vim.fs.basename(root_dir) or 'default' end

local function get_workspace(project_name) return vim.fn.stdpath 'cache' .. '/jdtls-workspace/' .. project_name end

local function get_lombok() return vim.fn.stdpath 'data' .. '/mason/share/jdtls/lombok.jar' end

local function make_cmd()
  local java = get_jdtls_java()
  local launcher = get_launcher()
  local config = get_config_dir()
  local root_dir = get_root_dir()
  local project = get_project_name(root_dir)
  local workspace = get_workspace(project)
  local lombok = get_lombok()

  return {
    java,

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',

    '-Djava.import.generatesMetadataFilesAtProjectRoot=false',

    '-Dlog.protocol=true',
    '-Dlog.level=ALL',

    '-javaagent:' .. lombok,

    -- "-Xms1g",
    -- "-Xmx4g",

    '-Xmx1g',

    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    '-jar',
    launcher,
    '-configuration',
    config,
    '-data',
    workspace,
  }
end

local function get_bundles()
  local bundles = {}

  local debug = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar', false, true)

  vim.list_extend(bundles, debug)

  local tests = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/share/java-test/*.jar', false, true)

  vim.list_extend(bundles, tests)

  return bundles
end

return {
  -- Add java to treesitter.
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'java' } },
  },

  -- Configure nvim-lspconfig to install the server automatically via mason, but
  -- defer actually starting it to our configuration of nvim-jtdls below.
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {
          ensure_installed = {
            'lemminx',
            'jdtls',
          },
        },
      },
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        jdtls = {},
        lemminx = {
          init_options = {
            settings = {
              xml = {
                format = {
                  enabled = false,
                  splitAttributes = 'preserve',
                  maxLineWidth = 280,
                },
              },
              xslt = {
                format = {
                  enabled = false,
                  splitAttributes = 'preserve',
                  maxLineWidth = 280,
                },
              },
            },
          },
        },
      },
      setup = {
        jdtls = function()
          return true -- avoid duplicate servers
        end,
      },
    },
  },

  -- Set up nvim-dap to debug to java files.
  -- Ensure java debugger and test packages are installed.
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      -- Simple configuration to attach to remote java debug process
      -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
      local dap = require 'dap'
      dap.configurations.java = {
        {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
      },
      }
    end,
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = { ensure_installed = { 'java-debug-adapter', 'java-test' } },
      },
    },
  },

  -- Set up nvim-jdtls to attach to java files.
  {
    'mfussenegger/nvim-jdtls',
    dependencies = { 'folke/which-key.nvim' },
    ft = java_filetypes,
    opts = function()
      local cmd = make_cmd()
      local root_dir = get_root_dir()
      local project_name = get_project_name(root_dir)
      local bundles = get_bundles()
      return {
        root_dir = root_dir,

        -- How to find the project name for a given root dir.
        project_name = project_name,

        -- How to run jdtls. This can be overridden to a full java command-line
        -- if the Python wrapper script doesn't suffice.
        cmd = cmd,

        bundles = bundles,

         -- These depend on nvim-dap, but can additionally be disabled by setting false here.
        dap = { hotcodereplace = "auto", config_overrides = {} },
        -- Can set this to false to disable main class scan, which is a performance killer for large project
        dap_main = {},
        test = true,

        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            inlayHints = {
              parameterNames = {
                enabled = 'all',
              },
            },
            configuration = {
              runtimes = {
                {
                  name = 'JavaSE-11',
                  path = vim.fn.expand '~/.local/share/mise/installs/java/temurin-11', -- example path
                  -- path = home .. "/.local/share/mise/installs/java/temurin-21"
                },
                {
                  name = 'JavaSE-21',
                  path = vim.fn.expand '~/.local/share/mise/installs/java/21', -- example path
                  -- path = home .. "/.local/share/mise/installs/java/temurin-21"
                },
                {
                  name = 'JavaSE-26',
                  path = vim.fn.expand '~/.local/share/mise/installs/java/latest', -- example path
                  -- path = home .. "/.local/share/mise/installs/java/temurin-21"
                },
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local function attach_jdtls()
        vim.notify('lsp server (jdtls) attached - attach_jdtls', "error")
        local fname = vim.api.nvim_buf_get_name(0)

        -- Configuration can be augmented and overridden by opts.jdtls
        local config = extend_or_override({
          cmd = opts.cmd,
          root_dir = opts.root_dir,
          init_options = {
            bundles = opts.bundles,
          },
          settings = opts.settings,
          -- enable CMP capabilities
          -- capabilities = require('blink.cmp').get_lsp_capabilities() or nil,
        }, opts.jdtls)

        -- Existing server will be reused if the root_dir matches.
        require('jdtls').start_or_attach(config)
        -- not need to require("jdtls.setup").add_commands(), start automatically adds commands
      end

      -- Attach the jdtls for each java buffer. HOWEVER, this plugin loads
      -- depending on filetype, so this autocmd doesn't run for the first file.
      -- For that, we call directly below.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = java_filetypes,
        callback = attach_jdtls,
      })

      -- Setup keymap and dap after the lsp is fully attached.
      -- https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration
      -- https://neovim.io/doc/user/lsp.html#LspAttach
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == 'jdtls' then
            local wk = require 'which-key'
            wk.add {
              {
                mode = 'n',
                buffer = args.buf,
                { '<leader>cx', group = 'extract' },
                { '<leader>cxv', require('jdtls').extract_variable_all, desc = 'Extract Variable' },
                { '<leader>cxc', require('jdtls').extract_constant, desc = 'Extract Constant' },
                { '<leader>cgs', require('jdtls').super_implementation, desc = 'Goto Super' },
                { '<leader>cgS', require('jdtls.tests').goto_subjects, desc = 'Goto Subjects' },
                { '<leader>co', require('jdtls').organize_imports, desc = 'Organize Imports' },
              },
            }
            wk.add {
              {
                mode = 'x',
                buffer = args.buf,
                { '<leader>cx', group = 'extract' },
                {
                  '<leader>cxm',
                  [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
                  desc = 'Extract Method',
                },
                {
                  '<leader>cxv',
                  [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
                  desc = 'Extract Variable',
                },
                {
                  '<leader>cxc',
                  [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
                  desc = 'Extract Constant',
                },
              },
            }

            local mason_registry = require 'mason-registry'
            if mason_registry.is_installed 'java-debug-adapter' then
              -- custom init for Java debugger
              -- vim.list_extend(opts.dap, { hotcodereplace = 'auto' })
              require('jdtls').setup_dap(opts.dap)
              require('jdtls.dap').setup_dap_main_class_configs()
              if opts.dap_main then require('jdtls.dap').setup_dap_main_class_configs(opts.dap_main) end

              -- Java Test require Java debugger to work
              if opts.test and mason_registry.is_installed 'java-test' then
                -- custom keymaps for Java test runner (not yet compatible with neotest)
                wk.add {
                  {
                    mode = 'n',
                    buffer = args.buf,
                    { '<leader>t', group = 'test' },
                    {
                      '<leader>tt',
                      function()
                        require('jdtls.dap').test_class {
                          config_overrides = type(opts.test) ~= 'boolean' and opts.test.config_overrides or nil,
                        }
                      end,
                      desc = 'Run All Test',
                    },
                    {
                      '<leader>tr',
                      function()
                        require('jdtls.dap').test_nearest_method {
                          config_overrides = type(opts.test) ~= 'boolean' and opts.test.config_overrides or nil,
                        }
                      end,
                      desc = 'Run Nearest Test',
                    },
                    { '<leader>tT', require('jdtls.dap').pick_test, desc = 'Run Test' },
                  },
                }
              end
            end

            -- User can set additional keymaps in opts.on_attach
            if opts.on_attach then opts.on_attach(args) end
          end
        end,
      })

      -- Avoid race condition by calling attach the first time, since the autocmd won't fire.
      attach_jdtls()
    end,
  },
}
