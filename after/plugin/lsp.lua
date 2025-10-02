require("mason").setup()

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "awesome", "client", "screen", "mouse", "root" }
      }
    }
  }
})
vim.lsp.enable('lua_ls')

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('cssls')
vim.lsp.enable('html')
vim.lsp.enable('jsonls')
vim.lsp.enable('clangd')
vim.lsp.enable('emmet_language_server')
vim.lsp.enable('tailwindcss')

require('lazydev').setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  }
})
