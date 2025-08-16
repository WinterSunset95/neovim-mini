return {
  {
    'mason-org/mason.nvim',
    opts = {}
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 
        "lua_ls",
        "cmake",
        "cssls",
        "cssmodules_ls",
        "tailwindcss",
        "gopls",
        "html",
        "ts_ls",
        "jsonls",
        "pyright",
      },
    }
  }
}
