return {
  -- windows.nvim
  {
    'anuvyklack/windows.nvim',
    dependencies = { 'anuvyklack/animation.nvim', 'anuvyklack/middleclass' },
    event = 'WinNew',
    config = true,
    keys = {
      { '<C-w>z', '<cmd>WindowsMaximize<CR>',             desc = 'Max out current window' },
      { '<C-w>_', '<cmd>WindowsMaximizeVertically<CR>',   desc = 'Max out window height' },
      { '<C-w>|', '<cmd>WindowsMaximizeHorizontally<CR>', desc = 'Max out window width' },
      { '<C-w>=', '<cmd>WindowsEqualize<CR>',             desc = 'Equalize windows' },
    },
  },

  -- mini.animate
  {
    enabled = false,
    'echasnovski/mini.animate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function()
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

  -- mini.indentscope
  {
    'echasnovski/mini.indentscope',
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          ---@diagnostic disable-next-line: inject-field
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    event = { 'BufReadPost', 'BufNewFile' },
    opts = { symbol = '│', options = { try_as_border = true } },
  }
}
