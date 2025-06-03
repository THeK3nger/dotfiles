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

map("i", "jk", "<Esc>")
map("n", "<leader>d", ":Neotree toggle=true<CR>", { desc = "Neotree" })
map("", "<C-t>", "tabnew<CR>")

map("n", "<silent> <A-Up>", ":wincmd k<CR>")
map("n", "<silent> <A-Down>", ":wincmd j<CR>")
map("n", "<silent> <A-Left>", ":wincmd h<CR>")
map("n", "<silent> <A-Right>", ":wincmd l<CR>")

-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { noremap = true })

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
