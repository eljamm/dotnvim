return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'md',
  cmd = { 'RenderMarkdown' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  version = '*',
  keys = {
    { '<leader>rm', '<CMD>RenderMarkdown toggle<CR>', desc = '[R]ender [M]arkdown' },
  },
}
