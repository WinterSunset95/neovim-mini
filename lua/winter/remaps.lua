-- Building the function for building and compiling
function build()
	local altbuf = vim.fn.bufnr('#')
	local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
	if (filetype=="c" or filetype=="cpp") then
		vim.cmd("w | tabnew | term make file=#")
		vim.cmd("startinsert")
	elseif (filetype=="java") then
		vim.cmd("w | tabnew | term javac # | java Main")
		vim.cmd("startinsert")
	elseif (filetype=="python") then
		vim.cmd("w | tabnew | term python3 #")
		vim.cmd("startinsert")
	else
		vim.cmd("echo 'Filetype not supported'")
	end
end

vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set('t', 'jj', '<C-\\><C-n>')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>", ":b#<CR>")
vim.keymap.set("n", "<leader>w", "<C-w>w")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set('n', '<F8>', ':lua build()<cr>')
