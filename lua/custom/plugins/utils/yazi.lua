return {
  ---@type LazySpec
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      {
        '<leader>yy',
        function()
          require('yazi').yazi()
        end,
        desc = 'Open Yazi',
      },
      {
        '<leader>ya',
        function()
          require('yazi').yazi(nil, vim.fn.getcwd())
        end,
        desc = 'Open Yazi in working directory',
      },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = false,
    },
  },
}
