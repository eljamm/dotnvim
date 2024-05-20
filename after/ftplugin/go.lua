local map = vim.keymap.set

-- Debugging
map('n', '<leader>dt', function()
  require('dap-go').debug_test()
end, { desc = 'Debug: Test (Go)' })

map('n', '<leader>dl', function()
  require('dap-go').debug_last_test()
end, { desc = 'Debug: Last Test (Go)' })
