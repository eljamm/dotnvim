return {
  -- show code context
  {
    'nvim-treesitter/nvim-treesitter-context',
    version = '*',
    event = 'LazyFile',
    cmd = { 'TSContext' },
    keys = {
      { '<leader>cl', '<CMD>TSContext toggle<CR>', { silent = true, desc = '[C]ontext [L]ens' } },
    },
    opts = {
      mode = 'topline', -- Line used to calculate context. Choices: 'cursor', 'topline'
    },
    init = function()
      -- hide, by default
      vim.cmd 'TSContext disable'
    end,
  },
}
