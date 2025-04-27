return {
  -- show code context
  -- TODO: add keymaps for toggling
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'LazyFile',
    opts = {
      mode = 'topline', -- Line used to calculate context. Choices: 'cursor', 'topline'
    },
  },
}
