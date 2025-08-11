vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- The only theme I like
	use 'morhetz/gruvbox'
	use 'folke/tokyonight.nvim'
	-- Who doesn't like treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	-- Which key to press next?
	use { "folke/which-key.nvim" }
	-- I want offline devdocs
	use {
		"luckasRanarison/nvim-devdocs",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	}

	-- Next we configure lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use "williamboman/mason-lspconfig.nvim"
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- Extra lsp features
	-- Lua
	use 'folke/neodev.nvim'
	-- Rust analyzer
	use 'vxpm/ferris.nvim'
	-- Typescript
	use {
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("typescript-tools").setup {}
		end,
	}
	-- Clangd
	use 'p00f/clangd_extensions.nvim'
	-- Emmet 
	use 'olrtg/nvim-emmet'

	-- For YUCK files
	use 'elkowar/yuck.vim'

	-- Codeium
	use 'Exafunction/windsurf.vim'

	-- Icons
	use 'nvim-tree/nvim-web-devicons'

	-- Latex
	use 'lervag/vimtex'

end)
