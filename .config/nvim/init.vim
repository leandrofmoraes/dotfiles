 if &compatible
      set nocompatible
  endif

" Install Plug if not already loaded
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC 
endif

"Para utilizar este arquivo de configuração tanto no vim quanto no neovim ou, até mesmo em outros sistemas operacionais com todos os plugins, é necessário instalar o gerenciador de plugins Vim-Plug.
 
"Para Linux (necessário o curl) - curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"Para o Linux com Neovim - sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

"Para windows (PowerShell) - iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni $HOME/vimfiles/autoload/plug.vim -Force

"Para o windows com Neovim - iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

"Após instalar o gerenciador de plugin, mova o arquivo de configuração para a pasta correspondente a versão utilizada e rode o comando " 
"PlugInstall - Para instalar plugins
" PlugClean - Para desinstalar plugins após ter removido ou comentado a linha correspondente.

" ===ALIASES DE COMANDO ===
":command <AliasName> <string of command to be aliased>
" :command :Cce :CocEnable
" :command :Ccd :CocDisable

"=== ATALHOS DE TECLADO ===
" let g:mapleader = ","
let g:mapleader = " "
let g:maplocalleader = ','

"Facilitar a navegação entre janelas
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"navegação entre os buffers
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>

" === INÍCIO DA ÁREA DE PLUGINS ===
call plug#begin('~/.vim/plugged')
"Após abrir o vim, use :PlugInstall para instalar os plugins após adicionar
"PlugUpdate [name ...] [#threads]	Instala ou atualiza  plugins
"PlugClean[!] Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade Upgrade vim-plug itself
"PlugStatus	Check the status of plugins

" === BUFEXPLORER ===
" Plug 'jlanzarotta/bufexplorer'

" === INTEGRAÇÃO COM GIT ===
Plug 'tpope/vim-fugitive'
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gr :Gremove<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gd :Gvdiff<CR>

" === AUTO-COMPLETE ===
Plug 'tpope/vim-surround'     "Selecione o texto desejado, pressione shift + s e informe qual par de caractere deseja usar"

Plug 'mattn/emmet-vim'
" let g:user_emmet_leader_key=','   ", ,"
let g:user_emmet_leader_key='<C-Z>' "Ctrl + z + ,"

" Habilita o emmet somente para arquivos HTML e CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" let g:Hexokinase_highlighters = [ 'virtual' ]

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Desabilitar coc na inicialização
let g:coc_start_at_startup=0
nnoremap <M-e> :CocEnable<cr>
nnoremap <M-d> :CocDisable<cr>

" Configuração do Coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"Colorir palavras chave
""syntax on
Plug 'sheerun/vim-polyglot'

" === VIM-TMUX-NAVIGATOR ===
Plug 'christoomey/vim-tmux-navigator'

" === VIM-CAPSLOCK
Plug 'tpope/vim-capslock'

" === SYNTASTIC ===
Plug 'vim-syntastic/syntastic'
" set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %Y\ %=\ %P%)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Por padrão, o Syntastic verifica se há erros sempre que você salva o arquivo. Para desativar isso remova o comentário da linha abaixo
""let g:syntastic_check_on_wq = 0
"Para configurar o Syntastic para carregar erros automaticamente na lista de locais
let g:syntastic_always_populate_loc_list = 1

"Por padrão, o Syntastic usa símbolos de seta para indicar a linha com erro.
"Para mudar isso, remova os comentários das linhas abaixo
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['check']
let g:syntastic_c_checkers = ['check']


" === AUTO-PAIRS ===
Plug 'jiangmiao/auto-pairs'
"fly mode
""let g:AutoPairsFlyMode = 1

" === NERDCOMMENTER ===
Plug 'preservim/nerdcommenter'
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map cc <Plug>NERDCommenterInvert


" === VIM IDENTLINE ===
Plug 'Yggdroot/indentLine'

" Oculta ou Mostra as IdentiLines
map <c-k>i :IndentLinesToggle<cr>
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" === THEMES ===
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'overcache/NeoSolarized'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'tomasiser/vim-code-dark'

