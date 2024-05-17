-- Plugin Configuration
-- --------------------

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Themes
Plug('dracula/vim', { as = 'dracula' })
Plug 'arcticicestudio/nord-vim'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'navarasu/onedark.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'igorgue/danger'
Plug 'rebelot/kanagawa.nvim'

-- Improved Highlight
Plug 'sheerun/vim-polyglot'
Plug('nvim-treesitter/nvim-treesitter')

-- Distraction Free
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

-- NVim Tree - tree explorer
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'

-- Enhanced statusline
-- Plug 'vim-airline/vim-airline'
-- Plug 'vim-airline/vim-airline-themes'

Plug 'hoob3rt/lualine.nvim'
-- If you want to have icons in your statusline choose one of these
-- Plug 'kyazdani42/nvim-web-devicons'

-- Git Integration
-- Plug 'tpope/vim-fugitive'
Plug 'NeogitOrg/neogit'
Plug 'airblade/vim-gitgutter'

-- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

-- Autocomplete
-- Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

-- Add commands to surround words with symbols
Plug 'tpope/vim-surround'

-- Highlight White Spaces
Plug 'ntpeters/vim-better-whitespace'

-- Languages

-- General LSP Configuration
Plug 'neovim/nvim-lspconfig'

-- RUST
Plug 'rust-lang/rust.vim'

-- JS
Plug 'isRuslan/vim-es6'

-- V
Plug 'ollykel/v-vim'

-- Lint
Plug 'w0rp/ale'

-- Jakt
Plug('SerenityOS/jakt', { rtp = 'editors/vim' })

-- VimWiki
Plug 'vimwiki/vimwiki'
Plug 'plasticboy/vim-markdown'
Plug 'sadotsoy/vim-xit'

-- HLedger
Plug 'linuxcaffe/timedot-vim'
Plug 'anekos/hledger-vim'

Plug 'hrsh7th/nvim-cmp'

Plug 'epwalsh/obsidian.nvim'

vim.call('plug#end')

