return {
  'kdheepak/lazygit.nvim',
  enabled = false,
  event = 'VeryLazy',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = {
    'nvim-lua/plenary.nvim', -- optional for floating window border decoration
  },
  keys = {
    { '<leader>lc', '<CMD>LazyGitCurrentFile<CR>', desc = 'LazyGit (Buffer)' },
    { '<leader>lf', '<CMD>LazyGitFilterCurrentFile<CR>', desc = 'LazyGit Filter (Buffer)' },
    { '<leader>lt', '<CMD>LazyGit<CR>', desc = 'LazyGit' },
    { '<leader>lh', '<CMD>LazyGitFilter<CR>', desc = 'LazyGit Filter' },
  },
}