" === Ctrl + P === "Desinstalado"
"Plug 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn|class))$'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
" let g:ctrlp_show_hidden = 1                                                                   
" let g:ctrlp_use_caching = 1

" === FZF ===
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

"nnoremap <c-p> :Files<cr>

" === DEVICONS ===
Plug 'ryanoasis/vim-devicons' 

" === NERDTree ===
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            " \ Plug 'ryanoasis/vim-devicons'

"mudar as setas padrão
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Mudar simbolos do netdtree-git-pĺugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"Atalhos de teclado para o NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"Inicie o NERDTree quando o Vim for iniciado sem argumentos de arquivo.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"Inicie o NERDTree quando o Vim iniciar com um argumento de diretório
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

"Inicie o NERDTree, a menos que um arquivo ou sessão seja especificado, por exemplo. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

"Abrir NerdTree por padrão à direita ou esquerda
let g:NERDTreeWinPos = "right"
" let g:NERDTreeWinPos = "left"

"Abrir o NERDTree existente em cada nova guia.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Sair do Vim se NERDTree for a única janela restante na única guia.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Inicie o NERDTree e coloque o cursor de volta na outra janela. 
""autocmd VimEnter * NERDTree | wincmd p

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" === VIm AIRLINE ===
Plug 'vim-airline/vim-airline'

set laststatus=2
" let g:airline_statusline_ontop=0

"Airline Themes
Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme = 'night_owl'
let g:airline_theme = 'dracula'
let g:airline_detect_spelllang=1
" let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1

" Configurações da tabline (top bar)
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#splits_min_count = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#formatter = 'default' 
" let g:airline_symbols_ascii = 1
"let g:airline_mode_map = {} " see source for the defaults
" let g:Powerline_symbols = 'fancy'
let g:airline_detect_spelllang=1

"Exibir um caminho curto na linha de status:
" let g:airline_stl_path_style = 'short'

"Exibir apenas um nome de arquivo na linha de status
" let g:airline_section_c_only_filename = 1

" ===> Personalizar simbolos da airline <===

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'

  let g:airline_left_sep            = ''
  " ""let g:airline_left_sep        = '▶'
  "
  let g:airline_left_alt_sep        = ''
  "" let g:airline_left_alt_sep     = '»'

  let g:airline_right_sep        = ''
  " let g:airline_right_sep         = '◀'
  " let g:airline_right_sep           = "\uE0B6"

  let g:airline_right_alt_sep    = ''
  " let g:airline_right_alt_sep     = '«'
  " let g:airline_right_alt_sep       = "uE0B7"

  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  " let g:airline_symbols.linenr    = '␊'
  " let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.branch    = ''
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.maxlinenr = ' ☰ '
  " let g:airline_symbols.dirty     = '⚡'
  let g:airline_symbols.colnr     = ' :'
  " let g:airline_symbols.linenr     = ' :'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
    "" powerline symbols
  let g:airline_left_sep           = ''
    let g:airline_left_sep           = "\uE0B4"    
  let g:airline_left_alt_sep       = ''
  let g:airline_right_sep          = ''
  let g:airline_right_alt_sep      = ''
    let g:airline_right_sep          = "\uE0B2"
  let g:airline_symbols.readonly   = ''
  " let g:airline_symbols.linenr     = ''
  "" let g:airline_symbols.branch   = ''
  let g:airline_symbols.branch    = '⎇'
  "" let g:airline_symbols.dirty     = '⚡'
  "" let g:airline_symbols.dirty     = '⚡'
  " " let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
endif

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#syntastic#enabled = 1
" let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#battery#enabled = 1
let g:airline#extensions#capslock#enabled = 1 "Habilita vim-capslock
let g:airline#extensions#capslock#symbol = 'CAPS'
" let g:airline#extensions#branch#empty_message = ''
let g:airline_enable_branch = 1
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

Plug 'ryanoasis/powerline-extra-symbols'

let g:airline_filetype_overrides = {
      \ 'coc-explorer':  [ 'CoC Explorer', '' ],
      \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
      \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
      \ 'gundo': [ 'Gundo', '' ],
      \ 'help':  [ 'Help', '%f' ],
      \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
      \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
      \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
      \ }

" === TMUXLINE ===
" Plug 'edkolev/tmuxline.vim'


