local map = vim.keymap.set

local close_nvim = function()
  vim.cmd 'Neotree close'
  vim.cmd 'qa'
end

local function map_terminal(direction)
  return function()
    if vim.bo.filetype ~= 'toggleterm' then
      return '<C-\\><C-N><C-w>' .. direction
    else
      return '<C-' .. direction .. '>'
    end
  end
end

require 'custom.mappings.nvchad'
require 'custom.mappings.lazyvim'
require 'custom.mappings.vim-galore'

--- General
map('n', '+', '/', { desc = 'Forward search', nowait = true })
map('n', '-', '?', { desc = 'Backward search', nowait = true })
map('n', '<C-q>', close_nvim, { desc = 'Quick Quit' })
map('n', '<M-a>', '<CMD>enew<CR>', { desc = 'New Buffer' })
map({ 'n', 't' }, '<A-w>', '<CMD>q<CR>', { desc = 'Close Window' })
map({ 'n', 'x' }, ',', ':', { desc = 'Enter command mode', nowait = true })
map({ 'n', 'x' }, ';', ':', { desc = 'Enter command mode', nowait = true })

map('n', '<leader>ll', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })
map('n', '<leader>mm', '<CMD>Mason<CR>', { desc = 'Open Mason' })

map('i', '<C-v>', '<esc>p', { desc = 'Paste Clipboard' })
map('n', '<C-c>', '<CMD> %y+ <CR>', { desc = 'Copy File to [C]lipboard' })

map({ 'i', 'x', 'n', 's' }, '<C-s>', '<CMD>w "++p"<CR><esc>', { desc = 'Save File' })
-- TODO: change this (not optimal)
-- map(
--   { 'i', 'x', 'n', 's' },
--   '<Esc><C-s>', -- <Alt>+<Control-s>
--   '<CMD>wa "++p"<CR><esc>',
--   { desc = 'Save All Files' }
-- )

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
map({ 'n', 't' }, '<A-n>', '<CMD>tabprevious<CR>', { desc = 'Previous Tab' })
map({ 'n', 't' }, '<A-p>', '<CMD>tabnext<CR>', { desc = 'Next Tab' })
map({ 'n', 't' }, '<A-x>', '<CMD>tabclose<CR>', { desc = 'Close Tab' })
map({ 'n', 't' }, '<A-t>', '<CMD>tabnew<CR>', { desc = 'New Tab' })
-- map('n', '<C-t>s', '<CMD>tab split<CR>', { desc = 'Split Window to New Tab' })
-- map('n', '<C-t>t', '<C-w>T', { desc = 'Maximize Window' })

-- Buffer Motions
-- map('n', '<A-j>', '<CMD>bprevious<CR>', { desc = 'Prev Buffer' })
-- map('n', '<A-k>', '<CMD>bnext<CR>', { desc = 'Next Buffer' })
-- map('n', '<A-c>', '<CMD>bdelete<CR>', { desc = 'Close Buffer' })

--- Debugging
map('n', '<leader>ms', '<CMD>messages<CR>', { desc = '[M]essages' })
map('n', '<leader>mn', '<CMD>Noice<CR>', { desc = '[N]oice [M]essages' })
map('n', '<leader>nd', '<CMD>Noice dismiss<CR>', { desc = '[N]oice [D]ismiss' })

map('x', '<M-s>', ':sort<CR>', { desc = 'Sort Selection', silent = true })

--- Terminal
-- switch between windows
map('t', '<C-h>', map_terminal 'h', { expr = true, desc = 'Terminal Window Left' })
map('t', '<C-l>', map_terminal 'l', { expr = true, desc = 'Terminal Window Right' })
map('t', '<C-j>', map_terminal 'j', { expr = true, desc = 'Terminal Window Down' })
map('t', '<C-k>', map_terminal 'k', { expr = true, desc = 'Terminal Window Up' })

-- Set semicolon at the end
map('n', '<leader>;', [[A;<Esc>]], { desc = 'Custom: Add semicolon to end of line' })

-- Source snippets
map('n', '<leader><leader>s', function()
  for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/custom/snippets/*.lua', true)) do
    loadfile(ft_path)()
  end
  -- re-source cleared friendly-snippets
  require('luasnip.loaders.from_vscode').lazy_load()
  vim.print 'Sourced Snippets'
end, { desc = 'Source snippets' })

-- I don't need this in visual mode
map('v', 'K', '<Nop>', { noremap = true, silent = true })
