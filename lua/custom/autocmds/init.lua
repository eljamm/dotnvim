local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local exec_autocmds = vim.api.nvim_exec_autocmds

--- Trigger `autoread` when files change on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
  pattern = '*',
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ 'BufWritePre' }, {
  group = augroup('auto_create_dir', { clear = true }),
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

--- Conform: Enable/Disable formatting on save
usercmd('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})
--
usercmd('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

--- Barbar: save buffer location with persisted.nvim
vim.opt.sessionoptions:append 'globals'
autocmd({ 'User' }, {
  pattern = 'PersistedSavePre',
  group = augroup('PersistedHooks', {}),
  callback = function()
    exec_autocmds('User', { pattern = 'SessionSavePre' })
  end,
})

--- Focus: disable for certain buffer and file types
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
    local ignore_filetypes = { 'neo-tree', 'trouble' }

    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
    end
  end,
  desc = 'Disable focus autoresize for FileType',
})
