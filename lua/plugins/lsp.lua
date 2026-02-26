return {
  { 'lervag/vimtex' },
  {
    "mason-org/mason.nvim",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
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
      vim.lsp.enable('ltex')
      vim.lsp.enable('ltex_plus')
      vim.lsp.enable('texlab')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
        end
      })
    end,
  }
}
