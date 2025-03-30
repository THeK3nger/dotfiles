-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("keybindings")
require("options")

require("config.lazy")

vim.o.guifont = "JetBrainsMono Nerd Font"
vim.cmd.colorscheme("melange")
vim.opt.termguicolors = true

-- Diagnostic
vim.diagnostic.config({
	-- Use the default configuration
	virtual_lines = true,

	-- Alternatively, customize specific options
	-- virtual_lines = {
	--  -- Only show virtual line diagnostics for the current cursor line
	--  current_line = true,
	-- },
})
