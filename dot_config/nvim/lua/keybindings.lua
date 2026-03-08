local function map(mode, combo, mapping, opts)
	vim.keymap.set(mode, combo, mapping, vim.tbl_extend("force", { noremap = true }, opts or {}))
end

vim.g.mapleader = ","

-- Exit insert mode
map("i", "jk", "<Esc>")

-- NeoTree
map("n", "<leader>e", ":Neotree toggle=true<CR>", { desc = "Neotree" })
map("n", "<leader>r", ":Neotree focus<CR>", { desc = "Focus Neotree" })

-- Tabs
map("n", "<C-t>", ":tabnew<CR>", { silent = true, desc = "New Tab" })
map("n", "<C-x>", ":tabclose<CR>", { silent = true, desc = "Close Tab" })

-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })

-- Buffers Shortcuts
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Exit terminal mode
map("t", "<leader><Esc>", "<C-\\><C-n>")

-- Oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>h", function()
	require("oil").toggle_hidden()
end, { desc = "Toggle hidden files in oil.nvim" })

-- Various Custom Commands
vim.api.nvim_create_user_command("CmpDisable", function()
	require("cmp").setup.buffer({ enabled = false })
end, {})

vim.api.nvim_create_user_command("CmpEnable", function()
	require("cmp").setup.buffer({ enabled = true })
end, {})
