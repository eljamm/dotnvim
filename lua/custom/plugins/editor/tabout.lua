return {
  {
    'abecodes/tabout.nvim',
    opts = {},
    dependencies = { -- These are optional
      'nvim-treesitter/nvim-treesitter',
      'L3MON4D3/LuaSnip',
      'hrsh7th/nvim-cmp',
    },
    event = 'InsertEnter', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
}
