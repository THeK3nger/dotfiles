-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("keybindings")
require("options")

require("config.lazy")

vim.o.guifont = "JetBrainsMono Nerd Font"
-- vim.cmd.colorscheme("melange")
-- kvim.cmd.colorscheme("onedark")
vim.cmd.colorscheme("kanagawa")
vim.opt.termguicolors = true

-- Diagnostic
vim.diagnostic.config({
	virtual_lines = {
		only_current_line = false,
		format = function(diagnostic)
			return string.format("%s [%s]", diagnostic.message, diagnostic.source)
		end,
	},
})

vim.api.nvim_create_user_command("LspDeno", function()
	vim.cmd("LspStop ts_ls")
	vim.cmd("LspStart denols")
end, {})

vim.api.nvim_create_user_command("LspNode", function()
	vim.cmd("LspStop denols")
	vim.cmd("LspStart ts_ls")
end, {})
