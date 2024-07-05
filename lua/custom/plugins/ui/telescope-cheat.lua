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
      '<CMD>Telescope cheat fd<CR>',
      mode = 'n',
      desc = '[C]heat [S]heet',
    },
    {
      '<leader>cr',
      '<CMD>Telescope cheat recache<CR>',
      mode = 'n',
      desc = '[C]heat [R]ecache',
    },
  },
  init = function()
    require('telescope').load_extension 'cheat'
  end,
}
