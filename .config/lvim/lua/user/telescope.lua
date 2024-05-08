-- lvim.builtin.telescope.on_config_done = function(telescope)
--   pcall(telescope.load_extension, "file_browser")
  -- pcall(telescope.load_extension, "projects")
-- end
local builtin = require("telescope.builtin")

local buffers_list = function()
  require('telescope.builtin').buffers({
    previewer = false,
    hidden = true,
    theme = 'dropdown',
    layout_strategy = 'horizontal',
    layout_config = { height = 20, width = 60 },
  })
end

local live_grep = function()
  require("telescope.builtin").live_grep({
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    -- prompt_prefix = ">> ",
  })
end

local file_browser = function()
  local telescope = require('telescope')

  local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
  end

  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    -- previewer = false,
    initial_mode = 'normal',
    -- layout_config = { height = 30 },
    layout_config = { height = 30, width = 150 },
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    -- layout_strategy = 'bottom_pane',
  })
end

return {
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

  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
      },
    },
  },

  {
    "telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require('telescope').load_extension('fzf')
        end,
      },
      "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
      {
        "ahmedkhalf/project.nvim",
        -- opts = {
            -- manual_mode = true,
        -- },
        event = "VeryLazy",
        -- lvim.builtin.telescope.on_config_done {
          config = function()
            require("telescope").load_extension("projects")
          end,
        -- }
      },
      -- {
      --   "nvim-telescope/telescope-project.nvim",
      --   event = "BufWinEnter",
      --   setup = function()
      --     vim.cmd [[packadd telescope.nvim]]
      --   end,
      -- },
    },
    keys = {
      {
        ";;",
        function()
          builtin.find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        function()
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      { "<leader>bf", buffers_list, desc = "Buffers List" },
      { "<leader><leader>", buffers_list, desc = "Buffers Lists" },
      { ";.", file_browser, desc = "File Browser" },
      { ";w", live_grep, desc = "Search a string" },
      { ';u', '<cmd>Telescope undo<cr>', desc = 'Undo History' },
      { '<leader>u', '<cmd>Telescope undo<cr>', desc = 'Undo History' },
      {
        ";T",
        function()
          -- local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";R",
        function()
          -- local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";d",
        function()
          -- local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          -- local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local telescopeConfig = require('telescope.config')
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      opts.defaults = {
        -- lvim.builtin.telescope.defaults = {
        wrap_results = true,
        -- layout_strategy = "horizontal",
        layout_strategy = 'bottom_pane',
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = { '.git/' },
        winblend = 0,
        mappings = {
          n = {},
        },
      -- })
      }
      -- lvim.builtin.telescope.pickers = {
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      -- lvim.builtin.telescope.extensions = {
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension('undo')
      -- require("telescope").load_extension("projects")
    end,
  },
}
