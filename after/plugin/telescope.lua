local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require('telescope').setup({
  defaults = {
	layout_config = {
	  prompt_position = "top",
	},
	file_ignore_patterns = {
		"*.xpm",
		"*.ico",
		"*.png",
		"*.jpg",
		"*.jpeg",
		"*.gif",
		"*.svg",
		"*.ttf",
		"*.otf",
		"*.woff",
		"*.woff2",
		"*.xcf"
	},
}
