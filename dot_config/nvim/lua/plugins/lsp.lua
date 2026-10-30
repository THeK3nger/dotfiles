return {
	{
		"neovim/nvim-lspconfig",
		-- follow tagged releases only; master gets commits many times a day
		version = "*",
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			-- lspconfig must be on the runtimepath before mason-lspconfig enables servers
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer", "ols", "hls", "ruff" },
			})

			-- ruff provides linting/fixes only; let pyright own hover and go-to-definition
			vim.lsp.config("ruff", {
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false
				end,
			})
		end,
	},
}
