return {
  {
    'NeogitOrg/neogit',
    config = true,
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional
      'sindrets/diffview.nvim', -- diff integration
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<leader>gn', ':Neogit<CR>', desc = '[N]eogit' },
    },
  },
}
