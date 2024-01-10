vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- The only theme I like
	use 'morhetz/gruvbox'
	-- Been quite useful for me
	use 'github/copilot.vim'
	-- Lsp stuff
	use {'neoclide/coc.nvim', branch = 'release'}
	-- Who doesn't like treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)
