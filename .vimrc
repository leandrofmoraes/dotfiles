
colorscheme jellybeans
filetype plugin on
set backup " creates a backup file
set clipboard=unnamedplus " allows neovim to access the system clipboard
set cmdheight=1 " more space in the neovim command line for displaying messages
"set completeopt="menue"  "{"menue" "noselect" "preview" "noinsert" "longest" "menuone" "noselect" "preview"}
set conceallevel=0 " so that `` is visible in markdown files
set fileencoding=utf-8 " the encoding written to a file
set encoding=utf-8
set nocompatible
"set foldmethod  "manual" " folding set to "expr" for treesitter based folding
set foldmethod=expr
"set foldexpr  "" " set to "nvim_treesitter#foldexpr()" for treesitter based folding
"set foldexpr  "nvim_treesitter#foldexpr()"
set foldlevelstart=99
set foldlevel=99
set foldenable  
set guifont=mospace:h17 " the ft used in graphical neovim applicatis
set hidden " required to keep multiple buffers and open multiple buffers
set ignorecase " ignore case in search patterns
set mouse=a " allow the mouse to be used in neovim
set mousehide " hide mouse pointer while typing
"set pumheight  10 " pop up menu height
"set noshowmode " we d't need to see things like " INSERT " anymore
set showtabline=4 " always show tabs
set smartcase  " smart case
set smartindent  " make indenting smarter again
set breakindent  " Every wrapped line will ctinue visually indented
set wrap  " display lines as e lg line
set linebreak   " wrap lg lines at a blank
set splitbelow  " force all horiztal splits to go below current window
set splitright  " force all vertical splits to go to the right of current window
"set swapfile=off " creates a swapfile
set termguicolors  " set term gui colors (most terminals support this)
set timeoutlen=1000 " time to wait for a mapped sequence to complete (in millisecds)
set title " set the title of window to the value of the titlestring
"set undodir  undodir " set an undo directory
set undofile  " enable persistent undo
set updatetime=100 " faster completi
"set writebackup=off " if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
set nobackup
set expandtab  " cvert tabs to spaces
set shiftwidth=4 " the number of spaces inserted for each indentati
set tabstop=4 " insert 2 spaces for a tab
set cursorline  " highlight the current line
set number " set numbered lines
set numberwidth=2 " set number column width to 2 {default 4}
set signcolumn=auto " always show the sign column otherwise it would shift the text each time
set scrolloff=8 " minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=8 " minimal number of screen lines to keep left and right of the cursor.
set noshowcmd
set noruler
set laststatus=2
set autochdir 
set shell=/usr/bin/zsh
"set hlsearch=off " highlight all matches  previous search pattern
set incsearch 
set fillchars=vert:\ , 
set wildmode=longest,list,full
set wildmenu
syntax on

if !has('gui_running')
  set t_Co=256
endif

hi Normal guibg=NONE ctermbg=NONE

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /\? :set hlsearch
  autocmd CmdlineLeave /\? :set nohlsearch
augroup END

"-- PLUGINS --
call plug#begin()

Plug 'terryma/vim-multiple-cursors'
Plug 'ObserverOfTime/coloresque.vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

call plug#end()

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
