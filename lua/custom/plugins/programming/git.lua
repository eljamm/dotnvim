return {
  { 'tpope/vim-fugitive' },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional
      'sindrets/diffview.nvim', -- diff integration
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    cmd = { 'Neogit', 'NeogitResetState' },
    keys = { { '<leader>gn', '<CMD>Neogit<CR>', desc = '[N]eogit' } },
  },
  {
    'sindrets/diffview.nvim',
    opts = {},
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
      'DiffviewFileHistory',
    },
    keys = {
      { '<leader>gd', '<CMD>DiffviewOpen<CR>', desc = '[D]iffview' },
    },
  },
}
