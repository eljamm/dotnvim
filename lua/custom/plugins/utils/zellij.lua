return {
  {
    'https://github.com/fresh2dev/zellij.vim.git',
    lazy = false,
    cmd = {
      'ZellijNavigateLeft',
      'ZellijNavigateDown',
      'ZellijNavigateUp',
      'ZellijNavigateRight',
    },
    keys = {
      { '<c-h>', '<cmd>ZellijNavigateLeft<cr>' },
      { '<c-j>', '<cmd>ZellijNavigateDown<cr>' },
      { '<c-k>', '<cmd>ZellijNavigateUp<cr>' },
      { '<c-l>', '<cmd>ZellijNavigateRight<cr>' },
      { '<m-I>', '<cmd>ZellijNewPane<cr>' },
      { '<m-V>', '<cmd>ZellijNewPaneVSplit<cr>' },
      { '<m-B>', '<cmd>ZellijNewPaneSplit<cr>' },
    },
  },
}
