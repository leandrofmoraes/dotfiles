-- Set a formatter.
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
  -- { command = "black", filetypes = { "python" } },
-- }

-- Set a linter.
-- local linters = require "lvim.lsp.null-ls.linters"
-- local linters = { 'cpp': ['clangd'] }
-- linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
-- }

-- Setup dap for python
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- pcall(function()
--   require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
  -- require("dap-python").setup("python")
-- end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
-- pcall(function()
  -- require("dap-python").test_runner = "pytest"
-- end)

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "python" },
--   callback = function()
--     lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
--     lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
--     lvim.builtin.which_key.vmappings["d"] = {
--       name = "Debug",
--       s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
--     }
--   end,
-- })
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "arfmt", filetypes = { "ino", "arduino" } },
-- }

-- vim.filetype.add {
--   extension = {
--     arduino = "ino",
--   },
-- }

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "arduino_language_server" })

-- local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("arduino_language_server", {
--   filetypes = { "arduino", "ino" },
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
-- })

-- When the arduino server starts in these directories, use the provided FQBN.
-- Note that the server needs to start exactly in these directories.
-- This example would require some extra modification to support applying the FQBN on subdirectories!
local my_arduino_fqbn = {
    ["$HOME/Arduino//blink"] = "arduino:avr:nano",
    ["$HOME/Arduino/sensor"] = "arduino:mbed:nanorp2040connect",
}

local DEFAULT_FQBN = "arduino:avr:uno"

lspconfig.arduino_language_server.setup ({
    on_new_config = function (config, root_dir)
        local fqbn = my_arduino_fqbn[root_dir]
        if not fqbn then
            vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
            fqbn = DEFAULT_FQBN
        end
        config.cmd = {
            "arduino-language-server",
            "-cli-config", "$HOME/.arduino15/arduino-cli.yaml",
            "-fqbn",
            fqbn
        }
    end
})

-- lvim.lsp.installer.setup.ensure_installed = vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "vuels" })
-- lvim.lsp.automatic_configuration.skipped_servers =
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "arduino-language-server" })

-- local arduino_opts = {
--   -- cmd = { vim.fn.expandcmd "$HOME/.local/share/nvim/mason/bin/arduino-language-server" },
--   cmd = { vim.fn.expandcmd "$HOME/.config/lvim/lua/user/lsp/languages/arduino-language-server" },
--   filetypes = { "ino" },
-- }

-- require("lvim.lsp.manager").setup("arduino-language-server", arduino_opts)

