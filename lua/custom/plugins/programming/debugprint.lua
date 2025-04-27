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
    keys = {
      { '`', desc = 'Lua-console - toggle' },
      { '<Leader>`', desc = 'Lua-console - attach to buffer' },
    },
    opts = {
      buffer = {
        clear_before_eval = true, -- clear output below result prefix before evaluation of the whole buffer
      },
    },
  },
}
