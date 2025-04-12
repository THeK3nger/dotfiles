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
		config = function()
			local lspconfig = require("lspconfig")

			-- Example: Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			-- Example: Python
			lspconfig.pyright.setup({})

			-- Example: TypeScript/JavaScript
			lspconfig.ts_ls.setup({})

			-- Odin
			lspconfig.ols.setup({})

			-- Haskell
			lspconfig.hls.setup({})

			-- Keybindings for LSP
			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end
		end,
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
