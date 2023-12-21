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
	-- It's a duck
	use {
		'tamton-aquib/duck.nvim',
		config = function()
			vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
			vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
		end
	}
end)
