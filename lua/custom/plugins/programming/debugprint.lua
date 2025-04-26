return {
  {
    'andrewferrier/debugprint.nvim',
    event = 'LazyFile',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    -- stable releases
    version = '*',
    opts = {},
  },
  {
    'yarospace/lua-console.nvim',
    enabled = false,
    lazy = true,
    keys = {
      { '`', desc = 'Lua-console - toggle' },
      { '<Leader>`', desc = 'Lua-console - attach to buffer' },
    },
    opts = {},
  },
}
