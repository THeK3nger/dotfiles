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
			local servers = {
				ts_ls = {
					root_dir = require("lspconfig").util.root_pattern({ "package.json", "tsconfig.json" }),
					single_file_support = false,
					settings = {},
				},
				denols = {
					root_dir = require("lspconfig").util.root_pattern({ "deno.json", "deno.jsonc" }),
					single_file_support = false,
					settings = {},
				},
				lua_ls = {},
				pyright = {},
				ols = {},
				hls = {},
			}

			for server_name, server_config in pairs(servers) do
				vim.lsp.config(server_name, server_config)
			end

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_enable = true,
			})
		end,
	},
}
