return {
  -- nvim-lspconfig
  --  {
  --    'neovim/nvim-lspconfig',
  --    dependencies = {
  --      -- neodev.nvim
  --      { 'folke/neodev.nvim', lazy = true },
  --      { 'tamago324/nlsp-settings.nvim', cmd = 'LspSettings', lazy = true },
  --      { 'antosha417/nvim-lsp-file-operations', config = true },
  --      { 'hrsh7th/cmp-nvim-lsp' },
  --    },
  --    event = { 'BufReadPre', 'BufNewFile' },
  --    keys = {
  --      -- stylua: ignore start
  --      { 'gd', function() return require('telescope.builtin').lsp_definitions() end, desc = 'Goto Definition' },
  --      { 'gi', function() return require('telescope.builtin').lsp_implementations() end, desc = 'Goto Implementation' },
  --      { 'gy', function() return require('telescope.builtin').lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },
  --      -- stylua: ignore end
  --      { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
  --      { 'K', vim.lsp.buf.hover, desc = 'Hover' },
  --      { 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help' },
  --    },
  --    -- config = function()
  --    --   local lspconfig = require('lspconfig')
  --    --   -- Load neodev.nvim before loading everything else
  --    --   require('neodev').setup({ library = { plugins = { 'nvim-dap-ui' }, types = true } })
  --    --   -- require('neodev').setup()
  --    --   lspconfig.clangd.setup({
  --    --     -- Fix clangd offset encoding
  --    --     capabilities = { offsetEncoding = { 'utf-8' } },
  --    --     cmd = {
  --    --       'clangd',
  --    --       '--fallback-style=Google',
  --    --       '--completion-style=detailed',
  --    --       '--function-arg-placeholders',
  --    --     },
  --    --     init_options = { usePlaceholders = true },
  --    --   })
  --    --   lspconfig.lua_ls.setup({
  --    --     log_level = 0,
  --    --     settings = { Lua = { workspace = { checkThirdParty = false }, completion = { callSnippet = 'Replace' } } },
  --    --   })
  --    --   lspconfig.marksman.setup({})
  --    --   lspconfig.bashls.setup({ filetypes = { 'sh', 'zsh', 'bash' } })
  --    --   lspconfig.taplo.setup({})
  --    --   -- lspconfig.typos_lsp.setup({})
  --    -- end,
  --  },
  --
  --  {
  --    'williamboman/mason-lspconfig.nvim',
  --    cmd = { 'LspInstall', 'LspUninstall' },
  --    config = function()
  --      -- require("mason-lspconfig").setup(lvim.lsp.installer.setup)
  --
  --      -- automatic_installation is handled by lsp-manager
  --      local settings = require('mason-lspconfig.settings')
  --      settings.current.automatic_installation = false
  --    end,
  --    lazy = true,
  --    event = 'User FileOpened',
  --    dependencies = 'mason.nvim',
  --  },
  --  -- mason-lspconfig.nvim
  --  {
  --    'williamboman/mason.nvim',
  --    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
  --    build = function()
  --      pcall(function()
  --        require('mason-registry').refresh()
  --      end)
  --    end,
  --    event = 'User FileOpened',
  --    lazy = true,
  --    opts = {
  --      ui = {
  --        icons = {
  --          package_installed = '',
  --          package_pending = '',
  --          package_uninstalled = '',
  --        },
  --      },
  --      log_level = vim.log.levels.OFF,
  --    },
  --  },
  --
  --  -- none-ls.nvim
  --  {
  --    'nvimtools/none-ls.nvim',
  --    main = 'null-ls',
  --    dependencies = {
  --      -- mason-null-ls.nvim
  --      {
  --        'jay-babu/mason-null-ls.nvim',
  --        dependencies = 'williamboman/mason.nvim',
  --        cmd = { 'NullLsInstall', 'NullLsUninstall', 'NoneLsInstall', 'NoneLsUninstall' },
  --        opts = {
  --          ensure_installed = { 'stylua', 'markdownlint', 'mdformat', 'cpplint', 'clang_format', 'beautysh' },
  --          handlers = {},
  --        },
  --      },
  --      'nvim-lua/plenary.nvim',
  --    },
  --    event = { 'BufReadPre', 'BufNewFile' },
  --    opts = function()
  --      local nls = require('null-ls')
  --      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
  --      return {
  --        log_level = 'off',
  --        sources = {
  --          -- lua
  --          nls.builtins.formatting.stylua,
  --          -- nls.builtins.diagnostics.selene,
  --          -- markdown
  --          nls.builtins.formatting.mdformat,
  --          nls.builtins.formatting.markdownlint,
  --          nls.builtins.diagnostics.markdownlint,
  --          -- cpp
  --          -- nls.builtins.formatting.clang_format,
  --          -- nls.builtins.diagnostics.cpplint,
  --          -- shell
  --          nls.builtins.formatting.beautysh.with({ extra_args = { '-i', '2' } }),
  --          nls.builtins.diagnostics.zsh,
  --          -- toml
  --          nls.builtins.formatting.taplo,
  --          -- code actions
  --          nls.builtins.code_actions.gitrebase,
  --        },
  --        on_attach = function(client, bufnr)
  --          -- Autoformat on save if supported
  --          if client.supports_method('textDocument/formatting') then
  --            vim.api.nvim_clear_autocmds({
  --              group = augroup,
  --              buffer = bufnr,
  --            })
  --            vim.api.nvim_create_autocmd('BufWritePre', {
  --              group = augroup,
  --              buffer = bufnr,
  --              callback = function()
  --                vim.lsp.buf.format({
  --                  async = false,
  --                  bufnr = bufnr,
  --                  -- Only use none-ls.nvim for formatting
  --                  -- selene: allow(shadowing)
  --                  ---@diagnostic disable-next-line: redefined-local
  --                  filter = function(client)
  --                    return client.name == 'null-ls'
  --                  end,
  --                })
  --              end,
  --            })
  --          end
  --        end,
  --      }
  --    end,
  --  },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    -- opts = {
    --   linters_by_ft = {
    --     markdown = { "markdownlint" },
    --   },
    -- },
  },

  -- inc-rename.nvim
  {
    'smjonas/inc-rename.nvim',
    keys = {
      {
        'gr',
        function()
          return ':IncRename ' .. vim.fn.expand('<cword>')
        end,
        expr = true,
        desc = 'Rename',
      },
      {
        '<leader>rr',
        function()
          return ':IncRename ' .. vim.fn.expand('<cword>')
        end,
        expr = true,
        desc = 'Rename',
      },
    },
    -- opts = { input_buffer_type = 'dressing' },
    opts = { input_buffer_type = 'noice' },
  },

  -- nvim-navic
  {
    'SmiteshP/nvim-navic',
    requires = 'neovim/nvim-lspconfig',
    event = 'LspAttach',
    -- event = 'User FileOpened',
    opts = {
      highlight = true,
      lsp = { auto_attach = true },
      lazy_update_context = true,
      icons = require('core.icons').kind,
      -- icons = {
      --   Array = ' ',
      --   Boolean = ' ',
      --   Class = ' ',
      --   Color = ' ',
      --   Constant = ' ',
      --   Constructor = ' ',
      --   Copilot = ' ',
      --   Enum = ' ',
      --   EnumMember = ' ',
      --   Event = ' ',
      --   Field = ' ',
      --   File = ' ',
      --   Folder = ' ',
      --   Function = ' ',
      --   Interface = ' ',
      --   Key = ' ',
      --   Keyword = ' ',
      --   Method = ' ',
      --   Module = ' ',
      --   Namespace = ' ',
      --   Null = ' ',
      --   Number = ' ',
      --   Object = ' ',
      --   Operator = ' ',
      --   Package = ' ',
      --   Property = ' ',
      --   Reference = ' ',
      --   Snippet = ' ',
      --   String = ' ',
      --   Struct = ' ',
      --   Text = ' ',
      --   TypeParameter = ' ',
      --   Unit = ' ',
      --   Value = ' ',
      --   Variable = ' ',
      -- },
      on_attach = function(client, bufnr)
        local navic = require('nvim-navic')
        -- navic.attach(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end,
    },
  },
  -- {
  --   'LunarVim/breadcrumbs.nvim',
  --   dependencies = { 'SmiteshP/nvim-navic' },
  --   -- event = 'User FileOpened',
  --   opts = {
  --     lsp = {
  --       auto_attach = true,
  --     },
  --   },
  -- },

  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      -- 'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    event = 'LspAttach',
    opts = {
      attach_navic = false,
      exclude_filetypes = {
        'gitcommit',
        'toggleterm',
        'nvim-tree',
      },
    },
  },

  -- fidget.nvim
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {
      notification = { window = { winblend = 0 } },
      logger = { level = vim.log.levels.OFF },
      progress = { suppress_on_insert = true, display = { render_limit = 3 } },
    },
  },

  -- lsp_lines.nvim
  --  {
  --    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  --    event = 'LspAttach',
  --    config = function()
  --      require('lsp_lines').setup()
  --      vim.diagnostic.config({
  --        virtual_text = false,
  --        virtual_lines = { highlight_whole_line = false },
  --      })
  --    end,
  --  },

  -- actions-preview.nvim
  {
    'aznhe21/actions-preview.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    opts = {
      telescope = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = 'top',
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
    -- keys = {
    --   {
    --     '<leader>ac',
    --     function()
    --       return require('actions-preview').code_actions()
    --     end,
    --     mode = { 'n', 'v' },
    --     desc = 'Action Preview',
    --   },
    --   {
    --     '<leader>aa',
    --     "<cmd>lua vim.lsp.buf.code_action()<cr>",
    --     desc = "Actions"
    --   },
    -- },
  },

  -- nvim-lightbulb
  { 'kosayoda/nvim-lightbulb',  event = 'LspAttach', opts = { autocmd = { enabled = false } } },

  -- nvim-dap
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- nvim-dap-virtual-text
      { 'theHamsta/nvim-dap-virtual-text', opts = { highlight_new_as_changed = true } },

      -- mason-nvim-dap.nvim
      {
        'jay-babu/mason-nvim-dap.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
        dependencies = 'williamboman/mason.nvim',
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = { 'codelldb' },
        },
      },

      -- goto-breakpoints.nvim
      {
        'ofirgall/goto-breakpoints.nvim',
        keys = {
          -- stylua: ignore start
          { ']b', function() return require('goto-breakpoints').next() end, desc = 'Next breakpoint' },
          { '[b', function() return require('goto-breakpoints').prev() end, desc = 'Previous breakpoint' },
          -- stylua: ignore end
        },
      },

      -- nvim-dap-ui
      {
        'rcarriga/nvim-dap-ui',
        keys = {
          -- stylua: ignore start
          { '<leader>du', function() return require('dapui').toggle() end, desc = 'Dap UI' },
          { '<leader>de', function() return require('dapui').eval() end,   desc = 'Eval',  mode = { 'n', 'v' } },
          -- stylua: ignore end
        },
        config = function()
          local dap = require('dap')
          local dapui = require('dapui')
          dapui.setup()
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
    },
    keys = {
      -- stylua: ignore start
      { '<leader>dB', function() return require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition' },
      { '<leader>db', function() return require('dap').toggle_breakpoint() end,                                    desc = 'Toggle Breakpoint' },
      { '<leader>dc', function() return require('dap').continue() end,                                             desc = 'Continue' },
      { '<leader>dC', function() return require('dap').run_to_cursor() end,                                        desc = 'Run to Cursor' },
      { '<leader>dg', function() return require('dap').goto_() end,                                                desc = 'Go to line (no execute)' },
      { '<leader>di', function() return require('dap').step_into() end,                                            desc = 'Step Into' },
      { '<leader>dj', function() return require('dap').down() end,                                                 desc = 'Down' },
      { '<leader>dk', function() return require('dap').up() end,                                                   desc = 'Up' },
      { '<leader>dl', function() return require('dap').run_last() end,                                             desc = 'Run Last' },
      { '<leader>dO', function() return require('dap').step_out() end,                                             desc = 'Step Out' },
      { '<leader>do', function() return require('dap').step_over() end,                                            desc = 'Step Over' },
      { '<leader>dp', function() return require('dap').pause() end,                                                desc = 'Pause' },
      { '<leader>dr', function() return require('dap').repl.toggle() end,                                          desc = 'Toggle REPL' },
      { '<leader>ds', function() return require('dap').session() end,                                              desc = 'Session' },
      { '<leader>dt', function() return require('dap').terminate() end,                                            desc = 'Terminate' },
      { '<leader>dw', function() return require('dap.ui.widgets').hover() end,                                     desc = 'Widgets' },
      -- stylua: ignore end
    },
    config = function()
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })
    end,
  },

  { 'mxsdev/nvim-dap-vscode-js' },

  {
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
    config = function()
      require('lsp_signature').on_attach()
    end,
  },
}
