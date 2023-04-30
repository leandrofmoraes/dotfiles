local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    -- completeopt = { "menuone", "noselect" },
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    -- foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
    foldmethod = "expr",
    -- foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    foldexpr = "nvim_treesitter#foldexpr()",
    foldlevelstart = 99,
    foldlevel = 99,
    foldenable = true,
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    -- hlsearch = false, -- highlight all matches on previous search pattern
    incsearch = true,
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    mousehide = true, -- hide mouse pointer while typing
    -- pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 4, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    breakindent = true, -- Every wrapped line will continue visually indented
    wrap = true, -- display lines as one long line
    linebreak = true,  -- wrap long lines at a blank
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    title = true, -- set the title of window to the value of the titlestring
    -- undodir = undodir, -- set an undo directory
    undofile = true, -- enable persistent undo
    updatetime = 100, -- faster completion
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    completeopt = "menuone", -- Set completeopt to have a better completion experience
    number = true, -- set numbered lines
    numberwidth = 2, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
    sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.
    showcmd = false,
    ruler = false,
    laststatus = 3,
    autochdir = true,
    -- shell="/usr/bin/zsh",
}

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
lvim.colorscheme = "lunar"
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

-- Indentlines
-- lvim.builtin.indentlines.options.char = ""
-- lvim.builtin.indentlines.options.show_first_indent_level = true
lvim.builtin.indentlines.options.show_current_context = true
lvim.builtin.indentlines.options.show_current_context_start = true
-- lvim.builtin.indentlines.options.use_treesitter = true

for k, v in pairs(options) do
  vim.opt[k] = v
end
