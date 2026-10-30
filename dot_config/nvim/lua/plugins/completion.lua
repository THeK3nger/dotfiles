return {
	{
		"saghen/blink.cmp",
		-- release tags ship a prebuilt fuzzy matcher binary
		version = "1.*",
		-- not lazy-loaded: it must register LSP capabilities before servers start
		-- (blink defers its own heavy setup internally)
		---@module "blink.cmp"
		---@type blink.cmp.Config
		opts = {
			-- :CmpDisable / :CmpEnable toggle this per buffer
			enabled = function()
				return vim.b.completion ~= false
			end,
			keymap = {
				preset = "enter",
				["<C-d>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-.>"] = { "show", "fallback" },
			},
			completion = {
				menu = { border = "single" },
				documentation = {
					auto_show = true,
					window = { border = "single" },
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
