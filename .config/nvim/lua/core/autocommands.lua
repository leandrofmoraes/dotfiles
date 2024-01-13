-- Define local variables
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Remove trailing whitespaces
autocmd('BufWritePre', { group = augroup('trailing_space'), command = '%s/\\s\\+$//e' })

-- Highlight text on yank
-- autocmd('TextYankPost', {
--   group = augroup('highlight_yank'),
--   callback = function()
--     vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '700' })
--   end,
-- })

-- vim.cmd([[
-- augroup vimrc-incsearch-highlight
--   autocmd!
--   autocmd CmdlineEnter /,\? :set hlsearch
--   autocmd CmdlineLeave /,\? :set nohlsearch
-- augroup END
-- ]])

-- Automatically rebalance windows on vim resize
autocmd('VimResized', { group = augroup('resize_splits'), command = 'tabdo wincmd =' })

-- Never insert line as a comment when using 'o' to enter insert mode
autocmd('BufWinEnter', { group = augroup('no_comment_on_o'), command = 'setlocal formatoptions-=o' })

-- Close man and help with just <q>
autocmd('FileType', {
  group = augroup('close_with_q'),
  pattern = { 'help', 'man', 'lspinfo', 'checkhealth', 'qf', 'query', 'notify' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file where some intermediate directory does not exist
autocmd('BufWritePre', {
  group = augroup('auto_create_dir'),
  callback = function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Check for spelling in text filetypes and enable wrapping, and set gj and gk keymaps
autocmd('FileType', {
  group = augroup('wrap_spell'),
  pattern = { 'gitcommit', 'markdown', 'text', 'NeogitCommitMessage' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- Go to the last loc when opening a buffer
autocmd('BufReadPost', {
  group = augroup('last_loc'),
  callback = function(event)
    local exclude = { 'gitcommit', 'NeogitCommitMessage' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
      return
    end
    vim.b[buf].last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Check if the file needs to be reloaded when it's changed
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, { group = augroup('checktime'), command = 'checktime' })

-- Set cmdheight to 1 when recording, and put it back to normal when it stops
-- autocmd('RecordingEnter', {
--   group = augroup('macro_cmdheight_on'),
--   callback = function()
--     vim.opt.cmdheight = 1
--   end,
-- })
--
-- autocmd('RecordingLeave', {
--   group = augroup('macro_cmdheight_off'),
--   callback = function()
--     vim.opt.cmdheight = 0
--   end,
-- })

vim.api.nvim_create_autocmd({
  'WinScrolled',
  'BufWinEnter',
  'CursorHold',
  'InsertLeave',
  'BufWritePost',
  'TextChanged',
  'TextChangedI',
}, {
  group = vim.api.nvim_create_augroup('barbecue#create_autocmd', { clear = true }),
  callback = function()
    local winid = vim.api.nvim_get_current_win()
    local bufnr = vim.api.nvim_win_get_buf(winid)
    require('barbecue.ui').update(winid)
    if vim.bo[bufnr].filetype == 'neo-tree' then
      require('neo-tree.ui.selector').set_source_selector({
        winid = winid,
      })
    end
  end,
})

autocmd('ColorScheme', {
  group = augroup('nobg'),
  pattern = '*',
  callback = function()
    local hl_groups = {
      'Normal',
      'SignColumn',
      'NormalNC',
      'TelescopeBorder',
      'NvimTreeNormal',
      'NvimTreeNormalNC',
      'EndOfBuffer',
      'MsgArea',
      'NeoTreeNormal',
      'NeoTreeNormalNC',
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format('highlight %s ctermbg=none guibg=none', name))
      -- vim.api.nvim_set_hl(0, name, { bg = 'NONE', ctermbg = 'NONE' })
    end
  end,
})
vim.opt.fillchars = 'eob: '
