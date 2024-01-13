-- bufferline.nvim
return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  version = '*',
  -- event = 'UIEnter',
  event = { 'BufAdd' },
  keys = {
    { '<Tab>',      '<cmd>BufferLineCycleNext<CR>',                              desc = 'Next buffer' },
    { '<S-Tab>',    '<cmd>BufferLineCyclePrev<CR>',                              desc = 'Previous buffer' },
    { '<S-l>',      '<cmd>BufferLineMoveNext<CR>',                               desc = 'Move current buffer forwards' },
    { '<S-h>',      '<cmd>BufferLineMovePrev<CR>',                               desc = 'Move current buffer backwards' },

    { '<leader>bl', '<cmd>BufferLineCycleNext<CR>',                              desc = 'Next' },
    { '<leader>bh', '<cmd>BufferLineCyclePrev<CR>',                              desc = 'Previous' },
    { '<leader>bL', '<cmd>BufferLineMoveNext<CR>',                               desc = 'Move forwards' },
    { '<leader>bH', '<cmd>BufferLineMovePrev<CR>',                               desc = 'Move backwards' },
    -- stylua: ignore start
    { '<leader>bB', function() return require('bufferline').move_to(1) end,      desc = 'Move buffer to beginning' },
    { '<leader>bE', function() return require('bufferline').move_to(-1) end,     desc = 'Move buffer to end' },
    { '<leader>b1', function() return require('bufferline').go_to(1, true) end,  desc = 'Jump to first' },
    { '<leader>b2', function() return require('bufferline').go_to(2, true) end,  desc = 'Jump to second' },
    { '<leader>b3', function() return require('bufferline').go_to(3, true) end,  desc = 'Jump to third' },
    { '<leader>b4', function() return require('bufferline').go_to(4, true) end,  desc = 'Jump to fourth' },
    { '<leader>b5', function() return require('bufferline').go_to(5, true) end,  desc = 'Jump to fifth' },
    { '<leader>b6', function() return require('bufferline').go_to(6, true) end,  desc = 'Jump to sixth' },
    { '<leader>b7', function() return require('bufferline').go_to(7, true) end,  desc = 'Jump to seventh' },
    { '<leader>b8', function() return require('bufferline').go_to(8, true) end,  desc = 'Jump to eighth' },
    { '<leader>b9', function() return require('bufferline').go_to(9, true) end,  desc = 'Jump to ninth' },
    { '<leader>b$', function() return require('bufferline').go_to(-1, true) end, desc = 'Jump to last' },
    -- stylua: ignore end
  },
  opts = {
    options = {
      numbers = function(opts)
        return string.format('%s', opts.ordinal)
      end,
      mode = 'buffers',
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(_, _, diag)
        local ret = (diag.error and ' ' .. diag.error .. ' ' or '')
            .. (diag.warning and ' ' .. diag.warning or '')
        return vim.trim(ret)
      end,
      right_mouse_command = 'vert sbuffer %d', -- can be a string | function, see "Mouse actions"
      left_mouse_command = 'buffer %d',        -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,              -- can be a string | function, see "Mouse actions"
      name_formatter = function(buf)           -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match('%.md') then
          return vim.fn.fnamemodify(buf.name, ':t:r')
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true,  -- whether or not tab names should be truncated
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
}
