local function map(mode, combo, mapping, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	-- Use vim.keymap.set for Lua functions
	if type(mapping) == "function" then
		vim.keymap.set(mode, combo, mapping, options)
	else
		vim.api.nvim_set_keymap(mode, combo, mapping, options)
	end
end

vim.g.mapleader = ","

-- Exit insert mode
map("i", "jk", "<Esc>")

-- NeoTree
map("n", "<leader>e", ":Neotree toggle=true<CR>", { desc = "Neotree" })
map("n", "<leader>r", ":Neotree focus<CR>", { desc = "Focus Neotree" })

-- Tabs
map("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true, desc = "New Tab" })
map("n", "<C-x>", ":tabclose<CR>", { noremap = true, silent = true, desc = "Cloe Tab" })

-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, desc = "Find Files" })
map("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", { noremap = true, desc = "Live Grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true })
map("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, desc = "Diagnostics" })

-- Buffers Shortcuts
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { noremap = true, desc = "Buffers" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Exit terminal mode
map("t", "<leader><Esc>", "<C-\\><C-n>", { noremap = true })

-- Oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>h", function()
	require("oil").toggle_hidden()
end, { desc = "Toggle hidden files in oil.nvim" })

-- LazyJJ
map("n", "<leader>jj", ":LazyJJ<CR>", { desc = "LazyJJ" })

-- Various Custom Commands
vim.api.nvim_create_user_command("CmpDisable", function()
	require("cmp").setup.buffer({ enabled = false })
end, {})

vim.api.nvim_create_user_command("CmpEnable", function()
	require("cmp").setup.buffer({ enabled = true })
end, {})
