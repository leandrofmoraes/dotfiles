local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  return
end

-- zen_mode.setup {
--   window = {
--     backdrop = 1,
--     height = 0.9,
--     -- width = 0.5,
--     width = 80,
--     options = {
--       signcolumn = "no",
--       number = true,
--       relativenumber = false,
--       cursorline = true,
--       cursorcolumn = false, -- disable cursor column
--       -- foldcolumn = "0", -- disable fold column
--       -- list = false, -- disable whitespace characters
--     },
--   },
--     plugins = {
--         gitsigns = { enabled = false },
--         tmux = { enabled = false },
--         twilight = { enabled = false },
--         -- this will change the font size on kitty when in zen mode
--         -- to make this work, you need to set the following kitty options:
--         -- - allow_remote_control socket-only
--         -- - listen_on unix:/tmp/kitty
--         kitty = {
--             enabled = false,
--             font = "+4", -- font size increment
--         },
--         -- this will change the font size on alacritty when in zen mode
--         -- requires  Alacritty Version 0.10.0 or higher
--         -- uses `alacritty msg` subcommand to change font size
--         alacritty = {
--             enabled = false,
--             font = "14", -- font size
--         },
--     },
--   on_open = function()
--     -- require("lsp-inlayhints").toggle()
--     lvim.builtin.cmp.active = false
--     lvim.builtin.breadcrumbs.active = false
--     -- vim.cmd [[LspStop]]
--     -- local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", nil, { scope = "local" })
--     -- if not status_ok then
--     --   return
--     -- end
--   end,
--   on_close = function()
--     -- require("lsp-inlayhints").toggle()
--     lvim.builtin.breadcrumbs.active = true
--     lvim.builtin.cmp.active = true
--     -- vim.cmd [[LspStart]]
--     -- require("user.winbar").create_winbar()
--   end,
-- }
--
zen_mode.setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
    -- this will change the font size on alacritty when in zen mode
    -- requires  Alacritty Version 0.10.0 or higher
    -- uses `alacritty msg` subcommand to change font size
    alacritty = {
      enabled = true,
      font = "12", -- font size
    },
    -- this will change the font size on wezterm when in zen mode
    -- See alse also the Plugins/Wezterm section in this projects README
    wezterm = {
      enabled = false,
      -- can be either an absolute font size or the number of incremental steps
      font = "+4", -- (10% increase per step)
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function()
        -- vim.cmd("autocmd VimEnter * hi ZenBg ctermbg=NONE guibg=NONE")
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}
