return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  ft = { 'rust' },
  init = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },

      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- load lsp keymaps
          -- require('core.utils').load_mappings 'lspconfig'

          -- inlay hints for old neovim versions (< 0.10)
          if vim.fn.has 'nvim-0.9' == 1 and vim.fn.has 'nvim-0.10' == 0 then
            require('lsp-inlayhints').on_attach(client, bufnr)
          end
        end,
        settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
              extraArgs = { '--no-deps' },
            },
            diagnostics = {
              enable = true,
            },
          },
        },
      },

      -- DAP configuration
      dap = {},
    }
  end,
}
