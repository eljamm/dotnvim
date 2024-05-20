return {
  'Bekaboo/deadcolumn.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = true,
  opts = {
    warning = {
      hlgroup = { 'ColorColumn', 'bg' },
    },
  },
}
