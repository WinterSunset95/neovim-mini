-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'Exafunction/windsurf.vim'
  use 'nvim-mini/mini.nvim'
  use {
    'neovim/nvim-lspconfig',
    as = 'lspconfig',
  }
  use 'p00f/clangd_extensions.nvim'
  use 'folke/tokyonight.nvim'
  use 'folke/which-key.nvim'
  use 'folke/trouble.nvim'
  use 'folke/todo-comments.nvim'
  use 'mason-org/mason.nvim'
  use 'mason-org/mason-lspconfig.nvim'
  use 'morhetz/gruvbox'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
   'nvim-telescope/telescope.nvim', tag = '0.1.8',
   requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'saghen/blink.cmp',
    run = "cargo build --release",
    requires = {
      'rafamadriz/friendly-snippets',
      {
        'L3MON4D3/LuaSnip',
        tag = 'v2.*',
        run = 'make install_jsregexp',
      },
    },
  }
  use {
    'folke/lazydev.nvim',
    after = 'lspconfig',
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
end)
