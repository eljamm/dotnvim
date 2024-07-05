return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    cmd = { 'Neotree' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
      'MunifTanjim/nui.nvim',
    },
    opts = {
      close_if_last_window = true,
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'open_split',
          -- TODO: `v` is for select. Find another key for vsplit
          -- ['v'] = 'open_vsplit',
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
      },
    },
    keys = {
      { '<C-n>', '<CMD>Neotree toggle<CR>', mode = { 'n', 'x', 't' }, desc = 'Toggle [N]eoTree', nowait = true },
      {
        '<C-f>',
        '<CMD>Neotree toggle position=current<CR>',
        mode = { 'n', 'x' },
        desc = 'Toggle [F]ull NeoTree',
        nowait = true,
      },
    },
  },
}
