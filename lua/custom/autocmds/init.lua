local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local exec_autocmds = vim.api.nvim_exec_autocmds

--- Conform: Enable/Disable formatting on save
usercmd('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})
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

--- Enable inline LSP hinting (nvim >= 0.10)
if vim.fn.has 'nvim-0.10' == 1 then
  autocmd('LspAttach', {
    desc = 'Enable inlay hints',
    callback = function(event)
      local id = vim.tbl_get(event, 'data', 'client_id')
      local client = id and vim.lsp.get_client_by_id(id)
      if client == nil or not client.supports_method 'textDocument/inlayHint' then
        return
      end

      -- warning: this api is not stable yet
      -- vim.lsp.inlay_hint.enable(event.buf, true)
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end,
  })
end
