require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer",
	"clangd",
	"cmake",
	"cssls",
	"cssmodules_ls",
	"tailwindcss",
	"gopls",
	"html",
	"htmx",
	"denols",
	"ts_ls",
	"jsonls",
	"pyright",
},
})
