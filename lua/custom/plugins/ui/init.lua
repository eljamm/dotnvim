return {
  -- show code context
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'LazyFile',
    cmd = { 'TSContextEnable', 'TSContextDisable', 'TSContextToggle' },
    keys = {
      { '<leader>cl', '<CMD>TSContextToggle<CR>', { silent = true, desc = '[C]ontext [L]ens' } },
    },
    opts = {
      mode = 'topline', -- Line used to calculate context. Choices: 'cursor', 'topline'
    },
    init = function()
      -- hide, by default
      vim.cmd 'TSContextDisable'
    end,
  },
}
