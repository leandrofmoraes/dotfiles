-- local levim = {
-- '                                       ',
-- '                                       ',
-- '██╗     ███████╗██╗   ██╗██╗███╗   ███╗',
-- '██║     ██╔════╝██║   ██║██║████╗ ████║',
-- '██║     █████╗  ██║   ██║██║██╔████╔██║',
-- '██║     ██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║',
-- '███████╗███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║',
-- '╚══════╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
-- '                                       ',
-- }
--
-- local neovim = {
--   '                                                  ',
--   '                                                  ',
--   '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
--   '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
--   '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
--   '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
--   '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
--   '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
--   '                                                  ',
-- }

local leovim = {
  '                                                ',
  '                                                ',
  '██╗     ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  '██║     ██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  '██║     █████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  '██║     ██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  '███████╗███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  '╚══════╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
  '                                                ',
}
-- dashboard-nvim
return {
  'nvimdev/dashboard-nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VimEnter',
  opts = function()
    local opts = {
      theme = 'doom',
      config = {
        header = leovim,
        center = {
          -- stylua: ignore start
          { action = 'Telescope find_files', desc = ' Find file', icon = '󰈞 ', key = 'f' },
          { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'e' },
          { action = 'Telescope oldfiles', desc = ' Recent files', icon = '󰄉 ', key = 'r' },
          { action = 'Telescope live_grep', desc = ' Find text', icon = '󰊄 ', key = 'w' },
          { action = 'cd ~/.config/nvim | e ~/.config/nvim/init.lua', desc = ' Configuration', icon = '󰊄 ', key = 'c' },
          { action = 'Lazy update', desc = ' Update plugins', icon = ' ', key = 'u' },
          { action = 'Mason', desc = ' Mason', icon = ' ', key = 'm' },
          { action = 'Neogit', desc = ' NeoGit', icon = ' ', key = 'g' },
          { action = 'lua require("persistence").load({ last = true })', desc = ' Restore last session', icon = '󰦛 ', key = 'l' },
          { action = 'qa', desc = ' Quit Neovim', icon = ' ', key = 'q' },
          -- stylua: ignore end
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { 'Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- Close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    return opts
  end,
}
