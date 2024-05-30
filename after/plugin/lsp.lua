-- Setup the extensions first
require("neodev").setup({})
require("ferris").setup({})
local lspconfig = require('lspconfig')

-- Python 
lspconfig.pyright.setup {}

-- Typescript and Javascript

-- C
lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy", "--offset-encoding=utf-16" },
})

-- Lua
lspconfig.lua_ls.setup({
})

-- Golang
lspconfig.gopls.setup({})

-- Rust
lspconfig.rust_analyzer.setup({
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = false;
			}
		}
	}
})

-- PHP
lspconfig.phpactor.setup({
})

-- Remaps when the lspservers are attached
vim.api.nvim_create_autocmd('LspAttach', {
	print("Hello"),
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer mappings
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'D', vim.lsp.buf.type_definition, opts)
	end,
})

