return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>re', '<cmd>Refactor extract<cr>', desc = 'Extract' },
    { '<leader>rE', '<cmd>Refactor extract_to_file<cr>', desc = 'Extract to File' },
    { '<leader>rv', '<cmd>Refactor extract_var<cr>', desc = 'Extract var' },
    { '<leader>ri', '<cmd>Refactor inline_var<cr>', desc = 'Inline var' },
    { '<leader>rf', '<cmd>Refactor inline_func<cr>', desc = 'Inline func' },
    { '<leader>rb', '<cmd>Refactor extract_block<cr>', desc = 'Extract Block' },
    { '<leader>rB', '<cmd>Refactor extract_block_to_file<cr>', desc = 'Extract block to file' },
  },
}
