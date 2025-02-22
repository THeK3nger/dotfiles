local function map(mode, combo, mapping, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

vim.g.mapleader = ','

map('i', 'jk', '<Esc>')
map("n", "<leader>d", ":Neotree toggle=true<CR>", { desc = "Neotree" })
map('', '<C-t>', 'tabnew<CR>')

map('n', '<silent> <A-Up>', ':wincmd k<CR>')
map('n', '<silent> <A-Down>', ':wincmd j<CR>')
map('n', '<silent> <A-Left>', ':wincmd h<CR>')
map('n', '<silent> <A-Right>', ':wincmd l<CR>')

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })

-- Exit terminal mode
map('t', '<leader><Esc>', '<C-\\><C-n>', { noremap = true })
