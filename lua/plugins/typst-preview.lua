return {
	"chomosuke/typst-preview.nvim",
	ft = "typst",
	-- lazy = false, -- or ft = 'typst'
	version = "0.1.*",
	build = function()
		require("typst-preview").update()
	end,
}
