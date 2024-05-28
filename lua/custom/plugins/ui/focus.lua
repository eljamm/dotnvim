return {
  'nvim-focus/focus.nvim',
  lazy = false,
  version = '*',
  config = true,
  keys = {
    {
      '<leader>ft',
      '<cmd>FocusToggle<cr>',
      mode = 'n',
      desc = '[F]ocus [T]oggle',
    },
    {
      '<leader>fw',
      '<cmd>FocusToggleWindow<cr>',
      mode = 'n',
      desc = '[F]ocus Toggle [W]indow',
    },
    {
      '<leader>fb',
      '<cmd>FocusToggleBuffer<cr>',
      mode = 'n',
      desc = '[F]ocus Toggle [B]uffer',
    },
    {
      '<A-m>',
      '<cmd>FocusMaximise<cr>',
      mode = 'n',
      desc = '[F]ocus [M]aximize',
    },
    {
      '<A-r>',
      '<cmd>FocusAutoresize<cr>',
      mode = 'n',
      desc = 'Focus [R]eset',
    },
    {
      '<A-s>',
      '<cmd>FocusSplitNicely<cr>',
      mode = 'n',
      desc = 'Focus [S]plit',
    },
  },
}
