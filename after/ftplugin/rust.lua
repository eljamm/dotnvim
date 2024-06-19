local map = vim.keymap.set

map('n', '<leader>sl', '<CMD>BaconLoad<CR>:w<CR>:BaconNext<CR>', { desc = '[S]earch [L]int (Rust)' })
-- map('n', '<leader>sl', '<CMD>BaconList<CR>', { desc = '[S]earch [L]int (Rust)' })
