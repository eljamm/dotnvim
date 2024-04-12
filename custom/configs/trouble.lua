local actions = require "telescope.actions"
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

local telescope = require "telescope"

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    },
  },
}

-- load keymaps
require("core.utils").load_mappings "trouble"

require("trouble").setup()
