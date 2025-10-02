local ls = require("luasnip")
local trouble = require("trouble")
local todo_comments = require("todo-comments")
local comment = require("mini.comment")
local blink = require('blink.cmp')

comment.setup()

local keymap = vim.keymap.set

blink.setup({
  snippets = {
    preset = 'luasnip'
  },
  keymap = {
    preset = 'none',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' },
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = { documentation = { auto_show = true } },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})

-- Luasnip
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- Trouble
trouble.setup({
  modes = {
    lsp = {
      win = { position = "right" },
    },
  },
})

keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { silent = true, noremap = true, desc = "Buffer Diagnostics (Trouble)" })
keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle<cr>", { silent = true, noremap = true, desc = "Symbols (Trouble)" })
keymap("n", "<leader>cS", "<cmd>Trouble lsp toggle<cr>", { silent = true, noremap = true, desc = "LSP references/definitions/... (Trouble)" })
keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { silent = true, noremap = true, desc = "Location List (Trouble)" })
keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { silent = true, noremap = true, desc = "Quickfix List (Trouble)" })

-- Todo
todo_comments.setup({
  keywords = {
    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
  },
})

keymap("n", "]t", function() todo_comments.jump_next() end, { desc = "Next Todo Comment" })
keymap("n", "[t", function() todo_comments.jump_prev() end, { desc = "Previous Todo Comment" })
keymap("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { silent = true, noremap = true, desc = "Todo (Trouble)" })
keymap("n", "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", { silent = true, noremap = true, desc = "Todo/Fix/Fixme (Trouble)" })
keymap("n", "<leader>st", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true, desc = "Todo" })
keymap("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { silent = true, noremap = true, desc = "Todo/Fix/Fixme" })
