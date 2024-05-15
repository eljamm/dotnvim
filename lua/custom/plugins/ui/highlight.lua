local theme_colors = require('catppuccin.palettes').get_palette(vim.g.catppuccin_flavor) or {}

-- FIX:
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:

-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    keywords = {
      -- icon: used for the sign, and in search results
      -- color: can be a hex color, or a named color (see below)
      -- alt: set of other keywords that all map to this FIX keywords
      -- signs: configure signs for some keywords individually
      FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, signs = true },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = theme_colors.peach or 'warning' },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = '󰅒 ', color = theme_colors.mauve or 'test', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = '󰍨 ', color = theme_colors.green or 'hint', alt = { 'INFO' } },
      TEST = { icon = '󰒡 ', color = theme_colors.rosewater or 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
    },
  },
}
