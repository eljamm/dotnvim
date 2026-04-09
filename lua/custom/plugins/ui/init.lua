return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- needed for neovim >= 0.12
    event = { 'LazyFile', 'VeryLazy' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'nix',
        'regex',
        'vim',
        'vimdoc',
      }
    end,
  },
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
