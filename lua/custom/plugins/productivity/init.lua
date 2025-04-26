return {
  {
    'karb94/neoscroll.nvim',
    opts = {},
  },
  {
    'm4xshen/hardtime.nvim',
    enabled = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
  },
  -- Don't let the cursor move while Yanking
  {
    'svban/YankAssassin.nvim',
    config = function()
      require('YankAssassin').setup {
        -- For both options: if true, autocmds are used.
        -- Whenever 'y' is used in normal mode, the cursor doesn't move to start.
        auto_normal = true,
        auto_visual = true,
      }
      -- Optional Mappings
      vim.keymap.set({ 'x', 'n' }, 'gy', '<Plug>(YADefault)', { silent = true })
      vim.keymap.set({ 'x', 'n' }, '<leader>y', '<Plug>(YANoMove)', { silent = true })
    end,
  },
}
