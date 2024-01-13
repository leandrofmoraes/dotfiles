--> left_sep   :          
--> right_sep  :          

-- Lualine.config = function()
-- if not lvim.builtin.lualine.active then
-- return
-- end

-- 	local branch_icon = "%#SLGitIconDark#" .. lvim.icons.git.Branch .. "%*" .. "%#SLBranchNameDark#"

-- 	local branch = {
-- 		"b:gitsigns_head",
-- 		icon = branch_icon,
-- 		color = { gui = "bold" },
-- 	}

-- 	lvim.builtin.lualine.sections.lualine_b = { branch }
-- end

-- lvim.builtin.lualine.on_config_done = function(lualine)
-- local status_ok, lualine = pcall(require, "lvim.core.lualine")
-- if not status_ok then
-- return
-- end
-- lvim.builtin.lualine.style = "none"
-- local config = lvim.core.lualine.get_config()
-- lvim.builtin.lualine.on_config_done = function()
-- lvim.builtin.lualine = function ()
-- local custom = require("themes.custom")
-- local custom = require("lualine")
local components = require("lvim.core.lualine.components")
local custom = require("lvim.core.lualine")
-- local config = lualine.get_config()
local filetype = {
  'filetype',
  icon_only = true,
  separator = '',
  padding = { left = 1, right = 1 },
}

-- local nvim_navic = {
--   function()
--     return require('nvim-navic').get_location()
--   end,
--   cond = function()
--     return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
--   end,
--   color_correction = 'static',
-- }

local colors = {
  black       = '#080808',
  white       = '#c6c6c6',
  grey        = '#303030',
  yellow      = "#ECBE7B",
  -- yellow = '#E4C079',
  -- cyan = "#008080",
  cyan        = '#79dac8',
  --cyan = "#78d4ed",
  -- darkblue = "#081633",
  -- green  = '#469C93', -- spotify green
  -- green = "#0BBD8A",
  -- green = "#12a7a7",
  green       = "#008787",
  orange      = "#FF8800",
  -- violet = "#a9a1e1",
  -- violet = '#d183e8',
  -- violet = '#BD93F9',
  magenta     = "#c678dd",
  -- magenta = '#B542FF',
  -- purple = "#7123A6",
  -- purple =  '#310041', -- ubuntu purple
  -- dblue  = '#000819',
  -- blue = "#51afef",
  --blue = "#2A7AE4",  -- Azul da Alura
  -- red = "#ec5f67",
  -- red    = '#ff5189',
  --red = "#c84364",
  blue        = '#4799EB',
  dblue       = '#05142F',
  transparent = nil,
}
custom = {
  -- mytheme.setup {
  style = "lvim",
  options = {
    globalstatus = true,
    icons_enabled = lvim.use_icons,
    disabled_filetypes = { "alpha" },

    component_separators = {
      left = '',
      right = '',
    },
    section_separators = {
      left = '',
      right = ''
    },

    theme = {
      normal = {
        a = { fg = colors.dblue, bg = colors.blue, gui = "bold" },
        b = { fg = colors.blue, bg = colors.dblue },
        c = { fg = colors.blue, bg = colors.transparent },
      },
      insert = {
        a = { fg = colors.dblue, bg = colors.green, gui = "bold" },
        b = { fg = colors.green, bg = colors.dblue },
        c = { fg = colors.green, bg = colors.transparent },
      },
      visual = {
        a = { fg = colors.dblue, bg = colors.yellow, gui = "bold" },
        b = { fg = colors.yellow, bg = colors.dblue },
        c = { fg = colors.yellow, bg = colors.transparent },
      },
      command = {
        a = { fg = colors.dblue, bg = colors.magenta, gui = "bold" },
        b = { fg = colors.magenta, bg = colors.dblue },
        c = { fg = colors.magenta, bg = colors.transparent },
      },
      inactive = {
        a = { fg = colors.blue, bg = colors.dblue, gui = "bold" },
        b = { fg = colors.dblue, bg = colors.blue },
        c = { fg = colors.dblue, bg = colors.transparent },
      }
    },
  },

  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", components.diff },
    lualine_c = { components.lsp },
    -- lualine_c = { components.branch, components.diff },
    lualine_x = { components.diagnostics },
    lualine_y = { filetype, components.filename, "fileformat" },
    lualine_z = { components.location, "progress", },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { components.filename },
    lualine_x = { components.location },
    lualine_y = {},
    lualine_z = {},
  },
  -- tabline = {},
  -- extensions = {},
}
-- lualine.setup(config)
lvim.builtin.lualine = custom
-- lualine.setup = custom
-- lvim.builtin.lualine.style = "custom"
-- lvim.builtin.lualine.options = mytheme
-- return custom
-- end

-- lvim.builtin.lualine.style = "mytheme"
-- lvim.builtin.lualine.options.theme = "mytheme"
