return {
  {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional
      'sindrets/diffview.nvim', -- diff integration
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    keys = {
      { '<leader>gn', '<CMD>Neogit<CR>', desc = '[N]eogit' },
    },
  },
}
