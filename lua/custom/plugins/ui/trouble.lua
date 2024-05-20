return {
  'folke/trouble.nvim',
  branch = 'dev', -- IMPORTANT!
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local actions = require 'telescope.actions'
    local open_with_trouble = require('trouble.sources.telescope').open

    -- Use this to add more results without clearing the trouble list
    local add_to_trouble = require('trouble.sources.telescope').add

    local telescope = require 'telescope'

    telescope.setup {
      defaults = {
        mappings = {
          i = { ['<c-t>'] = open_with_trouble },
          n = { ['<c-t>'] = open_with_trouble },
        },
      },
    }

    require('trouble').setup()
  end,
  keys = {
    {
      '<leader>tb',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      mode = { 'n' },
      desc = '[T]rouble [B]buffer Toggle Diagnostics',
    },
    {
      '<leader>tt',
      '<cmd>Trouble diagnostics toggle<cr>',
      mode = { 'n' },
      desc = '[T]rouble [T]oggle Diagnostics',
    },
    { '<leader>tq', '<cmd>Trouble qflist toggle<cr>', mode = { 'n' }, desc = '[T]rouble [Q]uickfix List' },
    { '<leader>tL', '<cmd>Trouble loclist toggle<cr>', mode = { 'n' }, desc = '[T]rouble [L]ocation List' },
    {
      '<leader>td',
      '<cmd>Trouble loclist toggle<cr>',
      mode = { 'n' },
      desc = '[T]rouble LSP [D]efinitions/references/...',
    },
    { '<leader>ts', '<cmd>Trouble symbols toggle focus=false<cr>', mode = { 'n' }, desc = '[T]rouble [S]ymbols' },
  },
}
