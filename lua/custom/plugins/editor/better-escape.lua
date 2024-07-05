return {
  'nvim-zh/better-escape.vim',
  init = function()
    vim.g.better_escape_shortcut = { 'jj', 'jk' }
    vim.g.better_escape_interval = 200
  end,
}
