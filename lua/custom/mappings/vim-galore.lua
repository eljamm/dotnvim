-- https://github.com/mhinz/vim-galore

local map = vim.keymap.set

-- Saner behavior of n and N
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- Saner command-line history
-- https://github.com/mhinz/vim-galore?tab=readme-ov-file#saner-command-line-history
map('c', '<C-n>', 'wildmenumode()?"<c-n>":"<down>"', { replace_keycodes = false, expr = true, desc = 'Next Command' })
map('c', '<C-p>', 'wildmenumode()?"<c-p>":"<up>"', { replace_keycodes = false, expr = true, desc = 'Prev Command' })
