vim.g.mapleader = ' '
local opts = {noremap=true, silent=true}
local function map(mode, key, mapping) vim.api.nvim_set_keymap(mode, key, mapping, opts) end

--> TEMP and TEST maps
map('n', '<leader>w',  ':lua require("general.utils").close_command()<CR>')
map('n', '<leader>m',  ':FocusMaximise<CR>')
map('n', '<leader>mp', ':MarkdownPreviewToggle<CR>')
--map('n', "c", '"_c')
--map('n', "C", '"_C')
map('n', '<leader>dd', ':lua require("duck").hatch()<CR>')
map('n', '<leader>dk', ':lua require("duck").cook()<CR>')
map('n', '<leader>n',  ":NvimTreeToggle<CR>")
map('n', '<M-h>',      ':lua vim.cmd(":h "..vim.fn.expand("<cword>").." | resize -6")<CR>')
-- map('n', '<RightMouse>', ':lua vim.lsp.buf.hover({focusable=false})<CR>')
-- map('n', '<LeftMouse>', ':lua vim.lsp.buf.signature_help({focusable=false})<CR>')
-- map('n', 'n', 'n:lua require("specs").show_specs()<CR>')
-- map('n', 'N', 'N:lua require("specs").show_specs()<CR>')

--> Packer commands
map('n', '<leader>ps', ':w<CR>:so %<CR>:PackerSync<CR>')
map('n', '<leader>pp', ':PackerProfile<CR>')
map('n', '<leader>pc', ':PackerCompile<CR>')

--> essentials.nvim mappings
map('n', '<F2>'     ,  ':lua require"essentials".rename()<CR>')
map('v', '<leader>/',  ':lua require"essentials".toggle_comment("nice")<CR>')
map('n', 'cc',  ':lua require"essentials".toggle_comment()<CR>')
map('n', '<leader>r',  ':w<CR>:lua require("essentials").run_file("horizontal")<CR>')
map('n', '<leader>s',  ':lua require"essentials".swap_bool()<CR>')
map('n', 'gx'       ,  ':lua require"essentials".go_to_url()<CR>')
map('v', 'gl'       ,  ':lua require"essentials".get_git_url()<CR>')
map('n', '<leader>cs', ':lua require"essentials".cheat_sh()<CR>')

--> LSP mappings
map('n', 'gd',    '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gD',    '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- map('n', 'gr',    '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gr',    ':NiceReference<CR>')
map('n', 'gi',    '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gh',    '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

--> Telescope mappings
map('n', '<leader>ff', ':lua require("telescope.builtin").find_files(require("general.utils").telescope_theme)<CR>')
map('n', '<leader>fg', ':Telescope live_grep theme=cursor previewer=false<CR>')
map('n', '<leader>fa', ':Telescope lsp_code_actions theme=cursor<cr>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>fc', ':Telescope commands theme=ivy<CR>')

--> WINDOW Control
map('n', '<C-h>',     '<C-w>h')
map('n', '<C-j>',     '<C-w>j')
map('n', '<C-k>',     '<C-w>k')
map('n', '<C-l>',     '<C-w>l')
map('n', '<M-Left>',  ':vertical resize +2<CR>')
map('n', '<M-Down>',  ':resize -2<CR>')
map('n', '<M-Up>',    ':resize +2<CR>')
map('n', '<M-Right>', ':vertical resize -2<CR>')

--> Move selected line / block of text in visual mode
map("x", "<M-k>", ":move '<-2<CR>gv-gv")
map("x", "<M-j>", ":move '>+1<CR>gv-gv")
map("n", "<M-j>", ":m .+1<CR>==")
map("n", "<M-k>", ":m .-2<CR>==")

--> OLD
--map('n', '<leader>a', 'ggVG')
--map('i', 'jk'       , '<Esc>')
--map('n', 'n'        , 'nzz')
map('n', '>'    , ':bnext<CR>')
map('n', '<'  , ':bprevious<CR>')
--map('n', '<C-s>'    , ':w<CR>')
--map('n', '<C-q>'    , ':q<CR>')
--map('v', '<'        , '<gv')
--map('v', '>'        , '>gv')

