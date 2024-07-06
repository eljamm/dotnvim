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
map('n', '<M-n>', '<CMD>enew<CR>', { desc = 'New Buffer' })
map({ 'n', 't' }, '<A-w>', '<CMD>q<CR>', { desc = 'Close Window' })
map({ 'n', 't' }, '<C-q>', close_nvim, { desc = 'Quick Quit' })
map({ 'n', 'x' }, ',', ':', { desc = 'Enter command mode', nowait = true })

map('n', '<leader>ll', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })
map('n', '<leader>mm', '<CMD>Mason<CR>', { desc = 'Open Mason' })

map('i', '<C-v>', '<esc>p', { desc = 'Paste Clipboard' })
map('n', '<C-c>', '<CMD> %y+ <CR>', { desc = 'Copy File to [C]lipboard' })

map({ 'i', 'x', 'n', 's' }, '<C-s>', '<CMD>w "++p"<CR><esc>', { desc = 'Save File' })
map(
  { 'i', 'x', 'n', 's' },
  '<Esc><C-s>', -- <Alt>+<Control-s>
  '<CMD>wa "++p"<CR><esc>',
  { desc = 'Save All Files' }
)

map(
  'n',
  '<leader>cr',
  "<CMD>let @+ = expand('%:~:.')<CR><CMD>echo 'Copied path:' @+<CR>",
  { desc = '[C]opy [R]elative Path to Clipboard' }
)
map(
  'n',
  '<leader>cp',
  "<CMD>let @+ = expand('%:p')<CR><CMD>echo 'Copied path:' @+<CR>",
  { desc = '[C]opy Full [P]ath to Clipboard' }
)
map('n', '<leader>ep', ':e <C-r>+<CR>', { desc = '[E]dit [P]ath from Clipboard', silent = true })

map('v', '>', '>gv', { desc = 'Indent Right' })
map('v', '<', '<gv', { desc = 'Indent Left' })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Dont copy replaced text', silent = true })

-- Don't reset clipboard after first paste in Visual mode
map('v', 'p', 'P')

--- Tab motions
-- map('n', '<C-t>s', '<CMD>tab split<CR>', { desc = 'Split Window to New Tab' })
-- map('n', '<C-t>t', '<C-w>T', { desc = 'Maximize Window' })
map('n', '<ESC><C-j>', '<CMD>tabprevious<CR>', { desc = 'Previous Tab' })
map('n', '<ESC><C-k>', '<CMD>tabnext<CR>', { desc = 'Next Tab' })
map('n', '<leader>tc', '<CMD>tabclose<CR>', { desc = '[T]ab [C]lose' })
map('n', '<leader>te', '<CMD>tabedit<CR>', { desc = '[T]ab [E]dit' })
map('n', '<leader>tn', '<CMD>tabnew<CR>', { desc = '[T]ab [N]ew' })

-- Buffer Motions
-- map('n', '<A-j>', '<CMD>bprevious<CR>', { desc = 'Prev Buffer' })
-- map('n', '<A-k>', '<CMD>bnext<CR>', { desc = 'Next Buffer' })
-- map('n', '<A-c>', '<CMD>bdelete<CR>', { desc = 'Close Buffer' })

--- Debugging
map('n', '<leader>ms', '<CMD>messages<CR>', { desc = 'Show Messages' })
map('n', '<leader>mn', '<CMD>Noice<CR>', { desc = 'Show Noice Messages' })

map('x', '<M-s>', ':sort<CR>', { desc = 'Sort Selection', silent = true })

--- Terminal
-- switch between windows
map('t', '<C-h>', '<C-\\><C-N><C-w>h', { desc = 'Terminal Window Left' })
map('t', '<C-l>', '<C-\\><C-N><C-w>l', { desc = 'Terminal Window Right' })
map('t', '<C-j>', '<C-\\><C-N><C-w>j', { desc = 'Terminal Window Down' })
map('t', '<C-k>', '<C-\\><C-N><C-w>k', { desc = 'Terminal Window Up' })
map('t', '<C-x>', vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true), { desc = 'Escape Terminal Mode' })
