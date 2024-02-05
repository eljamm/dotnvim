local HOST = "127.0.0.1"
local PORT = os.getenv "GDScript_Port" or "6005"
local PIPE = [[/tmp/godothost.pipe]]

-- Connect to Godot LSP server
vim.lsp.start {
  name = "gdscript",
  filetypes = { "gd", "gdscript", "gdscript3" },
  root_dir = vim.fs.dirname(vim.fs.find({ "project.godot" }, { upward = true })[1]),
  cmd = vim.lsp.rpc.connect(HOST, PORT),
  flags = {
    debounce_text_changes = 150,
  },
  -- Connect with Editor
  on_init = function()
    vim.api.nvim_command([[echo serverstart(']] .. PIPE .. [[')]])
  end,
}
