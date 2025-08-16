require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { 
		"lua_ls",
		"cmake",
		"cssls",
		"cssmodules_ls",
		"tailwindcss",
		"gopls",
		"html",
		"ts_ls",
		"jsonls",
		"pyright",
	},
})
