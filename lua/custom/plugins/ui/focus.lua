local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

return {
  'nvim-focus/focus.nvim',
  lazy = false,
  version = '*',
  config = true,
  keys = {
    {
      '<leader>ft',
      '<CMD>FocusToggle<CR>',
      mode = 'n',
      desc = '[F]ocus [T]oggle',
    },
    {
      '<leader>fw',
      '<CMD>FocusToggleWindow<CR>',
      mode = 'n',
      desc = '[F]ocus Toggle [W]indow',
    },
    {
      '<leader>fb',
      '<CMD>FocusToggleBuffer<CR>',
      mode = 'n',
      desc = '[F]ocus Toggle [B]uffer',
    },
    {
      '<A-m>',
      '<CMD>FocusMaximise<CR>',
      mode = { 'n', 't' },
      desc = '[F]ocus [M]aximize',
    },
    {
      '<A-r>',
      '<CMD>FocusAutoresize<CR>',
      mode = { 'n', 't' },
      desc = 'Focus [R]eset',
    },
    {
      '<A-s>',
      '<CMD>FocusSplitNicely<CR>',
      mode = 'n',
      desc = 'Focus [S]plit',
    },
  },
  init = function()
    --- disable for certain buffer and file types
    autocmd('WinEnter', {
      group = augroup('FocusDisable', { clear = true }),
      callback = function(_)
        local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
          vim.b.focus_disable = true
        end
      end,
      desc = 'Disable focus autoresize for BufType',
    })
    --
    autocmd('FileType', {
      group = augroup('FocusDisable', { clear = true }),
      callback = function(_)
        local ignore_filetypes = { 'neo-tree', 'trouble', 'gitsigns.blame', 'noice' }

        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        end
      end,
      desc = 'Disable focus autoresize for FileType',
    })
  end,
}
