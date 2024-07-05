-- https://github.com/LazyVim/LazyVim/blob/39901c1f00eca36beb211978164744ae41be7781/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Better Movements
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
-- map('n', '<A-j>', '<CMD>m .+1<CR>==', { desc = 'Move Down' })
-- map('n', '<A-k>', '<CMD>m .-2<CR>==', { desc = 'Move Up' })
-- map('i', '<A-j>', '<esc><CMD>m .+1<CR>==gi', { desc = 'Move Down' })
-- map('i', '<A-k>', '<esc><CMD>m .-2<CR>==gi', { desc = 'Move Up' })
-- map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move Down' })
-- map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move Up' })

-- Resize window using <ctrl> arrow keys
map({ 'n', 't' }, '<C-Up>', '<CMD>resize +2<CR>', { desc = 'Increase Window Height' })
map({ 'n', 't' }, '<C-Down>', '<CMD>resize -2<CR>', { desc = 'Decrease Window Height' })
map({ 'n', 't' }, '<C-Left>', '<CMD>vertical resize -2<CR>', { desc = 'Decrease Window Width' })
map({ 'n', 't' }, '<C-Right>', '<CMD>vertical resize +2<CR>', { desc = 'Increase Window Width' })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  'n',
  '<leader>ur',
  '<CMD>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Redraw / Clear hlsearch / Diff Update' }
)
