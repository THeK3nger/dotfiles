return {
	{ "savq/melange-nvim", lazy = false },
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "warm",
			})
			-- Enable theme
			-- require("onedark").load()
		end,
	},
	{ "rebelot/kanagawa.nvim" },
	{ "arcticicestudio/nord-vim" },
}
