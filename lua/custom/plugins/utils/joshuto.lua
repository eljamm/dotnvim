return {
  'theniceboy/joshuto.nvim',
  cmd = {
    'Joshuto',
  },
  dependencies = {
    'nvim-lua/plenary.nvim', -- optional for floating window border decoration
  },
  keys = {
    { '<leader>jo', '<cmd>Joshuto<cr>', desc = 'Open Joshuto' },
  },
}
