M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

function _G.set_terminal_keymaps()
	vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

lvim.keys.normal_mode["<C-\\>"] = ":ToggleTerm dir=%:p:h<CR>" -- Open Terminal on current directory
-- keymap("n", "<C-\\>", "<cmd>ToggleTerm dir=%:p:h<cr>", opts)

-- Tabs --
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "<s-\\>", ":tabclose<cr>", opts)
-- keymap("n", "<s-\\>", ":tabonly<cr>", opts)

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")

-- Resize window
keymap("n", "<C-w><left>", "<C-w><")
keymap("n", "<C-w><right>", "<C-w>>")
keymap("n", "<C-w><up>", "<C-w>+")
keymap("n", "<C-w><down>", "<C-w>-")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<c-j>", "<c-d>", opts)
keymap("n", "<c-k>", "<c-u>", opts)
keymap("n", "<c-m>", "<s-m>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dp', opts)
keymap("v", "P", '"_dP', opts)

keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)

-- keymap(
--   "n",
--   "<F6>",
--   [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
--   opts
-- )
-- keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
-- keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
-- keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
-- keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)

-- keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- vim.api.nvim_set_keymap(
--   "n",
--   "<tab>",
--   "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
--   opts
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<s-tab>",
--   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
--   opts
-- )

-- vim.cmd [[
--   function! QuickFixToggle()
--     if empty(filter(getwininfo(), 'v:val.quickfix'))
--       copen
--     else
--       cclose
--     endif
--   endfunction
-- ]]

-- keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)

-- lvim.builtin.nvimtree.setup.view.mappings.list = {
--   { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
--   { key = "h", action = "close_node" },
--   { key = "v", action = "vsplit" },
--   { key = "<C-k>", action = "" },
--   { key = "C", action = "cd" },
-- }

lvim.builtin.which_key.mappings["t"] = {
	name = "Diagnostics",
	-- t = { "<cmd>TroubleToggle<cr>", "trouble" },
	-- w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
	-- d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
	-- q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
	-- l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
	-- r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
   t = { function() return require('trouble').toggle() end, 'Trouble' },
   w = { function() return require('trouble').toggle('workspace_diagnostics') end, 'Open workspace' },
   d = { function() return require('trouble').toggle('document_diagnostics') end, 'Open document' },
   q = { function() return require('trouble').toggle('quickfix') end, 'Open quickfix' },
   l = { function() return require('trouble').toggle('loclist') end, 'Open location list' },
   r = { function() return require('trouble').toggle('lsp_references') end, 'References' },
      -- { '<leader>xt', '<cmd>TodoTrouble<CR>', 'Todo (Trouble)' },
   T = { '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>', 'Todo/Fix/Fixme (Trouble)' },
}

lvim.builtin.which_key.mappings["E"] = {
	"<cmd>RnvimrToggle<cr>",
	"Ranger",
}

lvim.builtin.which_key.mappings["\\"] = {
	"<cmd>ToggleTerm dir=%:p:h<cr>",
	"Terminal",
}

-- lvim.builtin.which_key.mappings["B"] = {
--     "<cmd>Telescope buffers<cr>", "Buffers"
-- }

-- lvim.builtin.which_key.mappings["F"] = {
--     "<cmd>lua _FILE_BROWSER<cr>", "File-Browser",
-- }

function _LIVE_SERVER()
	if vim.bo.filetype == "html" then
		vim.cmd("LiveServer start")
	end
end

lvim.builtin.which_key.mappings["i"] = {
	name = "Interpreter",
	c = { "<cmd>lua _CARGO_TOGGLE()<cr>", "Rust" },
	j = { "<cmd>lua _JAVA_TOGGLE()<cr>", "Java" },
	n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Pyhon" },
	t = { "<cmd>lua _FLOAT_TERM()<cr>", "Shell" },
	l = { "<cmd>lua _LIVE_SERVER()<cr>", "LiveServer" },
}

lvim.builtin.which_key.mappings["r"] = {
	name = "Refactoring",
  e = { "<cmd>Refactor extract<cr>", "Extract" },
  E = { "<cmd>Refactor extract_to_file<cr>", "Extract to File" },
  v = { "<cmd>Refactor extract_var<cr>", "Extract var" },
  i = { "<cmd>Refactor inline_var<cr>", "Inline var" },
  f = { "<cmd>Refactor inline_func<cr>", "Inline func" },
  b = { "<cmd>Refactor extract_block<cr>", "Extract Block" },
  B = { "<cmd>Refactor extract_block_to_file<cr>", "Extract block to file" },
}

lvim.builtin.which_key.mappings["R"] = {
	"<cmd>lua _RUN_CODE()<cr>",
	"Run",
}

M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end
vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

return M
