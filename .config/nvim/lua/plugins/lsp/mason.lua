return {
  {
    "williamboman/mason.nvim",
    -- dependencies = {
    -- 	"williamboman/mason-lspconfig.nvim",
    -- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
    -- },

    -- config = function()
    --   local mason = require("mason")
    --   mason.setup({
    build = function()
      pcall(function()
        require("mason-registry").refresh()
      end)
    end,
    event = "User FileOpened",
    lazy = true,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "double",
        width = 0.8,
        height = 0.8,
      },
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- cmd = { "LspInstall", "LspUninstall" },
    -- ensure_installed = {
    -- 	"lua_ls",
    -- 	"cssls",
    -- 	"marksman",
    --      "clangd",
    -- },
    config = function()
      require("mason-lspconfig").setup()
      -- automatic_installation is handled by lsp-manager
      local settings = require "mason-lspconfig.settings"
      settings.current.automatic_installation = false
    end,
    -- auto installation
    -- automatic_installation = true,
    lazy = true,
    event = "User FileOpened",
    dependencies = "mason.nvim",
  },
  { "tamago324/nlsp-settings.nvim",    cmd = "LspSettings", lazy = true },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true },

  {
    enabled = false,
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- you can turn off/on auto_update per tool
        { "bash-language-server" },
        { "lua-language-server" },
        { "vim-language-server" },
        { "stylua" },
        { "editorconfig-checker" },
        { "html-lsp" },
        { "emmet-ls" },
        { "css-lsp" },
        { "pyright" },
        { "black" },
        { "autopep8" },
        { "json-lsp" },
        { "prettier" },
        { "typescript-language-server" },
        { "js-debug-adapter" },
        { "node-debug2-adapter" },
        { "eslint_d" },
        { "eslint-lsp" },
        { "codelldb" },
        { "tailwindcss-language-server" },
      },

      auto_update = true,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay
      debounce_hours = 5, -- at least 5 hours between attempts to install/update
    }
  }
}
