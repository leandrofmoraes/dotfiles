-- local opt = vim.opt

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
  smartcase = true, -- smart case
  ignorecase = true, -- ignore case in search patterns
  incsearch = true,

  -- Make terminal support truecolor
  termguicolors = true, -- set term gui colors (most terminals support this)

  -- Make neovim use the system clipboard
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard

  -- Disable old vim status
  showmode = false, -- we don't need to see things like -- INSERT -- anymore

  -- Set relative line numbers
  number = true, -- set numbered lines
  relativenumber = false,
  numberwidth = 2, -- set number column width to 2 {default 4}

  -- Tab config
  expandtab = true, -- convert tabs to spaces
  smartindent = true, -- make indenting smarter again
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  shiftround = true,

  -- Code folding
  foldlevel = 99,
  foldlevelstart = 99,
  -- foldcolumn = '1',
  -- foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  foldmethod = "expr",
  -- foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  foldexpr = "nvim_treesitter#foldexpr()",
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
  mouse = "a", -- allow the mouse to be used in neovim
  mousehide = true, -- hide mouse pointer while typing

  -- Scrolloff
  scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.

-- Disable wrapping
  wrap = true, -- display lines as one long line
  linebreak = true,  -- wrap long lines at a blank

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
  conceallevel = 3, -- so that `` is visible in markdown files

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
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time

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
  pumheight = 20, -- 10, -- pop up menu height

    backup = false, -- creates a backup file
    fileencoding = "utf-8", -- the encoding written to a file
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    -- hlsearch = false, -- highlight all matches on previous search pattern
    breakindent = true, -- Every wrapped line will continue visually indented
    title = true, -- set the title of window to the value of the titlestring
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    showcmd = true,
    ruler = false,
    autochdir = true,
    -- shell="/usr/bin/zsh",
}

-- shortmess options
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })

vim.cmd([[
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]])

--lvim options
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "github_dark"
-- lvim.colorscheme = "github_dimmed"
-- lvim.colorscheme = "nightfox"
-- lvim.colorscheme = "nightfly"
-- lvim.colorscheme = "tokyonight"
lvim.colorscheme = "tokyonight-storm"
-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "onenord"

lvim.transparent_window = true

-- lualine options
-- lvim.builtin.lualine.style = "default"

lvim.log.level = "warn"
lvim.format_on_save = false
-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
    -- "java",
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true

-- NvimTree
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true
-- lvim.builtin.nvimtree.setup.view.signcolumn = "no"

-- Treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "markdown",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.rainbow.enable = true  -- rainbow parentheses
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.cmp.cmdline.enable = true

lvim.builtin.project.on_config_done = {
  config = function()
    require("project_nvim").setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      }
    }
  end
}

-- Indentlines
-- lvim.builtin.indentlines.options.char = ""
-- lvim.builtin.indentlines.options.show_first_indent_level = true
-- lvim.builtin.indentlines.options.show_current_context = false
-- lvim.builtin.indentlines.options.show_current_context_start = true
-- lvim.builtin.indentlines.options.use_treesitter = true

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end

for k, v in pairs(options) do
  vim.opt[k] = v
end
