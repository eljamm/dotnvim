---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  telescope = {
    style = "bordered",
  },

  tabufline = {
    enabled = true,
    show_numbers = true,
  },

  -- Add line and column to statusline
  statusline = {
    overriden_modules = function(modules)
      table.insert(modules, "Ln %l, Col %c")
    end,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = false,
    header = {
      "                                                                   ",
      "      ████ ██████           █████      ██                    ",
      "     ███████████             █████                            ",
      "     █████████ ███████████████████ ███   ███████████  ",
      "    █████████  ███    █████████████ █████ ██████████████  ",
      "   █████████ ██████████ █████████ █████ █████ ████ █████  ",
      " ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
      "██████  █████████████████████ ████ █████ █████ ████ ██████",
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
