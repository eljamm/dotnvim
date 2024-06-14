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
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
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
