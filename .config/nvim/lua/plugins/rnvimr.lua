-- Ranger Nvim
return {
  'kevinhwang91/rnvimr',
  cmd = 'RnvimrToggle',
  keys = {
    { '<leader>E', '<cmd>:RnvimrToggle<CR>', desc = 'Ranger' },
    { ';E',        '<cmd>:RnvimrToggle<CR>', desc = 'Ranger' },
  },
  -- cmd = 'RangerToggle',
  config = function()
    vim.g.rnvimr_draw_border = 1
    vim.g.rnvimr_pick_enable = 1
    vim.g.rnvimr_bw_enable = 1
  end,
}
