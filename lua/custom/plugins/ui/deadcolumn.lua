return {
  'Bekaboo/deadcolumn.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    warning = {
      hlgroup = { 'ColorColumn', 'bg' },
    },
  },
}
