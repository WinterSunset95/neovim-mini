require("mini.icons").setup()
require("mini.files").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.tabline").setup()
require("mini.indentscope").setup()

local builtin = require('telescope.builtin')

-- Mini files
vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "Open Files" })

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keymaps' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope commands' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
vim.keymap.set('n', '<leader>fl', builtin.lsp_references, { desc = 'Telescope lsp references' })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Telescope lsp references' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopeResults',
  callback = function()
    vim.wo.foldenable = false
  end
})
