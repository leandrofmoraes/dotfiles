--> Noice icons:           
--> left_sep   :          
--> right_sep  :          
--> TODO: cleanup
local Styles = {}

-- require('stabline').setup {
-- 	style = "bar",
-- 	stab_left = "",
-- 	-- stab_right = "",
-- 	fg = "#986fec",
-- 	inactive_bg = "#11121d",
-- 	padding = 2
-- }

Styles.simple_line = {
	sections = {
		left = {
			'  ', 'mode', ' ', 'branch',
			function()
				if vim.o.columns > 100 then
					-- return '     '
					-- return '    '
					return '    '
				end
				return ''
			end
		},
		mid = { 'lsp', '%<' },
		right = { '%l/%L  :%c  ', 'file_name', '  ',
			function()
				local current_line = vim.fn.line "."
				local total_lines = vim.fn.line "$"
				local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
				local line_ratio = current_line / total_lines
				local index = math.ceil(line_ratio * #chars)
				return chars[index]
			end, ' '
		},
	},
	mode_colors = { n = "#94c461" },

	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " ",
		bg = "#11121d"
	}
}

Styles.pebble_line = {
	sections = {
		left = {
			' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
			'right_sep', '-file_name', 'left_sep', ' ',
			function()
				local head = vim.g.gitsigns_head or ""
				return (head ~= nil or head ~= "") and unpack({"   "..head}) or ""
			end,
		},
		mid = { 'lsp' },
		right= {
			'right_sep', '-cool_symbol', 'left_sep', '%< ',
			'right_sep', '- ', '-lsp_name', '- ', 'left_sep', ' ',
			'right_sep_double', '-line_column', 'left_sep_double', ' ',
		}
	},

	defaults = {
		--cool_symbol = "  ",
		cool_symbol = "  ",
		left_separator = "",
		right_separator = "",
		true_colors = true,
		line_column = "[%l:%c] 並%p%% ",
		mod_symbol = "nice"
	},
	--mode_colors = {
	--	n = "#94c461",
	--	i = "#94c461",
	--	ic = "#94c461",
	--	v = "#94c461",
	--}
	mode_colors = {
		--n = "#78d4ed",
		--n = "#008787",
		--c = "#c84364",
		--ic = "#bd93f9",
		n = "#12a7a7",
		--ic = "#1B5CA6",
		c = "#7123A6",
		--i = "#0BBD8A",
		i = "#4799eb",
		--v = "#F2B138",
		v = "#e4c079",
	}
}

require("staline").setup(Styles.pebble_line)

--> Bufferline
require('stabline').setup {
	style       = "bubble", -- others: bar, arrow, slant, bubble
	--stab_left   = "┃",   -- 😬
	--stab_right  = "",

	fg          = "#1e2127", --Default is fg of "Normal".
	--bg          = "#78d4ed",  --Default is bg of "Normal".
	--bg          = "#008787",  --Default is bg of "Normal".
	bg          = "#12a7a7",  --Default is bg of "Normal".
	--inactive_bg = "#1e2127",
	inactive_bg = "#1e2127",
	inactive_fg = "#aaaaaa",
	-- stab_bg     = Default is darker version of bg.,

	font_active = "bold",
	exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
	stab_start  = " ",   -- The starting of stabline
	stab_end    = "",
    padding = 1,
}
