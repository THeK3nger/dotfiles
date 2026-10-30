return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, "Next hunk")
				map("[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, "Previous hunk")
				map("<leader>hp", gs.preview_hunk, "Preview hunk")
				map("<leader>hu", gs.reset_hunk, "Undo hunk")
			end,
		},
	},
	{
		"FabijanZulj/blame.nvim",
		cmd = { "BlameToggle" },
		opts = {},
	},
}
