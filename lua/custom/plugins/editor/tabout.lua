return {
  {
    'abecodes/tabout.nvim',
    event = 'InsertEnter', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
    opts = {
      -- if the cursor is at the beginning of a filled element it will
      -- rather tab out than shift the content
      ignore_beginning = false,
    },
    wants = { 'nvim-treesitter' }, -- (optional) or require if not used so far
    after = { 'nvim-cmp' }, -- if a completion plugin is using tabs load it before
  },
}
