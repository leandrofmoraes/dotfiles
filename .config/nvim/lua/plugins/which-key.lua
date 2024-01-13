local icons = require('core.icons')
-- which-key.nvim
return {
  'folke/which-key.nvim',
  -- keys = { '<leader>', '"', "'", '`', 'a', 'c', 'y', 'd', 'z', 'g', '[', ']', ';' },
  keys = { '<leader>', '"', "'", '`', 'a', 'c', 'y', 'd', 'z', 'g', '[', ']' },
  opts = {
    operators = { gc = 'Comments', gb = 'Block comments' },
    defaults = {
      mode = { 'n', 'v' },
      ['g'] = { name = '+goto' },
      ['gc'] = { name = '+comments' },
      ['gb'] = { name = '+block comments' },
      ['gz'] = { name = '+surrounds' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
      ['<leader>q'] = { name = '+quit/session' },
      ['<leader>f'] = { name = '+find' },
      ['<leader>b'] = { name = '+buffers' },
      ['<leader>g'] = { name = '+git' },
      ['<leader>d'] = { name = '+diagnostics/quickfix' },
      ['<leader>D'] = { name = '+debugger' },
      ['<leader>i'] = { name = '+interpreter' },
      ['<leader>r'] = { name = '+refactoring' },
    },
    window = {
      border = 'double',        -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
      -- zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3,                    -- spacing between columns
      align = 'center',               -- align columns left, center or right
    },
    icons = {
      breadcrumb = icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
      separator = icons.ui.BoldArrowRight,      -- symbol used between a key and it's label
      group = icons.ui.Plus,                    -- symbol prepended to a group
    },
    -- marks = false,                              -- shows a list of your marks on ' and `
    -- registers = false,                          -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,
      suggestions = 20,
    },                -- use which-key for spelling hints
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    -- disable = {
    --   buftypes = {},
    --   filetypes = { "TelescopePrompt" },
    -- },
    mappings = {
      mode = { 'n', 'v' },
      ["<leader>;"] = { "<cmd>Alpha<CR>", "Dashboard" },
      ["<leader>w"] = { "<cmd>w!<CR>", "Save" },
      ["<leader>/"] = { require("Comment.api").toggle.linewise.current, "Comment current line" },
      ["<leader>B"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
    }
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.register(opts.defaults)
    wk.register(opts.mappings)

    -- if require("lazyvim.util").has("noice.nvim") then
    --   wk.register(opts.defaults { ["<leader>sn"] = { name = "+noice" } })
    -- end
  end,
}
