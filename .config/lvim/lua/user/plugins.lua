-- lvim.builtin.lualine.active = false
-- lvim.builtin.telescope.active = false
-- lvim.builtin.indentlines.active = false

lvim.plugins = {
  { import = "user.rename" },
  { import = "user.refactoring" },
  { import = "user.telescope" },
  { import = "user.ui" },
  { import = "user.editor" },
  { import = "user.lsp" },
  { import = "user.noice"},
  -- { import = "user.indentblankline" },
  -- Colorscheme plugins

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },

  "lunarvim/Onedarker.nvim",

  "overcache/NeoSolarized",

  "joshdick/onedark.vim",

  "lunarvim/darkplus.nvim",

  -- "ellisonleao/gruvbox.nvim",

  "EdenEast/nightfox.nvim",

  "bluz71/vim-nightfly-colors",

  -- "rmehri01/onenord.nvim",

  -- "Rigellute/shades-of-purple.vim",

  { -- tokyonight.nvim
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- NOTE: Remove this once issue is fixed
    -- Related: https://github.com/folke/tokyonight.nvim/issues/452
    commit = "e1e8ff2c8ff2bdc90ce35697291a5917adc8db5c",
    opts = {
      style = "night",
      transparent = true,
      lualine_bold = true,
      terminal_colors = true,
      on_highlights = function(hl, c)
        local transparent = nil
        local blue = "#62AEEF"
        local dblue = "#05142F"
        local pink = "#B542FF"
        local grey = "#1C1C1C"
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
        hl.TroubleNormal = { bg = transparent }
        hl.NeoTreeNormal = { bg = transparent, fg = blue }
        hl.NeoTreeNormalNC = { bg = transparent, fg = blue }
        -- Whichkey
        hl.WhichKey = { fg = blue, bg = transparent }
        hl.WhichKeySeperator = { link = "Comment" }
        hl.WhichKeyGroup = { fg = pink, bg = transparent }
        hl.WhichKeyDesc = { fg = blue, bg = transparent }
        hl.WhichKeyFloat = { fg = transparent, bg = dblue }
        hl.WhichKeyValue = { fg = dblue, bg = transparent }
        hl.WhichKeyBorder = { fg = blue, bg = dblue }
      end,
    },
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  -- { "catppuccin/nvim", name = "catppuccin" },

  -- { "dracula/vim", name = "dracula" },

  {
    "projekt0n/github-nvim-theme",
    version = "v0.0.7",
    -- or                            branch = '0.0.x'
    -- config = function()
    -- require('github-theme').setup({
    -- ...
    -- })
    -- end
  },
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({

        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          "dap",
          -- "dashboard",
          "gitsigns",
          -- "hop",
          "indent-blankline",
          -- "lspsaga",
          "mini",
          "neogit",
          "nvim-cmp",
          -- "nvim-navic",
          "nvim-tree",
          -- "nvim-web-devicons",
          -- "sneak",
          "telescope",
          -- "trouble",
          -- "which-key",
        },

        disable = {
          colored_cursor = false, -- Disable the colored cursor
          borders = false,        -- Disable borders between verticaly split windows
          background = false,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false,    -- Prevent the theme from setting terminal colors
          eob_lines = false,      -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false,  -- Enable higher contrast text for darker style
        },

        -- lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

        -- async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

        -- custom_colors = nil, -- If you want to everride the default colors, set this to a function

        -- custom_highlights = {}, -- Overwrite highlights with your own
      })
    end,
  },
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- animations

  { "echasnovski/mini.nvim", version = false },
  -- {
  -- 	"echasnovski/mini.animate",
  -- 	version = "*",
  -- 	event = "VeryLazy",
  -- 	scroll = {
  -- 		enable = false,
  -- 	},
  -- },
  --  {
  --    'echasnovski/mini.indentscope',
  --    version = false,
  -- 	event = "VeryLazy",
  --    -- config = function ()
  --    --   local mini_indentscope = require('mini.indentscope')
  --    --   mini_indentscope.setup({
  --    --     draw = { animation = mini_indentscope.gen_animation('none') }
  --    --   })
  --    -- end
  --
  --  },
  -- {
  --   "echasnovski/mini.hipatterns",
  --   event = "BufReadPre",
  --   opts = {
  --     highlighters = {
  --       hsl_color = {
  --         pattern = "hsl%(%d+,? %d+,? %d+%)",
  --         group = function(_, match)
  --           local utils = require("solarized-osaka.hsl")
  --           local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
  --           h, s, l = tonumber(h), tonumber(s), tonumber(l)
  --           local hex_color = utils.hslToHex(h, s, l)
  --           return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
  --         end,
  --       },
  --     },
  --   },
  -- },

  -- Other plugins

  "matze/vim-move",

  -- "NvChad/nvim-colorizer.lua",

  -- { 'matze/vim-move' },

  -- { 'turbio/bracey.vim' }, -- Live css edit

  -- { 'norcalli/nvim-colorizer.lua', event = 'BufReadPre', config = [[ require"colorizer".setup() ]] },

  "mxsdev/nvim-dap-vscode-js",

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "js", "txt", "md", "lua" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  -- { 'iamcco/markdown-preview.nvim', build = function() vim.fn["mkdp#util#install"]() end, },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd app && npm install",
  --   ft = "markdown",
  --   config = function()
  --     vim.g.mkdp_auto_start = 0 --autostart 0 = No, 1 = yes.
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- install with yarn or npm
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- { 'tamton-aquib/staline.nvim', require("staline") },
  -- 'tamton-aquib/staline.nvim',

  -- "jackMort/ChatGPT.nvim",

  -- rainbow-delimiters.nvim
  {
    --   'hiphish/rainbow-delimiters.nvim',
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
  },
  -- { "p00f/nvim-ts-rainbow" },

  { "mg979/vim-visual-multi" },

  {
    enabled = false,
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      search = {
        forward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- {
  --     "zbirenbaum/copilot-cmp",
  --     after = { "copilot.lua" },
  --     config = function()
  --         require("copilot_cmp").setup {
  --             formatters = {
  --                 insert_text = require("copilot_cmp.format").remove_existing,
  --             },
  --         }
  --     end,
  -- },
  -- {
  -- "lukas-reineke/indent-blankline.nvim",
  -- config = function()
  --     require("indent_blankline").setup{
  --         -- for example, context is off by default, use this to turn it on
  --         show_current_context = true,
  --         show_current_context_start = true,
  --     }
  -- end,
  -- },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  -- {
  --     "zbirenbaum/copilot.lua",
  --     cmd = "Copilot",
  --     event = "InsertEnter",
  -- },
  -- {
  --     "zbirenbaum/copilot-cmp",
  --     after = { "copilot.lua" },
  --     config = function()
  --         require("copilot_cmp").setup()
  --     end,
  -- },
  -- { 'manzeloth/live-server' },
  {
    "barrett-ruth/live-server.nvim",
    build = "yarn global add live-server",
    config = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- 'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "ellisonleao/glow.nvim",
    -- "npxbr/glow.nvim",
    ft = { "markdown" },
    -- build = "yay -S glow"
  },
  { "machakann/vim-sandwich" },
  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
  },
  {
    "tpope/vim-surround",
  },
  -- {
  -- "kylechui/nvim-surround",
  -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  -- config = function()
  -- require("nvim-surround").setup({
  -- Configuration here, or leave empty to use defaults
  -- })
  -- end
  -- },
  { "rstacruz/sparkup" },

  { "mattn/emmet-vim" },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
  -- {
  --     "echasnovski/mini.map",
  --     branch = "stable",
  --     config = function()
  --         require('mini.map').setup()
  --         local map = require('mini.map')
  --         map.setup({
  --             integrations = {
  --                 map.gen_integration.builtin_search(),
  --                 map.gen_integration.diagnostic({
  --                     error = 'DiagnosticFloatingError',
  --                     warn  = 'DiagnosticFloatingWarn',
  --                     info  = 'DiagnosticFloatingInfo',
  --                     hint  = 'DiagnosticFloatingHint',
  --                 }),
  --             },
  -- symbols = {
  -- encode = map.gen_encode_symbols.dot('4x2'),
  -- },
  --             window = {
  --                 side = 'right',
  --                 width = 20, -- set to 1 for a pure scrollbar :)
  --                 winblend = 15,
  --                 show_integration_count = false,
  --             },
  --         })
  --     end
  -- },
  -- { "TimUntersberger/neogit" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      -- "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- Only one of these is needed, not both.
      -- "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
  },

  { "MunifTanjim/nui.nvim" },
  -- { "Bryley/neoai.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      use_diagnostic_signs = true,
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    },
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
        alacritty = { enabled = false, font = "+4" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
