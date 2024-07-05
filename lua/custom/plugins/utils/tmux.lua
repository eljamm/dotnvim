return {
  {
    'christoomey/vim-tmux-navigator',
    enabled = false,
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<CMD><C-U>TmuxNavigateLeft<CR>' },
      { '<c-j>', '<CMD><C-U>TmuxNavigateDown<CR>' },
      { '<c-k>', '<CMD><C-U>TmuxNavigateUp<CR>' },
      { '<c-l>', '<CMD><C-U>TmuxNavigateRight<CR>' },
      { '<c-\\>', '<CMD><C-U>TmuxNavigatePrevious<CR>' },
    },
  },
  -- TODO:
  {
    'sunaku/tmux-navigate',
    enabled = false,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    enabled = false,
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
          last_active = '<C-\\>',
          next = '<C-Space>',
        },
      }
    end,
  },
  {
    'aserowy/tmux.nvim',
    enabled = false,
    config = true,
    lazy = false,
    opts = {
      navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = true,

        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = true,

        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = false,
      },
    },
  },
}
