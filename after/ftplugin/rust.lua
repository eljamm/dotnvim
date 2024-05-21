-- Enable Inlay Hints
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = false }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true)
    end
  end,
})
