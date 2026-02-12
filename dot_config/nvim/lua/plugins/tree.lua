local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
}

local T = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"rachartier/tiny-devicons-auto-colors.nvim",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		-- use_default_mappings = false,
		window = {
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["!"] = "toggle_hidden",
				["d"] = "add_directory",
				["X"] = "delete",
				["/"] = "noop", -- Disable fuzzy finder thx
				["?"] = "noop", -- Disable fuzzy finder thx
				["space"] = "none",
				["<Esc>"] = "close_window",
			},
		},
		filesystem = {
			-- Use oil instead
			hijack_netrw_behavior = "disabled",
		},
	},
	cmd = "Neotree",
}

return {
	M,
	T,
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = true,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
}
