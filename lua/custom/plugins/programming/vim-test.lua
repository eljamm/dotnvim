return {
  'vim-test/vim-test',
  dependencies = {
    'NvChad/nvterm',
  },
  cmd = { 'TestNeares', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' },
  config = function()
    local nvt = require 'nvterm.terminal'

    vim.g['test#custom_strategies'] = {
      nvterm = function(cmd)
        nvt.send('zellij run -i -- ' .. cmd, 'vertical')
      end,
    }

    vim.g['test#strategy'] = 'nvterm'

    -- vim.g['test#strategy'] = 'toggleterm'
    -- vim.g['test#neovim#term_position'] = 'topleft'
    -- vim.g['test#neovim#term_position'] = 'hor'
  end,
  keys = {
    { '<leader>ti', ':TestNearest<cr>', desc = '[T]est Nearest' },
    { '<leader>tf', ':TestFile<cr>', desc = '[T]est [F]ile' },
    { '<leader>ta', ':TestSuite<cr>', desc = '[T]est [A]ll' },
    { '<leader>tl', ':TestLast<cr>', desc = '[T]est [L]ast' },
    { '<leader>tv', ':TestVisit<cr>', desc = '[T]est [V]isit' },
  },
}
