return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "p00f/clangd_extensions.nvim",
    opts = {},
  },
  {
    "vxpm/ferris.nvim",
    opts = {},
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
