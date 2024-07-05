return {
  'Canop/nvim-bacon',
  cmd = 'BaconList',
  keys = {
    { '<leader>bn', '<CMD>BaconLoad<CR>:w<CR>:BaconNext<CR>', desc = '[B]acon [N]ext (Rust)' },
    { '<leader>bp', '<CMD>BaconList<CR>', desc = '[B]acon [P]revious (Rust)' },
  },
}
