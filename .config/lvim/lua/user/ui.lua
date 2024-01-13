return{
  -- mini.animate
  {
    'echasnovski/mini.animate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local animate = require('mini.animate')
      return {
        -- This is already handled by windows.nvim
        resize = { enable = false },
        open = { enable = false },
        close = { enable = false },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   -- event = "VeryLazy",
  --   event = "BufReadPre",
  --   opts = {
  --     indent = {
  --       char = "│",
  --       tab_char = "│",
  --     },
  --     scope = { enabled = false },
  --     exclude = {
  --       filetypes = {
  --         "help",
  --         "alpha",
  --         "dashboard",
  --         "neo-tree",
  --         "Trouble",
  --         "trouble",
  --         "lazy",
  --         "mason",
  --         "notify",
  --         "toggleterm",
  --         "lazyterm",
  --       },
  --     },
  --   },
  --   main = "ibl",
  -- },

  -- mini.indentscope
  {
    'echasnovski/mini.indentscope',
    config = function()
    require('mini.indentscope').setup({
        symbol = "│",
        options = { try_as_border = true },
      -- vim.api.nvim_create_autocmd('FileType', {
      --   pattern = {
      --     'help',
      --     'dashboard',
      --     'neo-tree',
      --     'Trouble',
      --     'trouble',
      --     'lazy',
      --     'mason',
      --     'notify',
      --     'toggleterm',
      --     'lazyterm',
      --   },
      --   callback = function()
      --     ---@diagnostic disable-next-line: inject-field
      --     vim.b.miniindentscope_disable = true
      --   end,
      -- }),
        event = { 'BufReadPost', 'BufNewFile' },
        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          -- delay = 100,
          -- animation = --<function: implements constant 20ms between steps>,
          priority = 2, -- Symbol priority. Increase to display on top of more symbols.
        },
      --   opts = { symbol = '│', options = { try_as_border = true } },
    })
    end,
  },
  -- dressing.nvim
  {
    'stevearc/dressing.nvim',
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.input(...)
      end
    end,
    opts = {
      input = {
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end,
      },
    },
  },

  -- nvim-ufo
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      -- stylua: ignore start
      { 'zR', function() return require('ufo').openAllFolds() end, desc = 'Open all folds' },
      { 'zM', function() return require('ufo').closeAllFolds() end, desc = 'Close all folds' },
      -- stylua: ignore end
    },
    opts = {
      provider_selector = function(_, filetype, buftype)
        return (filetype == '' or buftype == 'nofile') and 'indent' or { 'treesitter', 'indent' }
      end,
    },
  },

  -- nvim-origami
  { 'chrisgrieser/nvim-origami', event = { 'BufReadPost', 'BufNewFile' }, config = true },

  -- windows.nvim
  {
    'anuvyklack/windows.nvim',
    dependencies = { 'anuvyklack/animation.nvim', 'anuvyklack/middleclass' },
    event = 'WinNew',
    config = true,
    keys = {
      { '<C-w>z', '<cmd>WindowsMaximize<CR>', desc = 'Max out current window' },
      { '<C-w>_', '<cmd>WindowsMaximizeVertically<CR>', desc = 'Max out window height' },
      { '<C-w>|', '<cmd>WindowsMaximizeHorizontally<CR>', desc = 'Max out window width' },
      { '<C-w>=', '<cmd>WindowsEqualize<CR>', desc = 'Equalize windows' },
    },
  },
}
