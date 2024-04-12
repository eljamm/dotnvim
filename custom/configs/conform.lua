local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },

    sh = { "shfmt" },

    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,

    go = {
      "golines",
      "gofumpt",
      "goimports",
    },

    gdscript = { "gdformat" },

    nix = { "nixpkgs_fmt" },

    rust = { "rustfmt" },

    -- Fix common misspellings in source code on all filetypes
    ["*"] = { "codespell" },
  },

  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
}

require("conform").setup(options)
