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
  -- none-ls.nvim
  {
    'nvimtools/none-ls.nvim',
    main = 'null-ls',
    dependencies = {
      -- mason-null-ls.nvim
      {
        'jay-babu/mason-null-ls.nvim',
        dependencies = 'williamboman/mason.nvim',
        cmd = { 'NullLsInstall', 'NullLsUninstall', 'NoneLsInstall', 'NoneLsUninstall' },
        opts = {
          ensure_installed = { 'stylua', 'markdownlint', 'mdformat', 'selene', 'cpplint', 'clang_format', 'beautysh' },
          handlers = {},
        },
      },
      'nvim-lua/plenary.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local nls = require('null-ls')
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      return {
        log_level = 'off',
        sources = {
          -- lua
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.selene,
          -- markdown
          nls.builtins.formatting.mdformat,
          -- nls.builtins.formatting.markdownlint,
          nls.builtins.diagnostics.markdownlint,
          -- cpp
          nls.builtins.formatting.clang_format,
          nls.builtins.diagnostics.cpplint,
          -- shell
          nls.builtins.formatting.beautysh.with({ extra_args = { '-i', '2' } }),
          nls.builtins.diagnostics.zsh,
          -- toml
          nls.builtins.formatting.taplo,
          -- code actions
          nls.builtins.code_actions.gitrebase,
        },
        on_attach = function(client, bufnr)
          -- Autoformat on save if supported
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  async = false,
                  bufnr = bufnr,
                  -- Only use none-ls.nvim for formatting
                  -- selene: allow(shadowing)
                  ---@diagnostic disable-next-line: redefined-local
                  filter = function(client)
                    return client.name == 'null-ls'
                  end,
                })
              end,
            })
          end
        end,
      }
    end,
  },
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {
      notification = { window = { winblend = 0 } },
      logger = { level = vim.log.levels.OFF },
      progress = { suppress_on_insert = true, display = { render_limit = 3 } },
    },
  },
}
