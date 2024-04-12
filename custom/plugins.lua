local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
---@class NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require "custom.configs.trouble"
    end, -- Override to setup mason-lspconfig
  },

  -- =======================
  --    Plugin Overrides
  -- =======================
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  -- =======================
  --   Plugin Installation
  -- =======================
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require "custom.configs.alpha-nvim"
    end,
  },

  {
    "Shatur/neovim-session-manager",
    enabled = false,
    event = "VimEnter",
    config = function()
      require "custom.configs.session-manager"
    end,
  },

  -- Lua
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = overrides.crates,
    config = true,
    keys = function()
      require("core.utils").load_mappings "crates"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    init = function()
      require "custom.configs.rustaceanvim"
    end,
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    enabled = false,
    module = "lsp-inlayhints",
    config = true,
    opts = {
      inlay_hints = {
        highlight = "Comment",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    enabled = false,
    init = function()
      require("core.utils").load_mappings "dap"
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = overrides.mason_dap,
        config = true,
      },
    },
  },

  {
    "leoluz/nvim-dap-go",
    enabled = false,
    ft = "go",
    config = true,
    dependencies = {
      {
        "mfussenegger/nvim-dap",
      },
    },
    keys = function()
      require("core.utils").load_mappings "dap_go"
    end,
  },

  {
    "habamax/vim-godot",
    ft = "gdscript",
    dependencies = {
      {
        "tpope/vim-dispatch",
      },
      {
        "junegunn/fzf",
        "junegunn/fzf.vim",
      },
    },
    keys = function()
      require("core.utils").load_mappings "godot"
    end,
  },

  {
    "folke/trouble.nvim",
    branch = "dev", -- IMPORTANT!
    ft = { "qf" },
    module = "trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = {
      {
        "tpope/vim-repeat",
      },
    },
  },

  {
    "andrewferrier/debugprint.nvim",
    keys = { "g?" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    -- stable releases
    version = "*",
    config = true,
    init = function()
      require("core.utils").load_mappings "debugprint"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require("custom.configs.noice").opts,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "nvim-focus/focus.nvim",
    lazy = false,
    opts = {
      exclude_filetypes = {
        "NvimTree_*",
      },
    },
    version = "*",
    config = true,
    init = function()
      require "custom.configs.focus"
    end,
  },

  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    config = true,
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
