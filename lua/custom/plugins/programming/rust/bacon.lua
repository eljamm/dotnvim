return {
  'Canop/nvim-bacon',
  cmd = 'BaconList',
  keys = {
    { '<leader>bn', ':BaconLoad<CR>:w<CR>:BaconNext<CR>', desc = '[B]acon [N]ext (Rust)' },
    { '<leader>bp', ':BaconList<CR>', desc = '[B]acon [P]revious (Rust)' },
  },
}
