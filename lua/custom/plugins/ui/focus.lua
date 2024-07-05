return {
  'nvim-focus/focus.nvim',
  lazy = false,
  version = '*',
  config = true,
  keys = {
    {
      '<leader>ft',
      '<CMD>FocusToggle<CR>',
      mode = 'n',
      desc = '[F]ocus [T]oggle',
    },
    {
      '<leader>fw',
      '<CMD>FocusToggleWindow<CR>',
      mode = 'n',
      desc = '[F]ocus Toggle [W]indow',
    },
    {
      '<leader>fb',
      '<CMD>FocusToggleBuffer<CR>',
      mode = 'n',
      desc = '[F]ocus Toggle [B]uffer',
    },
    {
      '<A-m>',
      '<CMD>FocusMaximise<CR>',
      mode = { 'n', 't' },
      desc = '[F]ocus [M]aximize',
    },
    {
      '<A-r>',
      '<CMD>FocusAutoresize<CR>',
      mode = { 'n', 't' },
      desc = 'Focus [R]eset',
    },
    {
      '<A-s>',
      '<CMD>FocusSplitNicely<CR>',
      mode = 'n',
      desc = 'Focus [S]plit',
    },
  },
}
