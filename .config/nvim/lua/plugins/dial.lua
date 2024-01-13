-- dial.nvim
return {
  'monaqa/dial.nvim',
  keys = {
    -- stylua: ignore start
    { '<C-a>',  function() return require('dial.map').inc_normal() end,  expr = true, desc = 'Increment' },
    { '<C-x>',  function() return require('dial.map').dec_normal() end,  expr = true, desc = 'Decrement' },
    { 'g<C-a>', function() return require('dial.map').inc_gnormal() end, expr = true, desc = 'Multiline increment' },
    { 'g<C-x>', function() return require('dial.map').dec_gnormal() end, expr = true, desc = 'Multiline decrement' },
    { '<C-a>',  function() return require('dial.map').inc_visual() end,  mode = 'v',  expr = true,                 desc = 'Increment' },
    { '<C-x>',  function() return require('dial.map').dec_visual() end,  mode = 'v',  expr = true,                 desc = 'Decrement' },
    { 'g<C-a>', function() return require('dial.map').inc_gvisual() end, mode = 'v',  expr = true,                 desc = 'Multiline increment' },
    { 'g<C-x>', function() return require('dial.map').dec_gvisual() end, mode = 'v',  expr = true,                 desc = 'Multiline decrement' },
    -- stylua: ignore end
  },
  config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.integer.alias.octal,
        augend.integer.alias.binary,
        augend.constant.alias.bool,
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.constant.new({ elements = { 'and', 'or' }, word = true, cyclic = true }),
        augend.constant.new({ elements = { '&&', '||' }, word = true, cyclic = true }),
      },
    })
  end,
}
