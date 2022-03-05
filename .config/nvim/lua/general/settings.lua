local set = vim.opt

--> General settings
set.wrap = true
set.ruler = false
set.conceallevel = 2
set.mouse = "a"
set.mousemodel = "popup"
set.encoding = "UTF-8"
set.fileencoding = "UTF-8"
set.scrolloff = 10
set.timeoutlen = 300
set.updatetime = 500
set.clipboard = "unnamedplus"
set.smarttab = true
set.backup = false
set.writebackup = false
set.cmdheight = 1
set.splitright = true
set.splitbelow = true
set.pumheight = 10
set.showmode = false
set.showtabline = 1
set.laststatus = 2
set.completeopt = "menu,menuone,noselect"

--> Search Settings
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true


--> Fold Settings
set.foldenable = false --or true
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldlevelstart = 10
vim.cmd [[set foldtext=luaeval(\"require('essentials').simple_fold()\")]]

--> Visual settings?
set.pumblend = 30
set.inccommand = "split"
-- set.termguicolors = true
-- set.background = "dark"
set.number = true
set.relativenumber = false
set.cursorline = false
set.signcolumn = "no"
set.title = true
set.titlestring = "  Editing %f..."
set.splitright = true           --Faz o vsplit a abrir à direita 
set.splitbelow = true           --Faz o split abrir abaixo 

--> Tabspace settings
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 0
set.expandtab = true
set.smartindent = true
set.autoindent = true
-- set.copyindent = true
-- set.breakindent = true
-- set.preserveindent = true

--> Misc settings
--set.guifont = "Operator Mono Medium"
set.history = 500
set.wildignore = { '*.pyc,__pycache__' }
set.wildmenu = true
set.wildmode = "longest,full"
-- set.wildmode = "list:longest"
set.fillchars:append({eob=' ', fold=' ', foldopen="", foldsep=" ", foldclose=""})
set.shortmess:append({c=true, s=true, A=true, W=true})
set.iskeyword:append('-')
-- set.t_Co = 256

--> Test settings

-- set.list = true
-- set.listchars = 'tab:▏ '
-- set.listchars = 'tab: '
-- set.lazyredraw = true
-- vim.cmd [[let &colorcolumn=join(range(81,999),",")]]

-- vim.cmd([[ set t_Co=256 ]])
set.syntax = "on"
-- "  set smarttab
-- "  set ai
-- "  set ic
-- "  set ve=all
-- "  set backspace=indent,eol,start
-- "  set scrolloff=10
-- "  set incsearch 
-- "  set showmatch  "Exibe o casamento de {}, [], () 
-- "  set nohlsearch
-- 
-- filetype plugin indent on
-- 
-- "Backspace respeitar indentação
-- set softtabstop=4 
-- 
-- "Trocar TAB por espaços 
-- set expandtab 
-- set smarttab
-- 
-- ""set paste
-- 
-- set ai
-- set ic
-- set ve=all
-- 
-- " Fix backspace indent
-- set backspace=indent,eol,start
--    
-- "Adiciona um menu suspenso de ajuda ao pressionar Tab
-- set wildmenu                
-- 
-- "Permite carregar arquivos na memória
-- "set hidden
-- 
-- " Mais espaço para a exibição de mensagens. 
-- set cmdheight=1
-- 
-- " Ir automaticamente para a próxima linha
-- set whichwrap+=<,h
-- set whichwrap+=>,l
-- 
-- set scrolloff=10
-- 
-- " Aprimoramento de pesquisa
-- set incsearch "Feedback de busca 
-- set smartcase
-- set ignorecase
-- 
-- " set hlsearch "Destacar resultados da busca 
-- set showmatch  "Exibe o casamento de {}, [], () 
-- set nohlsearch
-- 
-- "Por padrão o Vim armazena os ultimos 50 comandos digitados. Para alterar, edite a linha abixo. 
-- set history=200
-- 
-- ]])
--set guicursor




-- === TEMAS ===
-- vim.cmd([[ set bg=dark ]])
-- vim.cmd([[ cocolorscheme nightfox ]])
--vim.cmd([[ colorscheme onedark ]])
-- vim.cmd([[ onedark_option = { 'theme':  'darker',  transparent: v:true } ]])
--require('onedark').load()
--vim.cmd([[ colorscheme dracula ]])
--vim.cmd([[ colorscheme NeoSolarized ]])
--vim.cmd([[ set termguicolors ]])
--require('nightfox').load(nightfox)
--vim.cmd([[ hi! Normal guibg=NONE ctermbg=NONE ]])
--vim.cmd([[ highlight Normal guibg=NONE ctermbg=NONE ]])
--vim.cmd([[ let extension = expand('%:e') ]])
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
local ok, notify = pcall(require, "notify")
if ok then vim.notify = notify end
