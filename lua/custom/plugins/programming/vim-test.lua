local map = vim.keymap.set

return {
  'vim-test/vim-test',
  dependencies = {
    'NvChad/nvterm',
  },
  config = function()
    local nvt = require 'nvterm.terminal'

    vim.g['test#custom_strategies'] = {
      nvterm = function(cmd)
        nvt.send('zellij run -i -- ' .. cmd, 'vertical')
      end,
    }

    vim.g['test#strategy'] = 'nvterm'

    map('n', '<leader>ti', ':TestNearest<cr>', { desc = '[T]est Nearest' })
    map('n', '<leader>tf', ':TestFile<cr>', { desc = '[T]est [F]ile' })
    map('n', '<leader>ta', ':TestSuite<cr>', { desc = '[T]est [A]ll' })
    map('n', '<leader>tl', ':TestLast<cr>', { desc = '[T]est [L]ast' })
    map('n', '<leader>tv', ':TestVisit<cr>', { desc = '[T]est [V]isit' })

    -- vim.cmd "let test#strategy = 'toggleterm'"
    -- vim.cmd 'let test#neovim#term_position = "topleft"'
    -- vim.cmd 'let test#neovim#term_position = "hor"'
  end,
}
