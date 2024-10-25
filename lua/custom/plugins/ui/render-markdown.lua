return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  version = '*',
  opts = {
    latex = { enabled = false },
  },
  init = function()
    vim.keymap.set('n', '<leader>mr', '<CMD>RenderMarkdown toggle<CR>', { desc = '[M]arkdown [R]ender' })
  end,
}
