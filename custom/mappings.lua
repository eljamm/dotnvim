---@type MappingsTable
local M = {}

-- Map keys for multiple modes
local multimap = function(section)
  local mappings = { plugin = section.plugin }
  local keys = section.keys

  for _, mode in ipairs(section.mode) do
    mappings[mode] = keys
  end
  return mappings
end

M.general = {
  n = {
    [","] = { ":", "Enter command mode", opts = { nowait = true } },
    ["+"] = { "/", "Forward search", opts = { nowait = true } },
    ["-"] = { "?", "Backward search", opts = { nowait = true } },
    ["<C-t>t"] = { "<C-w>T", "Maximize Window" },
    ["<C-t>s"] = { "<cmd>tab split<cr>", "Split Window to New Tab" },
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "Save file" },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>ll"] = { "<cmd>Lazy<cr>", "Open Lazy" },
    ["<leader>mm"] = { "<cmd>Mason<cr>", "Open Mason" },

    ["<c-q>"] = { "<cmd>qa<cr>", "Quick Quit" },

    ["<leader>ms"] = { "<cmd>messages<cr>", "Show Messages" },
    ["<leader>mn"] = { "<cmd>Noice<cr>", "Show Noice Messages" },

    -- Tab motions
    ["<A-t>"] = { "<cmd>tabnew<cr>", "New Tab" },
    ["<A-p>"] = { "<cmd>tabnext<cr>", "Next Tab" },
    ["<A-u>"] = { "<cmd>tabprevious<cr>", "Previous Tab" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
  -- Terminal
  t = {
    -- switch between windows
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Window left" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Window right" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Window down" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Window up" },
  },
  i = {
    -- switch between windows
    ["<C-h>"] = { "<C-><C-N><C-w>h", "Window left" },
    ["<C-l>"] = { "<C-><C-N><C-w>l", "Window right" },
    ["<C-j>"] = { "<C-><C-N><C-w>j", "Window down" },
    ["<C-k>"] = { "<C-><C-N><C-w>k", "Window up" },

    -- save
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "Save file" },

    -- paste
    ["<C-v>"] = { "<ESC>p", "Paste" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<A-k>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<A-j>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- move buffers
    ["<A-K>"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move buffer left",
    },

    ["<A-J>"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move buffer right",
    },

    -- close buffer + hide terminal buffer
    ["<A-c>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.barbar = {
  n = {
    -- cycle through buffers
    ["<A-j>"] = {
      "<Cmd>BufferPrevious<CR>",
      "Goto prev buffer",
    },

    ["<A-k>"] = {
      "<Cmd>BufferNext<CR>",
      "Goto next buffer",
    },

    -- move buffers
    ["<A-K>"] = {
      "<Cmd>BufferMoveNext<CR>",
      "Move buffer left",
    },

    ["<A-J>"] = {
      "<Cmd>BufferMovePrevious<CR>",
      "Move buffer right",
    },

    -- close buffer + hide terminal buffer
    ["<A-c>"] = {
      "<Cmd>BufferClose<CR>",
      "Close buffer",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>ct"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>cc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>cc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Find keymaps" },
    ["<leader>fc"] = { "<cmd>Telescope command_history<cr>", "Find keymaps" },
    ["<leader>fr"] = { "<cmd>Telescope resume<cr>", "Resume previous search" },
    ["<leader>fs"] = { "<cmd>SessionManager load_session<cr>", "Find sessions" },
    ["<leader>fd"] = { "<cmd>SessionManager delete_session<cr>", "Delete sessions" },
  },
  v = {
    ["<leader>fv"] = { '"zy<ESC>:Telescope live_grep default_text=<c-r>z<CR>', "Live grep selected" },
  },
}

M.crates = {
  n = {
    ["K"] = {
      function()
        if vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
          require("crates").show_popup()
        else
          vim.lsp.buf.hover()
        end
      end,
      "Show Crate Documentation",
    },
  },
}

M.dap = {
  plugin = true,

  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint" },

    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug test (Go)",
    },

    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last test (Go)",
    },
  },
}

M.godot = {
  plugin = true,

  n = {
    ["<F3>"] = { "<cmd>GodotRunFZF<cr>", "Fuzzy Run Godot Scenes" },
    ["<F4>"] = { "<cmd>GodotRunLast<cr>", "Run Last Godot Scene" },
    ["<F5>"] = { "<cmd>GodotRun<cr>", "Run Godot Scene" },
    ["<F6>"] = { "<cmd>GodotRunCurrent<cr>", "Run Current Godot Scene" },
  },
}

M.trouble = {
  plugin = true,

  n = {
    ["<leader>tt"] = { "<cmd>TroubleToggle<cr>", "Toggle Diagnostics Window" },
    ["<leader>tw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle Worspace Diagnostics" },
    ["<leader>td"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle Document Diagnostics" },
    ["<leader>tq"] = { "<cmd>TroubleToggle quickfix<cr>", "Toggle Quickfix Window" },
    ["<leader>tl"] = { "<cmd>TroubleToggle loclist<cr>", "Toggle Loclist Window" },
    ["gr"] = { "<cmd>TroubleToggle lsp_references<cr>", "Toggle LSP References" },
  },
}

M.leap = multimap {
  mode = { "n", "x", "o" },
  keys = {
    ["s"] = { "<Plug>(leap-forward)", "Leap Forward" },
    ["S"] = { "<Plug>(leap-backward)", "Leap Backward" },
    ["gs"] = { "<Plug>(leap-from-window)", "Leap From Window" },
  },
}

M.debugprint = {
  plugin = true,

  n = {
    ["g?d"] = {
      function()
        require("debugprint").deleteprints()
      end,
      "Delete all debug lines",
    },
  },
}

return M
