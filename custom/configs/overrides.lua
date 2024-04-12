local M = {}

M.treesitter = {
  auto_install = true,
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "nix",
    "c",
    "cpp",

    -- rust
    "ron",
    "rust",
    "toml",

    -- go
    "go",
    "gomod",
    "gowork",
    "gosum",

    "kotlin",
    "markdown",
    "markdown_inline",
    "yaml",
    "json",
    "hjson",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "tree-sitter-cli",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust
    "rust-analyzer",
    "talpo",

    -- go
    "gopls",
    "gofumpt",
    "golines",
    "goimports-reviser",
    "delve",

    -- shell
    "shfmt",
  },
}

M.mason_dap = {
  ensure_installed = {
    "python",
    "delve",
    "cppdbg",
  },
}

M.nvimtree = {
  -- adaptive width
  view = {
    width = {
      min = 30,
      max = require("custom.configs.nvimtree").get_view_width_max,
    },
  },
  -- git support in nvimtree
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  -- override keybindings
  on_attach = require("custom.configs.nvimtree").nvimtree_attach,
}

-- enable crates in nvim-cmp
M.crates = {
  src = {
    cmp = { enabled = true },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "crates" },
  },
}

M.neoscroll = {
  easing_function = "quadratic",
}

return M
