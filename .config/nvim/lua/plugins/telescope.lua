local buffers_list = function()
  require('telescope.builtin').buffers({
    previewer = false,
    hidden = true,
    theme = 'dropdown',
    layout_strategy = 'horizontal',
    layout_config = { height = 20, width = 60 },
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
    -- layout_config = { height = 40 },
    layout_config = { height = 30, width = 150 },
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    -- layout_strategy = 'bottom_pane',
  })
end

local live_grep = function()
  require('telescope.builtin').live_grep({
    sorting_strategy = 'ascending',
    layout_strategy = 'bottom_pane',
    prompt_prefix = '>> ',
  })
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      config = function()
        require('telescope').load_extension('fzf')
      end,
    },
    {
      "ahmedkhalf/project.nvim",
      opts = {
        manual_mode = true,
      },
      event = "VeryLazy",
      config = function(_, opts)
        require("project_nvim").setup(opts)
        require("lazyvim.util").on_load("telescope.nvim", function()
          require("telescope").load_extension("projects")
        end)
      end,
      keys = {
        { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
      },
    },
  },
  branch = '0.1.x',
  cmd = 'Telescope',
  keys = {
    -- stylua: ignore start
    { '<leader>ff',       function() return require('telescope.builtin').find_files() end,               desc = 'Files' },
    { '<leader>fw',       function() return require('telescope.builtin').live_grep() end,                desc = 'Words' },
    { '<leader>fb',       buffers_list,                                                                  desc = 'Buffers' },
    { '<leader><leader>', buffers_list,                                                                  desc = 'Buffers' },
    { '<leader>fh',       function() return require('telescope.builtin').help_tags() end,                desc = 'Help' },
    { '<leader>fm',       function() return require('telescope.builtin').man_pages() end,                desc = 'Man pages' },
    { '<leader>fr',       function() return require('telescope.builtin').oldfiles() end,                 desc = 'Recently opened' },
    { '<leader>fR',       function() return require('telescope.builtin').registers() end,                desc = 'Registers' },
    { '<leader>fk',       function() return require('telescope.builtin').keymaps() end,                  desc = 'Keymaps' },
    { '<leader>fc',       function() return require('telescope.builtin').commands() end,                 desc = 'Commands' },
    { '<leader>fC',       function() return require('telescope.builtin').command_history() end,          desc = 'Command history' },
    { '<leader>fl',       function() return require('telescope.builtin').resume() end,                   desc = 'Resume' },
    { '<leader>fd',       function() return require('telescope.builtin').diagnostics({ bufnr = 0 }) end, desc = 'Document diagnostics' },
    { '<leader>fD',       function() return require('telescope.builtin').diagnostics() end,              desc = 'Workspace diagnostics' },
    { '<leader>fs',       function() return require('telescope.builtin').lsp_document_symbols() end,     desc = 'Document symbols' },
    { '<leader>ft',       '<cmd>TodoTelescope<CR>',                                                      desc = 'Todo' },
    { '<leader>fT',       '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>',                              desc = 'Todo/Fix/Fixme' },
    { '<leader>go',       function() return require('telescope.builtin').git_status() end,               desc = 'Search through changed files' },
    { '<leader>gb',       function() return require('telescope.builtin').git_branches() end,             desc = 'Search through git branches' },
    { '<leader>gc',       function() return require('telescope.builtin').git_commits() end,              desc = 'Search and checkout git commits' },
    { '<leader>gO',       function() return require('telescope.builtin').git_stash() end,                desc = 'Search through stash' },
    {
      '<leader>fF',
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root
        })
      end,
      desc = "Find Plugin File"
    },
    {
      ';f',
      function()
        return require("telescope.builtin").find_files({
          no_ignore = false,
          hidden = true,
        })
      end,
      desc = "Lists files in your current working directory, respects .gitignore",
    },
    { ';w', live_grep,    desc = "Search String" },
    { ";b", buffers_list, desc = "Lists open buffers" },
    {
      ';h',
      function()
        local builtin = require("telescope.builtin")
        builtin.help_tags()
      end,
      desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
    },
    {
      ';k',
      function()
        return require('telescope.builtin').keymaps()
      end,
      desc = 'Keymaps'
    },
    {
      ';l',
      function()
        return require("telescope.builtin").resume()
      end,
      desc = "Resume the previous telescope picker",
    },
    { ';D',         function() return require('telescope.builtin').diagnostics() end, desc = 'Workspace diagnostics' },
    {
      ";s",
      function()
        local builtin = require("telescope.builtin")
        builtin.treesitter()
      end,
      desc = "Lists Function names, variables, from Treesitter",
    },
    { ';.',         file_browser,                                                     desc = "File Browser" },
    { '<leader>fe', file_browser,                                                     desc = "File Browser" },
  },
  opts = function()
    -- File and text search in hidden files and directories
    local telescopeConfig = require('telescope.config')
    -- local telescope = require('telescope')
    local actions = require('telescope.actions')
    local fb_actions = require('telescope').extensions.file_browser.actions

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, '--hidden')
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, '--glob')
    table.insert(vimgrep_arguments, '!**/.git/*')

    return {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        mappings = { n = { ['q'] = actions.close } },
        -- mappings = { n = {} },
        vimgrep_arguments = vimgrep_arguments,
        -- theme = 'tokyonight',
        -- path_display = { 'smart' },
        file_ignore_patterns = { '.git/' },
        -- layout_strategy = 'horizontal',
        layout_strategy = 'bottom_pane',
        layout_config = { prompt_position = 'top' },
        -- layout_config = {},
        sorting_strategy = 'ascending',
        wrap_results = true,
        winblend = 0,
      },
      -- pickers = { find_files = { find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' } } },
      pickers = {
        diagnostics = {
          theme = 'ivy',
          initial_mode = 'normal',
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      },
      extensions = {
        file_browser = {
          theme = 'ivy', --'dropdown',
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ['n'] = {
              -- your custom normal mode mappings
              ['N'] = fb_actions.create,
              ['h'] = fb_actions.goto_parent_dir,
              ['/'] = function()
                vim.cmd('startinsert')
              end,
              ['<C-u>'] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ['<C-d>'] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ['<PageUp>'] = actions.preview_scrolling_up,
              ['<PageDown>'] = actions.preview_scrolling_down,
            },
          },
        },
      },
      require('telescope').load_extension('fzf'),
      require('telescope').load_extension('file_browser'),
    }
  end,
}
