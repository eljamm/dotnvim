local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },

    sh = { "shfmt" },

    go = {
      "golines",
      "gofumpt",
      "goimports-reviser",
    },

    gdscript = { "gdformat" },

    nix = { "nixpkgs_fmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
