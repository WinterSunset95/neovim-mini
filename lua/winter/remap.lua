





vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set('t', 'jj', '<C-\\><C-n>')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<leader>L", "<right>")
vim.keymap.set("i", "<leader>H", "<left>")

vim.keymap.set("n", "<C-j>", "<C-d>")
vim.keymap.set("n", "<C-k>", "<C-u>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- autopairs
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "`", "``<left>")
vim.keymap.set("i", "<", "<><left>")

vim.keymap.set("i", '"""', '""')
vim.keymap.set("i", "'''", "''")
vim.keymap.set("i", "()", "()")
vim.keymap.set("i", "[]", "[]")
vim.keymap.set("i", "{}", "{}")
vim.keymap.set("i", "``", "``")
vim.keymap.set("i", "<>", "<>")

vim.keymap.set("i", "```", "``````<left><left><left>")

vim.keymap.set("i", "{<cr>", "{<cr>}<esc>O")
