vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- The best
	use {'neoclide/coc.nvim', branch = 'release'}
	-- The only theme I like
	use 'morhetz/gruvbox'
	-- Well.... I like it
	use 'github/copilot.vim'
end)
