-- Merged on top of nvim-lspconfig's ts_ls defaults.
-- root_dir is set (not root_markers) because the default root_dir would take precedence.
return {
	filetypes = {
		"typescript",
		"typescriptreact",
	},
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }))
	end,
}