if has('nvim')
    highlight VertSplit cterm=NONE guibg=#000819 guifg=#000819 ctermbg=NONE ctermfg=0
else
    highlight VertSplit cterm=NONE guibg=#000819 guifg=#000819 ctermbg=NONE ctermfg=0
    set fillchars=vert:\ , 
    ""set fillchars+=vert:\|  " add a bar for vertical splits
endif
"Colorir a divisória vertical
""set fillchars=vert:\ ,fold:-,diff:-
""set statusline=-        " hide file name in statusline
""set fillchars=stl:-     " fill active window's statusline with -
""set fillchars+=stlnc:-  " also fill inactive windows
""let g:gruvbox_vert_split='bg1'


" === MULTIPLOS CURSORES ===
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Fim da área de plugins
call plug#end()

" === SET THEMES ===
""colorscheme dracula 
""set background=dark

" set guioptions=egmrti
" set guioptions=mlrb
" set guifont=DroidSansMono\ Nerd\ Font\ Mono:h12
" set guifont=DroidSansMono\ Nerd\ Font\ 12

"Seleciona o tipo codificação
set encoding=UTF-8 "Visualização na codificação
set fileencoding=utf-8 "Salvar na codificação
"set bomb

"Ativar a numerarão de linhas
set number

"Exibe em qual linha está o cursor
""set cursorline

filetype plugin indent on

"ativa o compartilhamento de área de transferência entre o Vim e a interface gráfica
""set clipboard=unnamedplus
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" ao teclar a barra de espaço no modo normal, o Vim irá contrair ou expandir o bloco de código do cursor
" foldlevel é a partir de que nível de indentação o código iniciará contraido
" set foldmethod=syntax
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Configura a quantidade de espaço de tabulação
set tabstop=4
set shiftwidth=4

"Backspace respeitar indentação
set softtabstop=4 

"Trocar TAB por espaços 
set expandtab 

set smarttab

" ativar indentação automática
set autoindent
set smartindent
set copyindent

""set paste

set ai
set ic
set ve=all
"" Fix backspace indent
set backspace=indent,eol,start

autocmd Filetype gitcommit setlocal spell textwidth=72
   
"Adiciona um menu suspenso de ajuda ao pressionar Tab
set wildmenu                
""set wildmode=list:longest

"Exige uma confirmação interativa ao sair do vim sem salvar
"set confirm
 
"Permite carregar arquivos na memória
set hidden

" Mais espaço para a exibição de mensagens. 
set cmdheight=1

"Exibe o nome do arquivo na barra de titulo
set title
" if has('title') && (has('gui_running') || &title)
    " set titlestring=
    " set titlestring+=%f
    " set titlestring+=%h%m%r%w
    " set titlestring+=\ -\ %{v:progname}
    " set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
" endif

" Salva automaticamente a cada edição
""set autowrite

" Configura o comportamento de divisão de tela 
set splitright "Faz o vsplit a abrir à direita 
set splitbelow "Faz o split abrir abaixo 

"Usar o mouse
set mouse=a
set mousemodel=popup

" Ir automaticamente para a próxima linha
set whichwrap+=<,h
set whichwrap+=>,l

set scrolloff=10

" Aprimoramento de pesquisa
set incsearch "Feedback de busca 
set smartcase
set ignorecase
" set hlsearch "Destacar resultados da busca 
set showmatch  "Exibe o casamento de {}, [], () 
set nohlsearch

"Por padrão o Vim armazena os ultimos 50 comandos digitados. Para alterar, edite a linha abixo. 
set history=200

" function! NeatFoldText()
	" let line = getline(v:foldstart)

	" let nucolwidth = &fdc + &number * &numberwidth
	" let windowwidth = winwidth(0) - nucolwidth - 3
	" let foldedlinecount = v:foldend - v:foldstart

    "" expand tabs into spaces
	" let onetab = strpart('          ', 0, &tabstop)
	" let line = substitute(line, '\t', onetab, 'g')

	" let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
	" let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
	" return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
" endfunction

" set foldtext=NeatFoldText()

" lua <<EOF
 " print("Seja bem-vindo ao Neovim!")
" EOF

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

