return {
  {
    'morhetz/gruvbox',
    opts = {}
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd("colorscheme tokyonight-night")
      vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    end
  },
}
