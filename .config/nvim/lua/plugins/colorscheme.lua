return {
  -- tokyonight.nvim
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    -- NOTE: Remove this once issue is fixed
    -- Related: https://github.com/folke/tokyonight.nvim/issues/452
    commit = 'e1e8ff2c8ff2bdc90ce35697291a5917adc8db5c',
    opts = {
      style = 'night',
      transparent = true,
      lualine_bold = true,
      terminal_colors = true,
      on_highlights = function(hl, c)
        local transparent = nil
        local blue = '#62AEEF'
        local dblue = '#05142F'
        local pink = '#B542FF'
        local grey = '#1C1C1C'
        hl.Normal = { bg = transparent, fg = blue }
        hl.NormalFloat = { bg = transparent, fg = blue }
        hl.MsgArea = { bg = transparent, fg = blue }
        hl.SignColumn = { bg = transparent, fg = blue }
        hl.EndOfBuffer = { bg = transparent, fg = blue }
        hl.Float = { bg = transparent, fg = blue }
        hl.FloatBorder = { bg = transparent, fg = pink }
        hl.Pmenu = { bg = transparent, fg = blue }
        --   hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeNormal = { bg = transparent, fg = blue }
        hl.TelescopeBorder = { bg = transparent, fg = pink }
        --   hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptNormal = { bg = transparent, fg = blue }
        hl.TelescopePromptBorder = { bg = transparent, fg = pink }
        --   hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = transparent, fg = blue }
        --   hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePreviewTitle = { bg = transparent, fg = blue }
        --   hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = transparent, fg = blue }
        hl.NeoTreeNormal = { bg = transparent, fg = blue }
        hl.NeoTreeNormalNC = { bg = transparent, fg = blue }
        -- Whichkey
        hl.WhichKey = { fg = blue, bg = transparent }
        hl.WhichKeySeperator = { link = 'Comment' }
        hl.WhichKeyGroup = { fg = pink, bg = transparent }
        hl.WhichKeyDesc = { fg = blue, bg = transparent }
        hl.WhichKeyFloat = { fg = transparent, bg = dblue }
        hl.WhichKeyValue = { fg = dblue, bg = transparent }
        hl.WhichKeyBorder = { fg = blue, bg = dblue }
      end,
    },
    config = function(_, opts)
      local tokyonight = require('tokyonight')
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },

  {
    'craftzdog/solarized-osaka.nvim',
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
