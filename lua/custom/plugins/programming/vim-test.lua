local map = vim.keymap.set

return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    map('n', '<leader>ti', ':TestNearest<cr>', { desc = '[T]est Nearest' })
    map('n', '<leader>tf', ':TestFile<cr>', { desc = '[T]est [F]ile' })
    map('n', '<leader>ta', ':TestSuite<cr>', { desc = '[T]est [A]ll' })
    map('n', '<leader>tl', ':TestLast<cr>', { desc = '[T]est [L]ast' })
    map('n', '<leader>tv', ':TestVisit<cr>', { desc = '[T]est [V]isit' })
    vim.cmd "let test#strategy = 'vimux'"
    vim.cmd 'let test#neovim#term_position = "topleft"'
    vim.cmd 'let test#neovim#term_position = "vert"'
  end,
}
