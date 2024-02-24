local autocmd = vim.api.nvim_create_autocmd

-- Default to relative numbers
vim.opt.relativenumber = true

-- Go to Tab
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    if vim.t.bufs[i] then
      vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end
  end)
end

-- Enable inline LSP hinting (nvim >= 0.10)
if vim.fn.has "nvim-0.10" == 1 then
  autocmd("LspAttach", {
    desc = "Enable inlay hints",
    callback = function(event)
      local id = vim.tbl_get(event, "data", "client_id")
      local client = id and vim.lsp.get_client_by_id(id)
      if client == nil or not client.supports_method "textDocument/inlayHint" then
        return
      end

      -- warning: this api is not stable yet
      vim.lsp.inlay_hint.enable(event.buf, true)
    end,
  })
end
