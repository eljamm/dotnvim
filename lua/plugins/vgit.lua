return {
	"tanvirtin/vgit.nvim",
	version = "v0.2.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("vgit").setup({
			keymaps = {
				["n <C-k>"] = function()
					require("vgit").hunk_up()
				end,
				["n <C-j>"] = function()
					require("vgit").hunk_down()
				end,
			},
			settings = {
				live_blame = {
					enabled = false,
				},
				authorship_code_lens = {
					enabled = false,
				},
			},
		})
	end,
}
