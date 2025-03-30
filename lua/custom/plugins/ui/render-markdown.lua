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
    -- require('obsidian').get_client().opts.ui.enable = false
    -- vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()['ObsidianUI'], 0, -1)
  end,
}
