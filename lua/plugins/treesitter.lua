return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "html", "css", "javascript", "c", "lua", "svelte", "typescript" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "vue" },
      additional_vim_regex_highlighting = false,
    },
  }
}
