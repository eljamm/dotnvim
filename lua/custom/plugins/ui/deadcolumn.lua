return {
  'Bekaboo/deadcolumn.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    warning = {
      hlgroup = { 'ColorColumn', 'bg' },
    },
    scope = 'buffer',
    modes = function(mode)
      return mode:find '^[nictRss\x13]' ~= nil
    end,
  },
}
