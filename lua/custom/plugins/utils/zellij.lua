return {
  {
    'https://git.sr.ht/~swaits/zellij-nav.nvim',
    enabled = false,
    event = 'VeryLazy',
    keys = {
      { '<c-h>', '<CMD>ZellijNavigateLeft<CR>', { silent = true, desc = 'navigate left' } },
      -- { '<c-j>', '<CMD>ZellijNavigateDown<CR>', { silent = true, desc = 'navigate down' } },
      { '<c-k>', '<CMD>ZellijNavigateUp<CR>', { silent = true, desc = 'navigate up' } },
      { '<c-l>', '<CMD>ZellijNavigateRight<CR>', { silent = true, desc = 'navigate right' } },
    },
    opts = {},
  },
}
