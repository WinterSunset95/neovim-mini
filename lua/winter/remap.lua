vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set('t', 'jj', '<C-\\><C-n>')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-j>", "<C-d>")
vim.keymap.set("n", "<C-k>", "<C-u>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<F8>', ':tabnew | term make file=#<cr>i')

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

vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "<C-y>" : "<CR>"', { noremap = true, expr = true })
--vim.keymap.set("i", "<CR>", 'pumvisible () ? "<C-y> ":"<CR>"')
