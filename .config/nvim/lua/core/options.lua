-- local opt = vim.opt
local g = vim.g

local options = {
  -- Cursor highlighting
  cursorline = true, -- highlight the current line
  cursorcolumn = false,

  -- Pane splitting
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window

  -- Keep cursor to the same screen line when opening a split
  splitkeep = 'screen',

  -- Searching
  smartcase = true,  -- smart case
  ignorecase = true, -- ignore case in search patterns
  incsearch = true,
  -- hlsearch = false,  -- highlight all matches on previous search pattern

  -- Make terminal support truecolor
  termguicolors = true, -- set term gui colors (most terminals support this)

  -- Make neovim use the system clipboard
  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard

  -- Disable old vim status
  showmode = false, -- we don't need to see things like -- INSERT -- anymore

  -- Set relative line numbers
  number = true,   -- set numbered lines
  relativenumber = false,
  numberwidth = 2, -- set number column width to 2 {default 4}

  -- Tab config
  expandtab = true,   -- convert tabs to spaces
  smartindent = true, -- make indenting smarter again
  shiftwidth = 2,     -- the number of spaces inserted for each indentation
  tabstop = 2,        -- insert 2 spaces for a tab
  shiftround = true,

  -- Code folding
  foldlevel = 99,
  foldlevelstart = 99,
  -- foldcolumn = '1',
  -- foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  foldmethod = 'expr',
  -- foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldenable = true,

  -- Decrease update time
  updatetime = 100, -- faster completion

  -- Disable swapfile
  swapfile = false, -- creates a swapfile

  -- Enable persistent undo
  undofile = true, -- enable persistent undo
  -- undodir = undodir, -- set an undo directory

  -- Always show tabline
  showtabline = 0, -- 4

  -- Mouse support
  mouse = 'a',      -- allow the mouse to be used in neovim
  mousehide = true, -- hide mouse pointer while typing

  -- Scrolloff
  scrolloff = 8,     -- minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.

  -- Disable wrapping
  wrap = true,      -- display lines as one long line
  linebreak = true, -- wrap long lines at a blank

  -- Show invisible characters
  list = true,

  -- Fill chars
  fillchars = { eob = ' ', diff = '╱', fold = ' ', foldsep = ' ', foldopen = '', foldclose = '' },

  -- Enable lazy redraw for performance
  -- lazyredraw = true,

  -- Have the statusline only display at the bottom
  laststatus = 3,

  -- Confirm to save changed before exiting the modified buffer
  -- confirm = true,

  -- Hide * markup for bold and italic
  conceallevel = 3, --0 -- so that `` is visible in markdown files

  -- Hide the command line unless needed
  cmdheight = 1, -- 0 -- more space in the neovim command line for displaying messages

  -- Use ripgrep as the grep program for neovim
  grepprg = 'rg --vimgrep',

  -- Set the grep format
  grepformat = '%f:%l:%c:%m',

  -- Set completion options
  completeopt = 'menu,menuone,noselect', -- "menuone", -- Set completeopt to have a better completion experience

  -- Set key timeout to 1000ms
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)

  -- Window config
  winwidth = 5,
  winminwidth = 5,
  equalalways = false,

  -- Always show the signcolumn
  signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time

  -- Formatting options
  formatoptions = 'jcroqlnt', -- This is a sequence of letters which describes how automatic formatting is to be done.

  -- Put the cursor at the start of the line for large jumps
  startofline = true,

  -- Allow cursor to move where this is no text is visual block mode
  virtualedit = 'block',

  -- Command-line completion mode
  wildmode = 'longest:full,full',

  -- Session save options
  -- sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' },

  -- Enable autowrite
  -- autowrite = true,

  -- Maximum number of undo changes
  -- undolevels = 10000,

  -- Number of items in a completion menu
  pumheight = 10,            -- 20, -- pop up menu height

  backup = false,            -- creates a backup file
  fileencoding = 'utf-8',    -- the encoding written to a file
  guifont = 'monospace:h17', -- the font used in graphical neovim applications
  hidden = true,             -- required to keep multiple buffers and open multiple buffers
  breakindent = true,        -- Every wrapped line will continue visually indented
  title = true,              -- set the title of window to the value of the titlestring
  writebackup = false,       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  showcmd = true,
  ruler = false,
  autochdir = true,
  -- shell="/usr/bin/zsh",

  -- Session save options
  sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' },
}

vim.cmd([[
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]])

-- Disable lsp logging
vim.lsp.set_log_level('OFF')

-- Disable certain builtins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_logipat = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_fzf = 1

-- Disable provider warnings in the healthcheck
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0

-- shortmess options
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.spelllang:append('cjk') -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append('c')   -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append('I')   -- don't show the default intro message
vim.opt.whichwrap:append('<,>,[,],h,l')

vim.filetype.add({
  extension = {
    tex = 'tex',
    zir = 'zir',
    cr = 'crystal',
  },
  pattern = {
    ['[jt]sconfig.*.json'] = 'jsonc',
  },
})

for k, v in pairs(options) do
  vim.opt[k] = v
end

local icons = require('core.icons')
local default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = 'DiagnosticSignError', text = icons.diagnostics.Error },
      { name = 'DiagnosticSignWarn',  text = icons.diagnostics.Warning },
      { name = 'DiagnosticSignHint',  text = icons.diagnostics.Hint },
      { name = 'DiagnosticSignInfo',  text = icons.diagnostics.Information },
    },
  },
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}
vim.diagnostic.config(default_diagnostic_config)
