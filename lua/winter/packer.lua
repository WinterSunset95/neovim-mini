vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- What is life without emmet?
	use 'mattn/emmet-vim'
	-- The best
	use 'morhetz/gruvbox'
	-- Well.... I like it
	use 'github/copilot.vim'
	-- I tried to write one on my own.. I failed miserably
	use 'jiangmiao/auto-pairs'
	-- Can't live without lsp
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
end)
