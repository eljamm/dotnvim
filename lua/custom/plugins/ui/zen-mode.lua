-- 80% of current window's width
local zen_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8)

return {
  'folke/zen-mode.nvim',
  keys = {
    {
      '<leader>nn',
      '<CMD>ZenMode<CR>',
      desc = '[N]o [N]oise (Zen Mode)',
    },
  },
  opts = {
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = zen_width, -- width of the Zen window
      options = {
        colorcolumn = '0',
      },
    },
  },
}
