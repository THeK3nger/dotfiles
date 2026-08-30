return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer", "denols", "ols", "hls", "ruff" },
				automatic_enable = true,
			})

			-- ruff provides linting/fixes only; let pyright own hover and go-to-definition
			vim.lsp.config("ruff", {
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false
				end,
			})

			-- denols and ts_ls both target TypeScript; only one may attach per
			-- project or they fight over diagnostics/formatting. denols owns
			-- projects with a deno.json(c), ts_ls owns everything else.
			vim.lsp.config("denols", {
				root_dir = function(bufnr, on_dir)
					local root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
					if root then
						on_dir(root)
					end
				end,
			})
			vim.lsp.config("ts_ls", {
				root_dir = function(bufnr, on_dir)
					if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
						return
					end
					on_dir(vim.fs.root(bufnr, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }))
				end,
			})
		end,
	},
}
