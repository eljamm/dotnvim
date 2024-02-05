-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  -- for alpha-nvim dashboard
  AlphaHeader = { fg = "#89b4fa" },
  AlphaFooter = { fg = "#f9e2af" },
  -- BufferCurrent = { bg = C.surface1, fg = C.text },
  -- BufferCurrentIndex = { bg = C.surface1, fg = C.blue },
  -- BufferCurrentMod = { bg = C.surface1, fg = C.yellow },
  -- BufferCurrentSign = { bg = C.surface1, fg = C.blue },
  -- BufferCurrentTarget = { bg = C.surface1, fg = C.red },
  -- BufferVisible = { bg = C.mantle, fg = C.text },
  -- BufferVisibleIndex = { bg = C.mantle, fg = C.blue },
  -- BufferVisibleMod = { bg = C.mantle, fg = C.yellow },
  -- BufferVisibleSign = { bg = C.mantle, fg = C.blue },
  -- BufferVisibleTarget = { bg = C.mantle, fg = C.red },
  -- BufferInactive = { bg = C.mantle, fg = C.overlay0 },
  -- BufferInactiveIndex = { bg = C.mantle, fg = C.overlay0 },
  -- BufferInactiveMod = { bg = C.mantle, fg = C.yellow },
  -- BufferInactiveSign = { bg = C.mantle, fg = C.blue },
  -- BufferInactiveTarget = { bg = C.mantle, fg = C.red },
  -- BufferTabpages = { bg = C.mantle, fg = C.none },
  -- BufferTabpage = { bg = C.mantle, fg = C.blue },
}

return M
