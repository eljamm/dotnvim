return {
  'NvChad/nvterm',
  opts = {
    terminals = {
      shell = 'fish',
    },
  },
  keys = {
    {
      '<A-i>',
      function()
        require('nvterm.terminal').toggle 'float'
      end,
      mode = { 'n', 't' },
      desc = 'Toggle Floating Terminal',
    },
    {
      '<A-h>',
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
