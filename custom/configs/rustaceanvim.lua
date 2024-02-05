vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},

  -- LSP configuration
  server = {
    on_attach = function()
      -- load lsp keymaps
      require("core.utils").load_mappings "lspconfig"
    end,
    settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        -- Add clippy lints for Rust.
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        diagnostics = {
          enable = true,
        },
        inlayHints = {
          enable = true,
          showParameterNames = true,
          parameterHintsPrefix = "<- ",
          otherHintsPrefix = "=> ",
        },
      },
    },
  },

  -- DAP configuration
  dap = {},
}
