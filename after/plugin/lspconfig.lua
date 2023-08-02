local nvim_lsp = require('lspconfig')
nvim_lsp.clangd.setup {
	cmd = { "clangd", "--background-index" }
}
