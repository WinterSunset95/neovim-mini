-- Setup the extensions first
require("neodev").setup({})
require("ferris").setup({})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require('luasnip')
local cmp = require('cmp')
local servers = {
	"pyright",
	"tsserver",
	"clangd",
	"lua_ls",
	"gopls",
	"rust_analyzer",
	"phpactor",
	"svelte",
	"emmet_language_server",
	"cssls",
	"cssmodules_ls"
}

-- Servers setup
for _, server in ipairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
	})
end

-- C
lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy", "--offset-encoding=utf-16" },
})

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

-- emmet_language_server
lspconfig.emmet_language_server.setup({
	init_options = {
		showSuggestionsAsSnippets = true,
	}
})
vim.keymap.set({ 'n', 'v' }, '<C-y>', require('nvim-emmet').wrap_with_abbreviation)

-- Remaps when the lspservers are attached
vim.api.nvim_create_autocmd('LspAttach', {
	print("Hello"),
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer mappings
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		-- For declaration, definition and type_definition, open in a new tab
		vim.keymap.set('n', 'gD', function()
			vim.lsp.buf.declaration()
			vim.cmd('tabnew')
		end, opts)
		vim.keymap.set('n', 'gd', function()
			vim.lsp.buf.definition()
			vim.cmd('tabnew')
		end, opts)
		vim.keymap.set('n', 'D', function()
			vim.lsp.buf.type_definition()
			vim.cmd('tabnew')
		end, opts)
		-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		-- vim.keymap.set('n', 'D', vim.lsp.buf.type_definition, opts)
	end,
})

-- Completion setup
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- confirmation = { completeopt = 'menu,menuone,noinsert' },
	mapping = cmp.mapping.preset.insert({
		["<c-d>"] = cmp.mapping.scroll_docs(-4),
		["<c-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<c-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, { "i", "s" }),
		["<c-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = 'buffer' },
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
	}
})

