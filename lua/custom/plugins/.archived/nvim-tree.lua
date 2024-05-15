local VIEW_WIDTH_FIXED = 30
local view_width_max = VIEW_WIDTH_FIXED -- fixed to start

-- toggle the width and redraw
local function toggle_width_adaptive()
  if view_width_max == -1 then
    view_width_max = VIEW_WIDTH_FIXED
  else
    view_width_max = -1
  end

  require('nvim-tree.api').tree.reload()
end

local nvimtree_attach = function(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- toggle adaptive width
  vim.keymap.set('n', 'A', toggle_width_adaptive, opts 'Toggle Adaptive Width')

  -- extra mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
  vim.keymap.set('n', 'O', function()
    api.node.open.edit()
    api.tree.focus()
  end, opts 'Open')
end

-- get current view width
local get_view_width_max = function()
  return view_width_max
end

local options = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath 'config' .. '/lua/custom' },
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = 'left',
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
}

return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  keys = {
    { 'n', '<C-n>', '<cmd> NvimTreeToggle <CR>', desc = 'Toggle nvimtree' },
    { 'n', '<leader>e', '<cmd> NvimTreeFocus <CR>', desc = 'Focus nvimtree' },
  },
  opts = {
    -- adaptive width
    view = {
      width = {
        min = 30,
        max = get_view_width_max,
      },
    },
    -- git support in nvimtree
    git = {
      enable = true,
      ignore = false,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    renderer = {
      root_folder_label = true,
      highlight_git = true,
      highlight_opened_files = 'none',

      indent_markers = {
        enable = false,
      },

      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },

        glyphs = {
          default = '󰈚',
          symlink = '',
          folder = {
            default = '',
            empty = '',
            empty_open = '',
            open = '',
            symlink = '',
            symlink_open = '',
            arrow_open = '',
            arrow_closed = '',
          },
          git = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌',
          },
        },
      },
    },

    -- override keybindings
    on_attach = nvimtree_attach,
  },
}
