return {
  'mistricky/codesnap.nvim',
  build = 'make',
  cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapHighlight', 'CodeSnapSaveHighlight' },
  keys = {
    { '<leader>px', '<cmd>CodeSnap<cr>', mode = 'x', desc = '[P]rint Code into Clipboard' },
    { '<leader>ps', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = '[P]rint and [S]ave Code' },
    { '<leader>pc', ':norm! ggVG<CR>:lua vim.cmd("CodeSnapSave " .. vim.bo.filetype)<CR>', desc = '[P]rint [C]ode' },
  },
  opts = {
    save_path = '~/Pictures/CodeSnap',
  },
}
