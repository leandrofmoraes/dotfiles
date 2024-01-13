-- nvim-ufo
return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    -- stylua: ignore start
    { 'zR', function() return require('ufo').openAllFolds() end,  desc = 'Open all folds' },
    { 'zM', function() return require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    -- stylua: ignore end
  },
  opts = {
    provider_selector = function(_, filetype, buftype)
      return (filetype == '' or buftype == 'nofile') and 'indent' or { 'treesitter', 'indent' }
    end,
  },
}
