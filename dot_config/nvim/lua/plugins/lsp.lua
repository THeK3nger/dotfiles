return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim", -- Optional: Easy LSP installation
			"williamboman/mason-lspconfig.nvim", -- Optional: Bridges Mason with lspconfig
			"hrsh7th/nvim-cmp", -- Optional: Autocompletion
			"hrsh7th/cmp-nvim-lsp", -- Optional: LSP source for nvim-cmp
		},
		-- Configurations are handled by mason-lspconfig. If I set up them here, I get duplicated diagnostic sources.
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "ols", "hls" }, -- Adjust as needed
			})
		end,
	},
}
