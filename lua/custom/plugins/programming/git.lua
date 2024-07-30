return {
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
    -- TODO: rewrite as a toggle
    keys = {
      { '<leader>do', '<CMD>DiffviewOpen<CR>', desc = '[D]iffview [O]pen' },
      { '<leader>dc', '<CMD>DiffviewClose<CR>', desc = '[D]iffview [C]lose' },
    },
  },
}
