vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')

require('keybindings')

local theme = "kanagawa"
-- vim.g['onedark_style'] = 'deep'

require('lualine').setup{
  options = { theme  = theme },
}

vim.opt.termguicolors = true
vim.cmd("colorscheme " .. theme)

vim.g['vimwiki_list'] = {{path = '~/Dropbox/Hypomnemata', syntax = 'markdown', ext = '.md'}}

require('lspconfig').tsserver.setup{}

local neogit = require('neogit')
neogit.setup {}

require("obsidian").setup({
  dir = "~/Dropbox/Notes",
  disable_frontmatter = true,
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },
  daily_notes = {
    folder = "Daily Notes",
  }
})

vim.g['keysound_volume'] = 1000

require("nvim-tree").setup()

local cmp = require"cmp"

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    },
    {
      { name = 'buffer' },
    })
  })

require('options')

require'nvim-treesitter.configs'.setup{highlight={enable=true}}
