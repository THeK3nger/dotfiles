-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("keybindings")
require("options")

require("config.lazy")

vim.o.guifont = "JetBrainsMono Nerd Font"
vim.cmd.colorscheme("catppuccin")

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = { border = "rounded", source = true },
})

-- Autoreload files. Useful if they get changed by coding agents in the background.
vim.o.autoread = true

local function check_external_changes()
	local mode = vim.api.nvim_get_mode()
	if mode.mode == "n" and not mode.blocking and vim.fn.getcmdwintype() == "" then
		vim.cmd("checktime")
	end
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	group = vim.api.nvim_create_augroup("AutoReloadFiles", { clear = true }),
	callback = check_external_changes,
})

-- CursorHold is not a recurring timer. Poll while idle in Normal mode too.
-- checktime preserves unsaved edits instead of force-reloading the buffer.
if vim.g.autoreload_timer then
	vim.fn.timer_stop(vim.g.autoreload_timer)
end
vim.g.autoreload_timer = vim.fn.timer_start(1000, check_external_changes, { ["repeat"] = -1 })
