-- WIP:
return {
  'nvim-telescope/telescope-cheat.nvim',
  enabled = false,
  dependencies = {
    'kkharji/sqlite.lua',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    {
      '<leader>cs',
      '<cmd>Telescope cheat fd<cr>',
      mode = 'n',
      desc = '[C]heat [S]heet',
    },
    {
      '<leader>cr',
      '<cmd>Telescope cheat recache<cr>',
      mode = 'n',
      desc = '[C]heat [R]ecache',
    },
  },
  init = function()
    require('telescope').load_extension 'cheat'
  end,
}
