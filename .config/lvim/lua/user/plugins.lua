
-- lvim.builtin.lualine.active = false

lvim.plugins = {
    -- Colorscheme plugins
    "lunarvim/Onedarker.nvim",

    "overcache/NeoSolarized",

    "joshdick/onedark.vim",

    "lunarvim/darkplus.nvim",

    "ellisonleao/gruvbox.nvim",

    "EdenEast/nightfox.nvim",

    "bluz71/vim-nightfly-colors",

    "rmehri01/onenord.nvim",

    -- "Rigellute/shades-of-purple.vim",

    -- {"folke/tokyonight.nvim"},

    { "catppuccin/nvim", as = "catppuccin" },

    { "dracula/vim",  as = "dracula" },

    {
        'projekt0n/github-nvim-theme', tag = 'v0.0.7',
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
            require('material').setup({

                plugins = { -- Uncomment the plugins that you use to highlight them
                    -- Available plugins:
                    "dap",
                    -- "dashboard",
                    -- "gitsigns",
                    -- "hop",
                    "indent-blankline",
                    -- "lspsaga",
                    -- "mini",
                    -- "neogit",
                    -- "nvim-cmp",
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
                    borders = false, -- Disable borders between verticaly split windows
                    background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
                    term_colors = false, -- Prevent the theme from setting terminal colors
                    eob_lines = false -- Hide the end-of-buffer lines
                },

                high_visibility = {
                    lighter = false, -- Enable higher contrast text for lighter style
                    darker = false -- Enable higher contrast text for darker style
                },

                -- lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

                -- async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

                -- custom_colors = nil, -- If you want to everride the default colors, set this to a function

                -- custom_highlights = {}, -- Overwrite highlights with your own
            })
        end
    },

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
            require("colorizer").setup({ "css", "scss", "html", "javascript", "txt", "md", "lua" }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    -- { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end, },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 0 --autostart 0 = No, 1 = yes.
        end,
    },

    -- { 'tamton-aquib/staline.nvim', require("staline") },
    -- 'tamton-aquib/staline.nvim',

    -- "jackMort/ChatGPT.nvim",

    { "p00f/nvim-ts-rainbow" },

    { "mg979/vim-visual-multi" },

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
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },
    { 'manzeloth/live-server' },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require"lsp_signature".on_attach() end,
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
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
            "Gedit"
        },
        ft = {"fugitive"}
    },
    {
        "pwntester/octo.nvim",
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require("octo").setup()
        end,
    },
    {
        "ellisonleao/glow.nvim",
        -- "npxbr/glow.nvim",
        ft = {"markdown"}
        -- run = "yay -S glow"
    },
    { "machakann/vim-sandwich" },
    {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
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
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
}
