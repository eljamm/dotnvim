return {
  'mistricky/codesnap.nvim',
  build = 'make',
  cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapHighlight', 'CodeSnapSaveHighlight', 'CodeSnapASCII' },
  keys = {
    { '<leader>pa', '<CMD>CodeSnapASCII<CR>', mode = 'x', desc = '[P]rint Code to ASCII' },
    { '<leader>px', '<CMD>CodeSnap<CR>', mode = 'x', desc = '[P]rint Code into Clipboard' },
    { '<leader>ps', '<CMD>CodeSnapSave<CR>', mode = 'x', desc = '[P]rint and [S]ave Code' },
    {
      '<leader>pc',
      ':norm! ggVG<CR>:lua vim.cmd("CodeSnapSave " .. vim.bo.filetype)<CR>',
      desc = '[P]rint [C]ode',
      silent = true,
    },
  },
  opts = {
    save_path = '~/Pictures/CodeSnap',
  },
}
