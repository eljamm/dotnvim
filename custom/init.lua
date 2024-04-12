local autocmd = vim.api.nvim_create_autocmd

--- Default to relative numbers
vim.opt.relativenumber = true

--- Toggle formatting on save
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

--- Formats buffers using the attached language server clients
--- or using `conform` as a fallback.
--- (https://github.com/stevearc/conform.nvim/issues/316)
local function format()
  local buf_clients = vim.lsp.buf_get_clients()

  -- Check LSP clients that support formatting
  for _, client in pairs(buf_clients) do
    if client.supports_method "textDocument/formatting" then
      vim.lsp.buf.format { async = true }
      return
    end
  end

  -- Fallback on conform
  require("conform").format()
end

vim.keymap.set("n", "<leader>fn", format, { desc = "Format Buffers (Native)" })

--- Go to Tab
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    if vim.t.bufs[i] then
      vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end
  end)
end

--- Enable inline LSP hinting (nvim >= 0.10)
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
