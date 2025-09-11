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
			local lspconfig = require("lspconfig")

			local function root_pattern_excludes(opt)
				local root = opt.root
				local exclude = opt.exclude

				local function matches(path, pattern)
					return 0 < #vim.fn.glob(util.path.join(path, pattern))
				end

				return function(startpath)
					return util.search_ancestors(startpath, function(path)
						return matches(path, root) and not matches(path, exclude)
					end)
				end
			end

			local servers = {
				denols = {
					root_dir = root_pattern_excludes({
						root = "deno.json?",
						exclude = "package.json",
					}),
					single_file_support = false,
					settings = {},
				},
				ts_ls = {
					root_dir = root_pattern_excludes({
						root = "package.json",
						exclude = "deno.json?",
					}),
					single_file_support = false,
					settings = {},
				},

				lua_ls = {},
				pyright = {},
				ols = {},
				hls = {},
			}

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
				handlers = {
					-- Default handler - skip ts_ls and denols
					function(server_name)
						if server_name == "ts_ls" or server_name == "denols" then
							return
						end
						local server_config = servers[server_name] or {}
						lspconfig[server_name].setup(server_config)
					end,
				},
			})
		end,
	},
}
