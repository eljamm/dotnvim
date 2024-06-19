return {
  ---@type LazySpec
  {
    'mikavilpas/yazi.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    event = 'VeryLazy',
    keys = {
      {
        '<leader>yy',
        function()
          require('yazi').yazi()
        end,
        desc = 'Open file manager',
      },
      {
        -- Open in the current working directory
        '<leader>cw',
        function()
          require('yazi').yazi(nil, vim.fn.getcwd())
        end,
        desc = "Open file manager in nvim's working directory",
      },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = false,
    },
  },
}
