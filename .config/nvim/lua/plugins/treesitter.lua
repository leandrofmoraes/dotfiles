return {
  -- nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      ensure_installed = {
        'lua',
        'luadoc',
        'luap',
        'cpp',
        'java',
        'markdown',
        'markdown_inline',
        'git_config',
        'git_rebase',
        'gitcommit',
        'gitignore',
        -- 'gitattributes',
        'diff',
        -- 'vim',
        'vimdoc',
        -- 'regex',
        'bash',
        'toml',
        'ssh_config',
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      -- vim-matchup config
      matchup = { enable = true, include_match_words = true, enable_quotes = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      -- Use the bash ts parser for zsh
      vim.treesitter.language.register('bash', 'zsh')
    end,
  },

  -- nvim-treesitter-context
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   event = { 'BufReadPost', 'BufNewFile' },
  --   config = true,
  -- },

  -- vim-matchup
  {
    'andymass/vim-matchup',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
      vim.g.matchup_matchparen_deferred = 1
    end,
  },

  -- treesj
  {
    'Wansmer/treesj',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = { max_join_length = 150 },
    keys = {
      -- stylua: ignore start
      { '<leader>m', function() return require('treesj').toggle() end, desc = 'Toggle node under cursor' },
      { '<leader>j', function() return require('treesj').join() end,   desc = 'Join node under cursor' },
      { '<leader>s', function() return require('treesj').split() end,  desc = 'Split node under cursor' },
      -- stylua: ignore end
    },
  },

  -- rainbow-delimiters.nvim
  {
    'hiphish/rainbow-delimiters.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  -- indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      indent = { char = '│', tab_char = '│' },
      scope = { enabled = false },
      exclude = { filetypes = { 'lazy', 'dashboard', 'mason' } },
    },
  },
}
