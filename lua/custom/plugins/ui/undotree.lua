return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = true,
  keys = {
    { '<leader>ut', "<CMD>lua require('undotree').toggle()<CR>", desc = '[U]ndo [T]ree' },
  },
}
