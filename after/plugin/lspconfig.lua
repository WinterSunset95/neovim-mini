local nvim_lsp = require('lspconfig')
nvim_lsp.jdtls.setup {
	cmd = { "jdtls" }
}
nvim_lsp.clangd.setup {
	cmd = { "clangd", "--background-index" }
}
