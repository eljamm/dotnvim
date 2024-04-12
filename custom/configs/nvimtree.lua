local M = {}

local VIEW_WIDTH_FIXED = 30
local view_width_max = VIEW_WIDTH_FIXED -- fixed to start

-- toggle the width and redraw
local function toggle_width_adaptive()
  if view_width_max == -1 then
    view_width_max = VIEW_WIDTH_FIXED
  else
    view_width_max = -1
  end

  require("nvim-tree.api").tree.reload()
end

M.nvimtree_attach = function(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- toggle adaptive width
  vim.keymap.set("n", "A", toggle_width_adaptive, opts "Toggle Adaptive Width")

  -- extra mappings
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "O", function()
    api.node.open.edit()
    api.tree.focus()
  end, opts "Open")
end

-- get current view width
M.get_view_width_max = function()
  return view_width_max
end

return M
