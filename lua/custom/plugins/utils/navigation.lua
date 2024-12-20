return {
  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git_branch', -- 'global', 'static', 'cwd', 'lsp', 'git', 'git_branch'
    },
    event = 'LazyFile',
    cmd = 'Grapple',
    keys = {
      { '<M-o>', '<CMD>Grapple toggle<CR><CMD>echo "Grappled Buffer"<CR>', desc = 'Grapple Toggle Tag' },
      { '<M-e>', '<CMD>Grapple toggle_tags<CR>', desc = 'Grapple Open Tags Window' },
      { '<M-l>', '<CMD>Grapple cycle_tags next<CR>', desc = 'Grapple Cycle Next Tag' },
      { '<M-h>', '<CMD>Grapple cycle_tags prev<CR>', desc = 'Grapple Cycle Previous Tag' },
    },
  },
  -- TODO:
  {
    'mg979/vim-visual-multi',
    enabled = false,
  },
  {
    'smoka7/multicursors.nvim',
    enabled = false,
    event = 'VeryLazy',
    dependencies = {
      'nvimtools/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      {
        mode = { 'v', 'n' },
        '<leader>mc',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
    },
  },
}
