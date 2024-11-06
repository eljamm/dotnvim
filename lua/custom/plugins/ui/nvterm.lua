return {
  'NvChad/nvterm',
  opts = {
    terminals = {
      shell = 'zellij',
    },
  },
  keys = {
    {
      '<A-f>',
      function()
        require('nvterm.terminal').toggle 'float'
      end,
      mode = { 'n' },
      desc = 'Toggle Floating Terminal',
    },
    {
      '<A-b>',
      function()
        require('nvterm.terminal').toggle 'horizontal'
      end,
      mode = { 'n', 't' },
      desc = 'Toggle Horizontal Terminal',
    },
    {
      '<A-v>',
      function()
        require('nvterm.terminal').toggle 'vertical'
      end,
      mode = { 'n', 't' },
      desc = 'Toggle Vertical Terminal',
    },
  },
}
