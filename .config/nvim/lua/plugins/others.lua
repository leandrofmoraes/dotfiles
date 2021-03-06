local M = {}

function M.indent_blankline()
	require("indent_blankline").setup{
		char = "▏", -- 
		show_current_context = true,
		--show_current_context = false,
		strict_tabs = true,
		filetype_exclude = {
			"TelescopePrompt", "help", "terminal", "dashboard", "NvimTree",
			"packer", "lspinfo", "lsp-installer"
		},
		buftype_exclude = { "terminal", "norg" }
	}
end

-- TODO: make this tidy :kek:
function M.specs()
	vim.cmd [[hi Specs guibg=#cccccc]]
	require('specs').setup{
		show_jumps  = true,
		min_jump = 1,
		popup = {
			-- delay_ms = 1, -- delay before popup displays
			inc_ms = 1, -- time increments used for fade/resize effects
			blend = 100, -- starting blend, between 0-100 (fully transparent), see :h winblend
			width = 6,
			winhl = "Specs",
			fader = require('specs').pulse_fader,
			resizer = require('specs').empty_resizer
		},
		-- ignore_filetypes = {},
		-- ignore_buftypes = {
			-- nofile = true,
		-- },
	}
end

function M.markdown_preview()
	vim.g.mkdp_refresh_slow = 1
	vim.g.mkdp_auto_close = 0
end

return M
