local icons = require('core.icons')
return {
  -- todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = true,
    keys = {
      -- stylua: ignore start
      { ']t', function() return require('todo-comments').jump_next() end, desc = 'Jump to next todo comment' },
      { '[t', function() return require('todo-comments').jump_prev() end, desc = 'Jump to previous todo comment' },
      -- stylua: ignore end
    },
  },

  -- nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disable_filetype = { 'TelescopePrompt', 'text' },
      disable_in_macro = false,
      check_ts = true,
    },
  },
  { 'machakann/vim-sandwich' },
  {
    'tpope/vim-surround',
  },

  -- trouble.nvim
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = { use_diagnostic_signs = true },
    keys = {
      -- stylua: ignore start
      { '<leader>xx', function() return require('trouble').toggle() end,                        desc = 'Toggle trouble.nvim' },
      { '<leader>xw', function() return require('trouble').toggle('workspace_diagnostics') end, desc = 'Open workspace diagnostics' },
      { '<leader>xd', function() return require('trouble').toggle('document_diagnostics') end,  desc = 'Open document diagnostics' },
      { '<leader>xq', function() return require('trouble').toggle('quickfix') end,              desc = 'Open quickfix' },
      { '<leader>xl', function() return require('trouble').toggle('loclist') end,               desc = 'Open location list' },
      { 'gR',         function() return require('trouble').toggle('lsp_references') end,        desc = 'References' },
      { '<leader>xt', '<cmd>TodoTrouble<CR>',                                                   desc = 'Todo (Trouble)' },
      { '<leader>xT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>',                           desc = 'Todo/Fix/Fixme (Trouble)' },
      -- stylua: ignore end
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').previous({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprevious)
            if not ok then
              ---@diagnostic disable-next-line: param-type-mismatch
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous trouble/quickfix item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              ---@diagnostic disable-next-line: param-type-mismatch
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next trouble/quickfix item',
      },
    },
  },

  -- vim-illuminate
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      -- providers = { 'lsp', 'treesitter', 'regex' },
      large_file_cuttoff = 2000,
      large_file_overrides = { providers = { 'lsp' } },
    },
    config = function(_, opts)
      require('illuminate').configure(opts)
      local function map(key, dir, buffer)
        vim.keymap.set('n', key, function()
          require('illuminate')['goto_' .. dir .. '_reference'](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
      end
      map(']]', 'next')
      map('[[', 'prev')
      -- Set it after loading ftplugins
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map(']]', 'next', buffer)
          map('[[', 'prev', buffer)
        end,
      })
    end,
    keys = { { ']]', desc = 'Next Reference' }, { '[[', desc = 'Prev Reference' } },
  },

  -- vim-cool
  { 'romainl/vim-cool',      keys = { '/', '?', '*', '#', 'g*', 'g#', 'n', 'N' } },
  -- HACK: There doesn't seem to be an autocommand event to detect when you start
  -- searching, so this will have to do until I can find an event for that or until neovim creates that event
  -- Related: https://github.com/neovim/neovim/issues/18879

  -- neo-tree.nvim
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    -- Load neo-tree.nvim if we provide a directory as an argument
    init = function()
      if vim.fn.argc(-1) == 1 then
        ---@diagnostic disable-next-line: param-type-mismatch
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == 'directory' then
          require('lazy').load({ plugins = { 'neo-tree.nvim' } })
        end
      end
    end,
    branch = 'v3.x',
    keys = { { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Open neo-tree.nvim' } },
    opts = {
      event_handlers = {
        {
          event = 'file_opened',
          handler = function()
            -- auto close
            require('neo-tree.command').execute({ action = 'close' })
          end,
        },
      },
      filesystem = {
        filtered_items = { hide_dotfiles = false, hide_by_name = { '.git' } },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
        },
      },
      window = {
        mappings = {
          ['h'] = {
            function(state)
              local node = state.tree:get_node()
              if node.type == 'directory' and node:is_expanded() then
                require('neo-tree.sources.filesystem').toggle_directory(state, node)
              else
                require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
              end
            end,
            desc = 'Open directory',
          },
          ['l'] = {
            function(state)
              local node = state.tree:get_node()
              if node.type == 'directory' then
                if not node:is_expanded() then
                  require('neo-tree.sources.filesystem').toggle_directory(state, node)
                elseif node:has_children() then
                  require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                end
              end
            end,
            desc = 'Close directory',
          },
          ['<space>'] = 'none',
        },
      },
    },
  },

  -- leap.nvim
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat', keys = { '.' } },
    keys = {
      { 's',  mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S',  mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')

      -- HACK: Until https://github.com/neovim/neovim/issues/20793 is fixed, keep this here
      -- Hide cursor while in using leap.nvim, restore it afterwards
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LeapEnter',
        callback = function()
          vim.cmd.hi('Cursor', 'blend=100')
          vim.opt.guicursor:append({ 'a:Cursor/lCursor' })
        end,
      })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LeapLeave',
        callback = function()
          vim.cmd.hi('Cursor', 'blend=0')
          vim.opt.guicursor:remove({ 'a:Cursor/lCursor' })
        end,
      })
    end,
  },

  -- flit.nvim
  {
    'ggandor/flit.nvim',
    dependencies = 'ggandor/leap.nvim',
    opts = { labeled_modes = 'nx' },
    keys = function()
      local ret = {}
      for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
  },

  -- zen-mode.nvim
  -- NOTE: I've not used this plugin in some time, maybe time to disable or give it the boot?
  {
    'folke/zen-mode.nvim',
    dependencies = {
      {
        'folke/twilight.nvim',
        keys = { { '<leader>t', '<cmd>Twilight<CR>', desc = 'Toggle twilight.nvim' } },
        config = true,
      },
    },
    opts = { plugins = { kitty = { enabled = true, font = '+4' } } },
    -- stylua: ignore
    keys = { { '<leader>z', function() return require('zen-mode').toggle() end, desc = 'Toggle zen-mode.nvim' } },
  },

  -- neogit
  {
    'NeogitOrg/neogit',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    cmd = 'Neogit',
    keys = {
      -- stylua: ignore start
      { '<leader>gg', function() return require('neogit').open() end,             desc = 'Open neogit' },
      { '<leader>gC', function() return require('neogit').open({ 'commit' }) end, desc = 'Open neogit commit popup' },
      -- stylua: ignore end
    },
    opts = {
      disable_insert_on_commit = 'auto',
      kind = 'replace',
      status = { recent_commit_count = 25 },
      integrations = { telescope = true },
      auto_show_console = false,
      telescope_sorter = function()
        return require('telescope').extensions.fzf.native_fzf_sorter()
      end,
    },
  },

  -- gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ 'BufRead' }, {
        group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
        callback = function()
          vim.fn.system('git -C ' .. '"' .. vim.fn.expand('%:p:h') .. '"' .. ' rev-parse')
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name('GitSignsLazyLoad')
            vim.schedule(function()
              require('lazy').load({ plugins = { 'gitsigns.nvim' } })
            end)
          end
        end,
      })
    end,
    ft = 'gitcommit',
    keys = {
      -- stylua: ignore start
      { '<leader>gj', function() return require('gitsigns').next_hunk() end,       desc = 'Next hunk' },
      { '<leader>gk', function() return require('gitsigns').prev_hunk() end,       desc = 'Previous hunk' },
      { '<leader>gl', function() return require('gitsigns').blame_line() end,      desc = 'Open git blame' },
      { '<leader>gp', function() return require('gitsigns').preview_hunk() end,    desc = 'Preview the hunk' },
      { '<leader>gr', function() return require('gitsigns').reset_hunk() end,      mode = { 'n', 'v' },      desc = 'Reset the hunk' },
      { '<leader>gR', function() return require('gitsigns').reset_buffer() end,    desc = 'Reset the buffer' },
      { '<leader>gs', function() return require('gitsigns').stage_hunk() end,      mode = { 'n', 'v' },      desc = 'Stage the hunk' },
      { '<leader>gS', function() return require('gitsigns').stage_buffer() end,    desc = 'Stage the buffer' },
      { '<leader>gu', function() return require('gitsigns').undo_stage_hunk() end, desc = 'Unstage the hunk' },
      { '<leader>gd', function() return require('gitsigns').diffthis() end,        desc = 'Open a diff' },
      { ']g',         function() return require('gitsigns').next_hunk() end,       desc = 'Next hunk' },
      { '[g',         function() return require('gitsigns').prev_hunk() end,       desc = 'Previous hunk' },
      -- stylua: ignore end
    },
    opts = {
      signs = {
        add = {
          hl = 'GitSignsAdd',
          text = icons.ui.BoldLineLeft,
          numhl = 'GitSignsAddNr',
          linehl = 'GitSignsAddLn',
        },
        change = {
          hl = 'GitSignsChange',
          text = icons.ui.BoldLineLeft,
          numhl = 'GitSignsChangeNr',
          linehl = 'GitSignsChangeLn',
        },
        delete = {
          hl = 'GitSignsDelete',
          text = icons.ui.Triangle,
          numhl = 'GitSignsDeleteNr',
          linehl = 'GitSignsDeleteLn',
        },
        topdelete = {
          hl = 'GitSignsDelete',
          text = icons.ui.Triangle,
          numhl = 'GitSignsDeleteNr',
          linehl = 'GitSignsDeleteLn',
        },
        changedelete = {
          hl = 'GitSignsChange',
          text = icons.ui.BoldLineLeft,
          numhl = 'GitSignsChangeNr',
          linehl = 'GitSignsChangeLn',
        },
      },
      signcolumn = true,
      -- numhl = false,
      numhl = true,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      status_formatter = nil, -- Use default
      update_debounce = 200,
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = { enable = false },
      -- signs = {
      --   add = { text = '+' },
      --   change = { text = '~' },
      --   delete = { text = '-' },
      --   topdelete = { text = '-' },
      --   changedelete = { text = '~' },
      -- },
      -- word_diff = true,
    },
  },

  -- toggleterm.nvim
  { import = 'plugins.toggleterm' },

  -- mini.bufremove
  {
    'echasnovski/mini.bufremove',
    keys = {
      {
        '<leader>bc',
        function()
          local bd = require('mini.bufremove').delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\nCancel')
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = 'Close',
      },
      -- stylua: ignore
      { '<leader>bK', function() require('mini.bufremove').delete(0, true) end, desc = 'Close forcefully' },
    },
  },

  -- mini.splitjoin
  {
    enabled = false,
    'echasnovski/mini.splitjoin',
    keys = {
      {
        'g/j',
        function() return require('mini.splitjoin').join() end,
        desc = 'Join',
      },
      {
        'g/s',
        function() return require('mini.splitjoin').split() end,
        desc = 'Split',
      },
    },
  },

  -- mini.trailspace
  --{ 'echasnovski/mini.trailspace', event = 'InsertEnter', config = true },

  -- BufOnly.nvim
  { 'numToStr/BufOnly.nvim',       keys = { { '<leader>bD', '<cmd>BufOnly<CR>', desc = 'Delete all other buffers' } } },

  -- highlight-undo.nvim
  { 'tzachar/highlight-undo.nvim', keys = { 'u', '<C-r>' },                                                           config = true },

  -- undotree
  {
    'mbbill/undotree',
    keys = { { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Open undo tree' } },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_ShortIndicators = 1
    end,
  },

  -- better-escape.nvim
  {
    'max397574/better-escape.nvim',
    event = 'InsertCharPre',
    opts = {
      mapping = { 'jj', 'jk' },
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
      end,
      timeout = 300,
    },
  },

  -- mini.move
  {
    'echasnovski/mini.move',
    config = true,
    keys = {
      { '<A-h>', mode = { 'n', 'v' }, desc = 'Block left' },
      { '<A-j>', mode = { 'n', 'v' }, desc = 'Block down' },
      { '<A-k>', mode = { 'n', 'v' }, desc = 'Block up' },
      { '<A-l>', mode = { 'n', 'v' }, desc = 'Block right' },
    },
  },

  -- persistence.nvim
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
    keys = {
      -- stylua: ignore start
      { '<leader>qs', function() return require('persistence').load() end,                desc = 'Restore the session for the current dir' },
      { '<leader>ql', function() return require('persistence').load({ last = true }) end, desc = 'Restore the last session' },
      { '<leader>qd', function() return require('persistence').stop() end,                desc = 'Stop persistence' },
      -- stylua: ignore end
    },
  },

  -- vim-kitty
  -- { 'fladson/vim-kitty', ft = 'kitty' },

  -- mini.surround
  {
    'echasnovski/mini.surround',
    keys = {
      { 'gza', mode = { 'n', 'v' },            desc = 'Add surrounding' },
      { 'gzd', desc = 'Delete surrounding' },
      { 'gzf', desc = 'Find right surrounding' },
      { 'gzF', desc = 'Find left surrounding' },
      { 'gzh', desc = 'Highlight surrounding' },
      { 'gzr', desc = 'Replace surrounding' },
      { 'gzn', desc = 'Updated n_lines' },
    },
    opts = {
      mappings = {
        add = 'gza',
        delete = 'gzd',
        find = 'gzf',
        find_left = 'gzF',
        highlight = 'gzh',
        replace = 'gzr',
        update_n_lines = 'gzn',
      },
    },
  },

  -- nvim-origami
  { 'chrisgrieser/nvim-origami', event = { 'BufReadPost', 'BufNewFile' }, config = true },
}
