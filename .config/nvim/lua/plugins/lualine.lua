local icons = require('core.icons')

-- local copilot = function(_, opts)
--   local Util = require("lazyvim.util")
--   local colors = {
--     [""] = Util.ui.fg("Special"),
--     ["Normal"] = Util.ui.fg("Special"),
--     ["Warning"] = Util.ui.fg("DiagnosticError"),
--     ["InProgress"] = Util.ui.fg("DiagnosticWarn"),
--   }
--   table.insert(opts.sections.lualine_x, 2, {
--     function()
--       local icon = require("lazyvim.config").icons.kinds.Copilot
--       local status = require("copilot.api").status.data
--       return icon .. (status.message or "")
--     end,
--     cond = function()
--       if not package.loaded["copilot"] then
--         return
--       end
--       local ok, clients = pcall(require("lazyvim.util").lsp.get_clients, { name = "copilot", bufnr = 0 })
--       if not ok then
--         return false
--       end
--       return ok and #clients > 0
--     end,
--     color = function()
--       if not package.loaded["copilot"] then
--         return
--       end
--       local status = require("copilot.api").status.data
--       return colors[status.status] or colors[""]
--     end,
--   })
-- end

local function lsp_clients()
  return require('lsp-progress').progress({
    -- format = function(messages)
    format = function()
      local active_clients = vim.lsp.get_active_clients()
      -- if #messages > 0 then
      --   -- return ' LSP:' .. table.concat(messages, ' ')
      --   return table.concat(messages, ' ')
      -- end
      local client_names = {}
      for i, client in ipairs(active_clients) do
        if client and client.name ~= '' then
          if client.name == 'copilot' then
            table.insert(client_names, icons.git.Octoface)
          else
            table.insert(client_names, '[' .. client.name .. ']')
          end
        end
      end
      -- return ' LSP:' .. table.concat(client_names, ' ')
      return table.concat(client_names, ' ')
    end,
  })
end

local colors = {
  black = '#080808',
  white = '#c6c6c6',
  grey = '#303030',
  yellow = '#ECBE7B',
  cyan = '#79dac8',
  green = '#008787',
  orange = '#FF8800',
  magenta = '#c678dd',
  blue = '#4799EB',
  dblue = '#05142F',
  transparent = nil,
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local diff = {
  "diff",
  source = diff_source,
  symbols = {
    added = icons.git.LineAdded .. " ",
    modified = icons.git.LineModified .. " ",
    removed = icons.git.LineRemoved .. " ",
  },
  padding = { left = 2, right = 1 },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = nil,
}

local my_theme = {
  normal = {
    a = { fg = colors.dblue, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.blue, bg = colors.dblue },
    c = { fg = colors.blue, bg = colors.transparent },
  },
  insert = {
    a = { fg = colors.dblue, bg = colors.green, gui = 'bold' },
    b = { fg = colors.green, bg = colors.dblue },
    c = { fg = colors.green, bg = colors.transparent },
  },
  visual = {
    a = { fg = colors.dblue, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.yellow, bg = colors.dblue },
    c = { fg = colors.yellow, bg = colors.transparent },
  },
  command = {
    a = { fg = colors.dblue, bg = colors.magenta, gui = 'bold' },
    b = { fg = colors.magenta, bg = colors.dblue },
    c = { fg = colors.magenta, bg = colors.transparent },
  },
  inactive = {
    a = { fg = colors.blue, bg = colors.dblue, gui = 'bold' },
    b = { fg = colors.dblue, bg = colors.blue },
    c = { fg = colors.dblue, bg = colors.transparent },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
}

local filetype = {
  'filetype',
  icon_only = true,
  separator = '',
  padding = { left = 1, right = 1 },
}

-- local navic = {
--   function()
--     return require('nvim-navic').get_location()
--   end,
--   cond = function()
--     return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
--   end,
--   color_correction = 'static',
-- }

local dap = {
  function()
    return require('dap').status()
  end,
  cond = function()
    return package.loaded['dap'] and require('dap').status() ~= ''
  end,
}
return {
  {
    'linrongbin16/lsp-progress.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lsp-progress').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      options = {
        theme = my_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'dashboard',
          'NeogitStatus',
          'NeogitCommitView',
          'NeogitPopup',
          'NeogitConsole',
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          diff,
          {
            function()
              local ok, m = pcall(require, 'better_escape')
              return ok and m.waiting and '✺' or ''
            end,
          },
        },
        -- lualine_c = { navic },
        lualine_c = { lsp_clients },
        lualine_x = { dap, { 'diagnostics', sources = { 'nvim_lsp', 'nvim_diagnostic' } } },
        lualine_y = { filetype, 'filename', 'fileformat' },
        lualine_z = { 'location', 'progress' },
      },
      extensions = {
        'man',
        'quickfix',
        'mason',
        'toggleterm',
        'neo-tree',
        'trouble',
        'lazy',
        'nvim-dap-ui',
      },
    },
  },
}
