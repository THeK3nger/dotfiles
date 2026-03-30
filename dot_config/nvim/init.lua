-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("keybindings")
require("options")

require("config.lazy")

vim.o.guifont = "JetBrainsMono Nerd Font"
-- vim.cmd.colorscheme("melange")
-- vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("kanagawa")
vim.cmd.colorscheme("nord")

-- Diagnostic
vim.diagnostic.config({
	virtual_text = false,
})

-- Show diagnostics in a floating window on cursor hold
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

vim.lsp.enable("gleam")

vim.api.nvim_create_user_command("LspDeno", function()
	vim.lsp.enable("ts_ls", false)
	vim.lsp.enable("denols")
end, {})

vim.api.nvim_create_user_command("LspNode", function()
	vim.lsp.enable("denols", false)
	vim.lsp.enable("ts_ls")
end, {})
