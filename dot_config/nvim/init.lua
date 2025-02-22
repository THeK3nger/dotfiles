-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('keybindings')
require('options')

require('config.lazy')

vim.o.guifont = "JetBrainsMono Nerd Font"
vim.cmd.colorscheme "melange"
vim.opt.termguicolors = true
