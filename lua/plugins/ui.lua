return {
  {
    'nvim-mini/mini.nvim',
    keys = {
      { "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open MiniFiles" },
    },
    config = function()
      require("mini.icons").setup()
      require("mini.files").setup()
      require("mini.git").setup()
      require("mini.diff").setup()
      require("mini.tabline").setup()
      require("mini.indentscope").setup()
      require("mini.comment").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() harpoon:setup() end,
    keys = {
      { "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon window" }},
      { "<leader>a", function () harpoon:list():add() end },
      { "<leader>1", function () harpoon:list():select(1) end, { desc = "Harpoon 1" } },
      { "<leader>2", function () harpoon:list():select(2) end, { desc = "Harpoon 2" } },
      { "<leader>3", function () harpoon:list():select(3) end, { desc = "Harpoon 3" } },
      { "<leader>4", function () harpoon:list():select(4) end, { desc = "Harpoon 4" } },
      { "<leader>5", function () harpoon:list():select(5) end, { desc = "Harpoon 5" } },
      { "<leader>6", function () harpoon:list():select(6) end, { desc = "Harpoon 6" } },
      { "<leader>7", function () harpoon:list():select(7) end, { desc = "Harpoon 7" } },
      { "<leader>8", function () harpoon:list():select(8) end, { desc = "Harpoon 8" } },
      { "<leader>9", function () harpoon:list():select(9) end, { desc = "Harpoon 9" } },
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'catppuccin-mocha',
      component_separators = '',
      section_separators = { left = '', right = '' },
    }
  },
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function() 
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'TelescopeResults',
        callback = function()
          vim.wo.foldenable = false
        end
      })
    end,
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Telescope find files' } },
      { '<leader>/', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope live grep' } },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Telescope buffers' } },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Telescope help tags' } },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Telescope keymaps' } },
      { '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Telescope commands' } },
      { '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Telescope diagnostics' } },
      { '<leader>fl', '<cmd>Telescope lsp_references<cr>', { desc = 'Telescope lsp references' } },
      { '<leader>fr', '<cmd>Telescope registers<cr>', { desc = 'Telescope lsp references' } },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
