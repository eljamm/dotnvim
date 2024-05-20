-- https://github.com/LazyVim/LazyVim/blob/39901c1f00eca36beb211978164744ae41be7781/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Better Movements
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
-- map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
-- map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
-- map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
-- map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
-- map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
-- map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  'n',
  '<leader>ur',
  '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Redraw / Clear hlsearch / Diff Update' }
)
