return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    keys = {
      { "<C-K>", function() require("luasnip").expand() end, {silent = true}, mode = "i" },
      { "<C-L>", function() require("luasnip").jump( 1) end, {silent = true}, mode = {"i", "s"} },
      { "<C-J>", function() require("luasnip").jump(-1) end, {silent = true}, mode = {"i", "s"} },
      { "<C-E>", function()
          if require("luasnip").choice_active() then
            require("luasnip").change_choice(1)
          end
        end, {silent = true}, mode = {"i", "s"} },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      { 'saghen/blink.lib' },
    },
    -- build = "cargo build --release",
    build = function() require('blink.cmp').build():pwait() end,
    opts = {
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
    },
  },
  { 'folke/which-key.nvim' },
}


-- local keymap = vim.keymap.set
--
-- -- Todo
-- todo_comments.setup({
--   keywords = {
--     FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
--     TODO = { icon = " ", color = "info" },
--     HACK = { icon = " ", color = "warning" },
--     WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
--   },
-- })
--
-- keymap("n", "]t", function() todo_comments.jump_next() end, { desc = "Next Todo Comment" })
-- keymap("n", "[t", function() todo_comments.jump_prev() end, { desc = "Previous Todo Comment" })
-- keymap("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { silent = true, noremap = true, desc = "Todo (Trouble)" })
-- keymap("n", "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", { silent = true, noremap = true, desc = "Todo/Fix/Fixme (Trouble)" })
-- keymap("n", "<leader>st", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true, desc = "Todo" })
-- keymap("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { silent = true, noremap = true, desc = "Todo/Fix/Fixme" })

