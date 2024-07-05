return {
  'folke/trouble.nvim',
  branch = 'main',
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
      '<CMD>Trouble diagnostics toggle filter.buf=0<CR>',
      mode = { 'n' },
      desc = '[T]rouble [B]buffer Toggle Diagnostics',
    },
    {
      '<leader>tt',
      '<CMD>Trouble diagnostics toggle focus=true<CR>',
      mode = { 'n' },
      desc = '[T]rouble [T]oggle Diagnostics',
    },
    { '<leader>tq', '<CMD>Trouble qflist toggle<CR>', mode = { 'n' }, desc = '[T]rouble [Q]uickfix List' },
    { '<leader>tL', '<CMD>Trouble loclist toggle<CR>', mode = { 'n' }, desc = '[T]rouble [L]ocation List' },
    {
      '<leader>td',
      '<CMD>Trouble loclist toggle<CR>',
      mode = { 'n' },
      desc = '[T]rouble LSP [D]efinitions/references/...',
    },
    { '<leader>ts', '<CMD>Trouble symbols toggle focus=false<CR>', mode = { 'n' }, desc = '[T]rouble [S]ymbols' },
  },
}
