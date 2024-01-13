-- require "user.lsp.languages.python"
-- require "user.lsp.languages.js-ts"
-- require "user.lsp.languages.sh"
-- require "user.lsp.languages.emmet"
-- require "user.lsp.languages.css"
-- require "user.lsp.languages.arduino"
-- require "user.lsp.languages.arduino_language_server"

-- lvim.lsp.diagnostics.virtual_text = false

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "arduino_language_server" })

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--     { command = "google_java_format", filetypes = { "java" } },
--     { command = "stylua", filetypes = { "lua" } },
--     -- { command = "shfmt", filetypes = { "sh", "zsh" } },
--     { command = "prettier", filetypes = { "css" } },
-- }

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint_d", filetypes = { "javascript" } },
-- }

return {
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			notification = { window = { winblend = 0 } },
			logger = { level = vim.log.levels.OFF },
			progress = { suppress_on_insert = true, display = { render_limit = 3 } },
		},
	},

  -- actions-preview.nvim
  {
    'aznhe21/actions-preview.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    opts = {
      telescope = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = 'top',
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
    keys = {
      {
        'gf',
        function()
          return require('actions-preview').code_actions()
        end,
        mode = { 'n', 'v' },
        desc = 'Open actions',
      },
    },
  },
  -- nvim-lightbulb
  -- { 'kosayoda/nvim-lightbulb', event = 'LspAttach', opts = { autocmd = { enabled = true } } },
}
