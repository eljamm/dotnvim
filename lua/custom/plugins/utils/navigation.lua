return {
  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git_branch', -- 'global', 'static', 'cwd', 'lsp', 'git', 'git_branch'
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = {
      { '<M-a>', '<CMD>Grapple toggle<CR><CMD>echo "Grappled Buffer"<CR>', desc = 'Grapple Toggle Tag' },
      { '<M-e>', '<CMD>Grapple toggle_tags<CR>', desc = 'Grapple Open Tags Window' },
      { '<M-h>', '<CMD>Grapple cycle_tags next<CR>', desc = 'Grapple Cycle Next Tag' },
      { '<M-l>', '<CMD>Grapple cycle_tags prev<CR>', desc = 'Grapple Cycle Previous Tag' },
    },
  },
}
