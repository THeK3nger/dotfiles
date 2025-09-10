return {
	{
		"NeogitOrg/neogit",
		cmd = { "NeoGit" },
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},

	{
		"airblade/vim-gitgutter",
		event = "BufRead", -- or another event that triggers the plugin
		config = function()
			-- Optional: configure vim-gitgutter here
			vim.cmd("GitGutterEnable")
		end,
	},
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})
		end,
	},
}
