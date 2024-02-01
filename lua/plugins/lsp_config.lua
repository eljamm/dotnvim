return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"lukas-reineke/lsp-format.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "pylsp", "gopls" },
			})

			require("lsp-format").setup({
				yaml = { tab_width = 2 },
				sh = { tab_width = 2 },
			})
			local prettier = {
				formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
				formatStdin = true,
			}
			local beautysh = {
				formatCommand = [[beautysh ${--indent-size:tab_width} -]],
				formatStdin = true,
			}
			local black = {
				formatCommand = [[black --quiet -]],
				formatStdin = true,
			}
			local flake8 = {
				formatCommand = [[flake8 --stdin-display-name ${INPUT} -]],
				LintStdin = true,
			}

			local on_attach = function(client, bufnr)
				-- Formatting
				require("lsp-format").on_attach(client, bufnr)

				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)

				-- Format on Save
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end

			-- nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lspconfig.efm.setup({
				-- on_attach = require("lsp-format").on_attach,
				on_attach = on_attach,
				init_options = { documentFormatting = true },
				settings = {
					languages = {
						yaml = { prettier },
						sh = { beautysh },
					},
				},
			})
			lspconfig.texlab.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					build = {
						executable = "tectonic",
						args = {
							"-X",
							"compile",
							"%f",
							"--synctex",
							"--keep-logs",
							"--keep-intermediates",
						},
						onSave = true,
					},
					forwardSearch = {
						executable = "zathura",
						args = { "--synctex-forward", "%l:1:%f", "%p" },
					},
				},
			})
			lspconfig.typst_lsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
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
			})
			lspconfig.bashls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			require("lspconfig").pylsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "W391" },
								maxLineLength = 100,
							},
							black = { enabled = true },
							isort = { enabled = true, profile = "black" },
						},
					},
				},
			})
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})
		end,
	},
}
