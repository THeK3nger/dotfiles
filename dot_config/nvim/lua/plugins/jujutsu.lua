return {
	{
		"swaits/lazyjj.nvim",
		cmd = { "LazyJJ" },
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			mapping = "<leader>jj",
		},
	},
	{ -- A tool for splitting diffs in Neovim
		"julienvincent/hunk.nvim",
		cmd = { "DiffEditor" },
		config = function()
			require("hunk").setup({
				keys = {
					global = {
						quit = { "q" },
						accept = { "<leader>P" },
						focus_tree = { "<leader>e" },
					},
				},
			})
		end,
	},
	{
		"rafikdraoui/jj-diffconflicts",
		cmd = { "JJDiffConflicts" },
	},
}
