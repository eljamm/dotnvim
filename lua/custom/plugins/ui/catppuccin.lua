return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  version = '*',
  opts = {
    integrations = {
      leap = true,
      barbar = true,
      indent_blankline = {
        scope_color = 'lavender',
        colored_indent_levels = true,
      },
    },
  },
  init = function()
    -- setup must be called before loading
    vim.g.catppuccin_flavor = 'macchiato'
    vim.cmd('colorscheme catppuccin-' .. (vim.g.catppuccin_flavor or 'frappe'))

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
