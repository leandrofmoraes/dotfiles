-- require "user.lsp.languages.python"
-- require "user.lsp.languages.js-ts"
-- require "user.lsp.languages.sh"
-- require "user.lsp.languages.emmet"
-- require "user.lsp.languages.css"
require "user.lsp.languages.arduino"
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
