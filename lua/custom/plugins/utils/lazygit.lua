return {
  'kdheepak/lazygit.nvim',
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
    { '<leader>lg', '<CMD>LazyGit<CR>', desc = 'Open [L]azy[G]it' },
  },
}
