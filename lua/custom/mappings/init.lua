local map = vim.keymap.set

local close_nvim = function()
  vim.cmd 'Neotree close'
  vim.cmd 'qa'
end

require 'custom.mappings.nvchad'
require 'custom.mappings.lazyvim'
require 'custom.mappings.vim-galore'

--- General
map('n', '+', '/', { desc = 'Forward search', nowait = true })
map('n', '-', '?', { desc = 'Backward search', nowait = true })
map('n', '<C-q>', close_nvim, { desc = 'Quick Quit' })
map({ 'n', 'x' }, ',', ':', { desc = 'Enter command mode', nowait = true })

map('n', '<leader>ll', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })
map('n', '<leader>mm', '<cmd>Mason<cr>', { desc = 'Open Mason' })

map('i', '<C-v>', '<esc>p', { desc = 'Paste Clipboard' })
map('n', '<C-c>', '<cmd> %y+ <CR>', { desc = 'Copy File to [C]lipboard' })
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w "++p"<cr><esc>', { desc = 'Save File' })
map({ 'i', 'x', 'n', 's' }, '<M-s>', '<cmd>wa "++p"<cr><esc>', { desc = 'Save All Files' })

map('v', '>', '>gv', { desc = 'Indent Right' })
map('v', '<', '<gv', { desc = 'Indent Left' })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Dont copy replaced text', silent = true })

-- Don't reset clipboard after first paste in Visual mode
map('v', 'p', 'P')

--- Tab motions
-- map('n', '<C-t>s', '<cmd>tab split<cr>', { desc = 'Split Window to New Tab' })
-- map('n', '<C-t>t', '<C-w>T', { desc = 'Maximize Window' })
-- map('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
-- map('n', '<leader>tj', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
-- map('n', '<leader>tk', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
-- map('n', '<leader>tt', '<cmd>tabnew<cr>', { desc = 'New Tab' })

-- Buffer Motions
-- map('n', '<A-j>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
-- map('n', '<A-k>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
-- map('n', '<A-c>', '<cmd>bdelete<cr>', { desc = 'Close Buffer' })

--- Debugging
map('n', '<leader>ms', '<cmd>messages<cr>', { desc = 'Show Messages' })
map('n', '<leader>mn', '<cmd>Noice<cr>', { desc = 'Show Noice Messages' })

map('x', '<M-s>', ':sort<cr>', { desc = 'Sort Selection' })

--- Terminal
-- switch between windows
map('t', '<C-h>', '<C-\\><C-N><C-w>h', { desc = 'Terminal Window Left' })
map('t', '<C-l>', '<C-\\><C-N><C-w>l', { desc = 'Terminal Window Right' })
map('t', '<C-j>', '<C-\\><C-N><C-w>j', { desc = 'Terminal Window Down' })
map('t', '<C-k>', '<C-\\><C-N><C-w>k', { desc = 'Terminal Window Up' })
