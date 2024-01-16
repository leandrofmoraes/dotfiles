return {
  {
    'hrsh7th/nvim-cmp',
    -- event = 'InsertEnter',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'hrsh7th/cmp-buffer',   -- source for text in buffer
      'hrsh7th/cmp-path',     -- source for file system paths
      'onsails/lspkind.nvim', -- vs-code like pictograms
      'FelipeLema/cmp-async-path',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'windwp/nvim-autopairs',

      -- For vsnip users
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      -- For luasnip users.
      'saadparwaiz1/cmp_luasnip',       -- for autocompletion
      {
        'rafamadriz/friendly-snippets', -- useful snippets
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
      { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp', version = 'v2.*', config = true },
    },
    opts = function()
      vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

      local luasnip = require('luasnip')
      local cmp = require('cmp')
      local defaults = require('cmp.config.default')()
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      return {
        -- completion = { completeopt = 'menu,menuone' },
        confirm_opts = {
          behavior = require('cmp.types.cmp').ConfirmBehavior.Replace,
          select = false,
        },
        completion = {
          completeopt = 'menu,menuone,preview,noselect',
          keyword_length = 1,
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          ['<C-CR>'] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),

        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = 'buffer' } },
        }),
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({ { name = 'path' }, { name = 'cmdline' } }),
        }),

        sources = cmp.config.sources({
          { name = 'nvim_lsp',                group_index = 2 },
          { name = 'nvim_lua',                group_index = 2 },
          { name = 'luasnip',                 group_index = 2 },
          { name = 'buffer',                  group_index = 2 },
          { name = 'async_path',              group_index = 2 },
          { name = 'calc',                    group_index = 2 },
          { name = 'nvim_lsp_signature_help', group_index = 2 },
          { name = 'cmp_tabnine',             group_index = 2 },
          {
            name = 'copilot',
            group_index = 2,
            -- keyword_length = 0,
            -- max_item_count = 3,
            -- trigger_characters = {
            --   {
            --     '.',
            --     ':',
            --     '(',
            --     "'",
            --     '"',
            --     '[',
            --     ',',
            --     '#',
            --     '*',
            --     '@',
            --     '|',
            --     '=',
            --     '-',
            --     '{',
            --     '/',
            --     '\\',
            --     '+',
            --     '?',
            --     ' ',
            --     -- "\t",
            --     -- "\n",
            --   },
            -- },
          },
          {
            name = 'nvim_lsp',
            -- entry_filter = function(entry, ctx)
            --   local kind = require('cmp.types.lsp').CompletionItemKind[entry:get_kind()]
            --   if kind == 'Snippet' and ctx.prev_context.filetype == 'java' then
            --     return false
            --   end
            --   return true
            -- end,
          },
        }),

        formatting = {
          icons = require('core.icons').kind,
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            vim_item.dup = { buffer = 1, path = 1, nvim_lsp = 0 }
            local icons = require('core.icons')
            local kind = require('lspkind').cmp_format({
              -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
              mode = 'symbol_text',
              ellipsis_char = '...',
              maxwidth = 50,
              -- symbol_map = source_mapping,
            })(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            -- kind.kind = ' ' .. (strings[1] or '') .. ' '
            kind.kind = (strings[1] or '')
            if entry.source.name == 'calc' then
              -- Get the custom icon for 'calc' source
              local custom_menu_icon = {
                calc = ' 󰃬 ',
                --NOTE: requires a nerdfont to be rendered
                --you could include other sources here as well
              }
              -- Replace the kind glyph with the custom icon
              vim_item.kind = custom_menu_icon.calc
            end
            if entry.source.name == 'copilot' then
              vim_item.kind = icons.git.Octoface
              vim_item.kind_hl_group = 'CmpItemKindCopilot'
            end

            if entry.source.name == 'cmp_tabnine' then
              vim_item.kind = icons.misc.Robot
              vim_item.kind_hl_group = 'CmpItemKindTabnine'
            end

            if entry.source.name == 'crates' then
              vim_item.kind = icons.misc.Package
              vim_item.kind_hl_group = 'CmpItemKindCrate'
            end

            if entry.source.name == 'lab.quick_data' then
              vim_item.kind = icons.misc.CircuitBoard
              vim_item.kind_hl_group = 'CmpItemKindConstant'
            end

            if entry.source.name == 'emoji' then
              vim_item.kind = icons.misc.Smiley
              vim_item.kind_hl_group = 'CmpItemKindEmoji'
            end
            kind.menu = '   (' .. (strings[2] or '') .. ')'

            kind.menu = ({
              nvim_lsp = '(LSP)',
              emoji = '(Emoji)',
              path = '(Path)',
              calc = '(Calc)',
              cmp_tabnine = '(Tabnine)',
              vsnip = '(Snippet)',
              luasnip = '(Snippet)',
              buffer = '(Buffer)',
              tmux = '(TMUX)',
              copilot = '(Copilot)',
              treesitter = '(TreeSitter)',
            })[entry.source.name]
            return kind
          end,

          duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
          },
          duplicates_default = 0,
        },
        -- experimental = { ghost_text = { hl_group = 'CmpGhostText' } },
        -- sorting = defaults.sorting,
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
            require('cmp_tabnine.compare'),
            cmp.config.compare.abbr,
            cmp.config.compare.menu,
          }
        },
        window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
        -- view = { entries = { name = 'custom', selection_order = 'near_cursor' } },
      }
    end,
    -- config = function(_, opts)
    -- local cmp = require('cmp')
    -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    -- local luasnip = require('luasnip')
    -- -- local lspkind = require('lspkind')
    -- cmp.setup(opts)
    -- ---@diagnostic disable-next-line: missing-fields
    -- cmp.setup.cmdline('/', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = { { name = 'buffer' } },
    -- })
    -- ---@diagnostic disable-next-line: missing-fields
    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({ { name = 'path' }, { name = 'cmdline' } }),
    -- })
    -- -- nvim-autopairs integration
    -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    -- --end,
    --
    -- -- local has_words_before = function()
    -- --   unpack = unpack or table.unpack
    -- --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    -- -- end
    --
    -- -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    -- require('luasnip.loaders.from_vscode').lazy_load()
    -- --if vim.g.config.plugins.copilot.enable then
    -- --      local icons = require("user.utils.icons")
    -- --    table.insert(format.symbol_map, { Copilot = icons.apps.Copilot })
    -- --end
    -- local ok, lspkind = pcall(require, 'lspkind')
    -- if not ok then
    --   return
    -- end
    -- -- local function get_lsp_completion_context(completion, source)
    -- --   local config_ok, source_name = pcall(function()
    -- --     return source.source.client.config.name
    -- --   end)
    -- --   if not config_ok then
    -- --     return nil
    -- --   end
    -- --   if source_name == 'tsserver' or source_name == 'typescript-tools' then
    -- --     return completion.detail
    -- --   elseif source_name == 'pyright' then
    -- --     if completion.labelDetails ~= nil then
    -- --       return completion.labelDetails.description
    -- --     end
    -- --   end
    -- -- end
    -- cmp.setup({
    --   completion = {
    --     completeopt = 'menu,menuone,preview,noselect',
    --   },
    --   snippet = { -- configure how nvim-cmp interacts with snippet engine
    --     expand = function(args)
    --       luasnip.lsp_expand(args.body)
    --     end,
    --   },

    -- mapping = cmp.mapping.preset.insert({
    --   ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
    --   ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
    --   ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    --   ['<C-d>'] = cmp.mapping.scroll_docs(4),
    --   ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
    --   ['<C-e>'] = cmp.mapping.abort(), -- close completion window
    --   ['<CR>'] = cmp.mapping.confirm({ select = false }),
    --
    --   ['<Tab>'] = cmp.mapping(function(fallback)
    --     -- if cmp.visible() then
    --     --   cmp.select_next_item()
    --     -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
    --     -- that way you will only jump inside the snippet region
    --     if luasnip.expand_or_locally_jumpable() then
    --       luasnip.expand_or_jump()
    --     elseif has_words_before() then
    --       cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end, { 'i', 's' }),
    --
    --   ['<S-Tab>'] = cmp.mapping(function(fallback)
    --     -- if cmp.visible() then
    --     --   cmp.select_prev_item()
    --     if luasnip.jumpable(-1) then
    --       luasnip.jump(-1)
    --     else
    --       fallback()
    --     end
    --   end, { 'i', 's' }),
    -- }),

    -- sources for autocompletion
    -- sources = cmp.config.sources({
    --   { name = 'nvim_lsp' },
    --   { name = 'luasnip' }, -- snippets
    --   { name = 'buffer' }, -- text within current buffer
    --   { name = 'path' }, -- file system paths
    --   { name = 'emoji' },
    -- }),
    -- configure lspkind for vs-code like pictograms in completion menu
    -- formatting = {},
    -- },
    -- })
    -- end,
  },
  -- { "hrsh7th/cmp-nvim-lsp", lazy = true },
  -- { "saadparwaiz1/cmp_luasnip", lazy = true },
  -- { "hrsh7th/cmp-buffer", lazy = true },
  -- { "hrsh7th/cmp-path", lazy = true },
  -- {
  --   "hrsh7th/cmp-cmdline",
  --   lazy = true,
  -- },
}
