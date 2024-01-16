local Util = require("lazyvim.util")

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "mason.nvim",
    { "folke/neodev.nvim",  lazy = true,     opts = {} },
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
  },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        -- prefix = "icons",
      },
      severity_sort = true,
    },
    -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the inlay hints.
    -- inlay_hints = {
    --   enabled = false,
    -- },
  },

  -- config = function()
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    local lspui = require('lspconfig.ui.windows')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    if Util.has("neoconf.nvim") then
      local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
      require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))
    end

    -- Auto Formatting
    vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

    --LspInfo Borders
    lspui.default_options.border = 'double'

    -- Managing language servers individually
    -- pyright
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    -- tsserver
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    if Util.lsp.get_config("denols") and Util.lsp.get_config("tsserver") then
      local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
      Util.lsp.disable("tsserver", is_deno)
      Util.lsp.disable("denols", function(root_dir)
        return not is_deno(root_dir)
      end)
    end

    -- rust_analyzer
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ['rust-analyzer'] = {},
      },
    })

    -- html
    lspconfig.html.setup({
      capabilities = capabilities,
    })
    -- configure emmet language server
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        'html',
        -- 'typescriptreact',
        -- 'javascriptreact',
        -- 'css',
        -- 'sass',
        -- 'scss',
        -- 'less',
        -- 'svelte',
      },
    })

    -- configure sql server
    lspconfig["sqlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function(_)
        return vim.loop.cwd()
      end,
    })

    lspconfig.jsonls.setup({
      capabilities = capabilities,
    })

    lspconfig.yamlls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.taplo.setup({
      capabilities = capabilities,
    })

    lspconfig.marksman.setup({
      capabilities = capabilities
    })

    lspconfig.lemminx.setup({
      capabilities = capabilities,
    })

    -- Lua LS
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    -- CSS LS
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    -- Tailwind
    -- Support for tailwind auto completion
    -- install the tailwind server : "sudo npm install -g @tailwindcss/language-server"
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })

    -- Java
    -- lspconfig.jdtls.setup({
    --   capabilities = capabilities,
    -- })

    -- -- C/C++
    lspconfig.clangd.setup({
      --   -- capabilities = capabilities,
      on_attach = on_attach,
      --   capabilities = cmp_nvim_lsp.default_capabilities(),
      -- cmd = {
      --     'clangd',
      --     '--offset-encoding=utf-16',
      --   },
      -- keys = {
      -- { "<leader>CR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      -- },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
          "Makefile",
          "configure.ac",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
          fname
        ) or require("lspconfig.util").find_git_ancestor(fname)
      end,
      -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
      capabilities = {
        offsetEncoding = { "utf-16" },
      },
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        -- '--offset-encoding=utf-16',
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
      },
    })

    -- Tailwind
    -- Support for tailwind auto completion
    -- install the tailwind server : "sudo npm install -g @tailwindcss/language-server"
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })

    lspconfig.bashls.setup({
      capabilities = capabilities,
      filetypes = { 'sh', 'zsh', 'bash' }
    })
  end,
}
