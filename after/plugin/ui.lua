require("mini.icons").setup()
require("mini.files").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.tabline").setup()
require("mini.indentscope").setup()
local lualine = require('lualine')
local harpoon = require("harpoon")

lualine.setup({
  options = {
    theme = 'catppuccin-mocha',
    component_separators = '',
    section_separators = { left = '', right = '' },
  }
})

-- Harpoon
harpoon:setup()
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>a", function ()
  harpoon:list():add()
end)
vim.keymap.set("n", "<leader>1", function () harpoon:list():select(1) end, { desc = "Harpoon 1" })
vim.keymap.set("n", "<leader>2", function () harpoon:list():select(2) end, { desc = "Harpoon 2" })
vim.keymap.set("n", "<leader>3", function () harpoon:list():select(3) end, { desc = "Harpoon 3" })
vim.keymap.set("n", "<leader>4", function () harpoon:list():select(4) end, { desc = "Harpoon 4" })
vim.keymap.set("n", "<leader>5", function () harpoon:list():select(5) end, { desc = "Harpoon 5" })
vim.keymap.set("n", "<leader>6", function () harpoon:list():select(6) end, { desc = "Harpoon 6" })
vim.keymap.set("n", "<leader>7", function () harpoon:list():select(7) end, { desc = "Harpoon 7" })
vim.keymap.set("n", "<leader>8", function () harpoon:list():select(8) end, { desc = "Harpoon 8" })
vim.keymap.set("n", "<leader>9", function () harpoon:list():select(9) end, { desc = "Harpoon 9" })

-- Mini files
vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "Open Files" })

-- Telescope
local builtin = require('telescope.builtin')

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
