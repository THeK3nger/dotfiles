return {
	{
		"swaits/lazyjj.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			mapping = "<leader>jj",
		},
	},
	{ -- A tool for splitting diffs in Neovim
		"julienvincent/hunk.nvim",
		cmd = { "DiffEditor" },
		config = function()
			require("hunk").setup()
		end,
	},
	{
		"rafikdraoui/jj-diffconflicts",
		cmd = { "JJDiffConflicts" },
	},
}
