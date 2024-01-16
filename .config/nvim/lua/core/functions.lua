local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'curved',
    -- width = 100,
    -- height = 50,
  },
  on_open = function(_)
    vim.cmd('startinsert!')
  end,
  on_close = function(_) end,
  count = 99,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

local node = Terminal:new({
  dir = '%:p:h',
  cmd = 'node',
  hidden = true,
  direction = 'float',
  border = 'curved',
})

function _NODE_TOGGLE()
  node:toggle()
end

-- local run = Terminal:new {
-- dir = "%:p:h",
-- hidden = true,
-- direction = "float",
-- on_open = function(_)
--   vim.cmd("startinsert!")
--   vim.fn.feedkeys("i")
--   vim.cmd("redraw!")
--   -- vim.cmd(":ToggleTermExec node %")
--   vim.cmd('TermExec cmd="node %"')
-- end,
-- }

function _RUN_CODE()
  -- run:toggle()
  -- vim.fn.feedkeys("i")
  -- local
  if vim.bo.filetype == 'javascript' then
    -- vim.cmd('TermExec cmd="node %"') -- horizontal term
    vim.cmd('TermExec cmd="node %" direction="horizontal" go_back=0')
  elseif vim.bo.filetype == 'python' then
    -- vim.cmd('TermExec cmd="python %"')
    vim.cmd('TermExec cmd="python %" direction="horizontal" go_back=0')
  elseif vim.bo.filetype == 'c' then
    -- vim.cmd('TermExec cmd="javac % && java %<"')
    vim.cmd('TermExec cmd="gcc *.c -o %<.out && ./%<.out" direction="horizontal" go_back=0')
  elseif vim.bo.filetype == 'cpp' then
    -- vim.cmd('TermExec cmd="javac % && java %<"')
    vim.cmd('TermExec cmd="g++ *.cpp -o %< && ./%<" direction="horizontal" go_back=0')
  elseif vim.bo.filetype == 'java' then
    -- vim.cmd('TermExec cmd="javac % && java %<"')
    vim.cmd('TermExec cmd="javac % && java %<" direction="horizontal" go_back=0')
    -- vim.cmd('TermExec cmd="javac -cp .:*.jar % && java -cp .:*.jar %<" direction="horizontal" go_back=0 || TermExec cmd="javac % && java %<" direction="horizontal" go_back=0')
  elseif vim.bo.filetype == 'sh' then
    -- vim.cmd('TermExec cmd="bash %"')
    vim.cmd('TermExec cmd="bash %" direction="horizontal" go_back=0')
  elseif vim.bo.filetype == 'html' then
    -- vim.cmd('TermExec cmd="bash %"')
    -- vim.cmd('TermExec cmd="google-chrome-stable % && exit" direction="horizontal"')
    vim.cmd('LiveServer start')
  end
  -- vim.cmd("startinsert!")
end

local htop = Terminal:new({ cmd = 'htop', hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({
  dir = '%:p:h',
  cmd = 'python',
  hidden = true,
  direction = 'float',
  border = 'curved',
})

function _PYTHON_TOGGLE()
  python:toggle()
end

local lua = Terminal:new({
  dir = '%:p:h',
  cmd = 'lua',
  hidden = true,
  direction = 'float',
  border = 'curved',
})

function _LUA_TOGGLE()
  lua:toggle()
end

local java = Terminal:new({
  dir = '%:p:h',
  cmd = 'jshell',
  hidden = true,
  direction = 'float',
  border = 'curved',
})

function _JAVA_TOGGLE()
  java:toggle()
end

local cargo_run = Terminal:new({
  dir = '%:p:h',
  cmd = 'cargo run',
  hidden = true,
  direction = 'float',
  border = 'curved',
})

function _CARGO_RUN()
  cargo_run:toggle()
end

local float_term = Terminal:new({
  direction = 'float',
  border = 'curved',
  -- shell = "/usr/bin/zsh",
  on_open = function(term)
    vim.cmd('startinsert!')
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      'n',
      '<m-1>',
      '<cmd>ToggleTerm dir=%:p:h direction=float<cr>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      't',
      '<m-1>',
      '<cmd>ToggleTerm dir=%:p:h direction=float<cr>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      'i',
      '<m-1>',
      '<cmd>ToggleTerm dir=%:p:h direction=float<cr>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(term.bufnr, '', '<m-2>', '<nop>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(term.bufnr, '', '<m-3>', '<nop>', { noremap = true, silent = true })
  end,
  count = 1,
})

function _FLOAT_TERM()
  float_term:toggle()
end

-- TYPESCRIPT FUNCTIONS
function _ORGANIZE_TS_IMPORTS()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.organizeImports.ts" },
      diagnostics = {},
    },
  })
end

function _REMOVE_UNUSED()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  })
end

-- vim.api.nvim_set_keymap("n", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })

-- local vertical_term = Terminal:new {
--   direction = "vertical",
--   on_open = function(term)
--     vim.cmd "startinsert!"
--     vim.api.nvim_buf_set_keymap(
--       term.bufnr,
--       "n",
--       "<m-2>",
--       "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
--       { noremap = true, silent = true }
--     )
--     vim.api.nvim_buf_set_keymap(
--       term.bufnr,
--       "t",
--       "<m-2>",
--       "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
--       { noremap = true, silent = true }
--     )
--     vim.api.nvim_buf_set_keymap(
--       term.bufnr,
--       "i",
--       "<m-2>",
--       "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
--       { noremap = true, silent = true }
--     )
--     vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-3>", "<nop>", { noremap = true, silent = true })
--   end,
--   count = 2,
-- }

-- function _VERTICAL_TERM()
--   vertical_term:toggle(60)
-- end

-- vim.api.nvim_set_keymap("n", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })

-- local horizontal_term = Terminal:new {
--   direction = "horizontal",
--   on_open = function(term)
--     vim.cmd "startinsert!"
--     vim.api.nvim_buf_set_keymap(
--       term.bufnr,
--       "n",
--       "<m-3>",
--       "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
--       { noremap = true, silent = true }
--     )
--     vim.api.nvim_buf_set_keymap(
--       term.bufnr,
--       "t",
--       "<m-3>",
--       "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
--       { noremap = true, silent = true }
--     )
--     vim.api.nvim_buf_set_keymap(
--       term.bufnr,
--       "i",
--       "<m-3>",
--       "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
--       { noremap = true, silent = true }
--     )
--     vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-2>", "<nop>", { noremap = true, silent = true })
--   end,
--   count = 3,
-- }

-- function _HORIZONTAL_TERM()
--   horizontal_term:toggle(10)
-- end

-- vim.api.nvim_set_keymap("n", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })

-- for k, v in pairs(options) do
--   lvim.builtin.terminal[k] = v
-- end
