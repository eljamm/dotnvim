return {
  {
    'mikesmithgh/kitty-scrollback.nvim',
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    version = '^5.0.0',
    opts = {},
  },
  -- TODO:
  {
    'knubie/vim-kitty-navigator',
    enabled = false,
    keys = {
      { '<c-h>', '<CMD>KittyNavigateLeft<CR>', { silent = true, desc = 'navigate left' } },
      { '<c-j>', '<CMD>KittyNavigateDown<CR>', { silent = true, desc = 'navigate down' } },
      { '<c-k>', '<CMD>KittyNavigateUp<CR>', { silent = true, desc = 'navigate up' } },
      { '<c-l>', '<CMD>KittyNavigateRight<CR>', { silent = true, desc = 'navigate right' } },
    },
    build = 'cp ./*.py ~/.config/kitty/',
  },
}
