local config_group = vim.api.nvim_create_augroup("UserGroup", {})
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

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Auto save session
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      -- Don't save while there's any 'nofile' buffer open.
      if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
        return
      end
    end
    require("session_manager").save_current_session()
  end,
})

-- Close all open windows before quitting
vim.api.nvim_create_autocmd("QuitPre", {
  group = config_group,
  callback = function()
    -- Save session before quitting
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      -- Don't save while there's any 'nofile' buffer open.
      if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
        return
      end
    end
    require("session_manager").save_current_session()
    ---
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

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
