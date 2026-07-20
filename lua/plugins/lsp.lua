return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function ()
      vim.g.vimtex_view_method = "zathura"
    end
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {}
  },
  {
    'stevearc/conform.nvim',
    opts = {},
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
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- 1. Configure lua_ls
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "awesome", "client", "screen", "mouse", "root" }
            }
          }
        }
      })

      local svelte_plugin_path = vim.env.NIX_SVELTE_PLUGIN_PATH

      if not svelte_plugin_path then
        svelte_plugin_path = vim.fn.stdpath("data") .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"
      end

      -- 2. Configure vtsls to recognize Svelte files
      vim.lsp.config('vtsls', {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "typescript-svelte-plugin",
                  location = svelte_plugin_path,
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        }
      })

      -- 3. Enable the servers
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('rust_analyzer')
      vim.lsp.enable('pyright')
      vim.lsp.enable('cssls')
      vim.lsp.enable('html')
      vim.lsp.enable('jsonls')
      vim.lsp.enable('clangd')
      vim.lsp.enable('emmet_language_server')
      vim.lsp.enable('tailwindcss')
      vim.lsp.enable('ltex')
      vim.lsp.enable('texlab')
      vim.lsp.enable('gopls')
      -- vim.lsp.enable('qmlls')
      vim.lsp.enable('svelte')
      vim.lsp.enable('vtsls')

      vim.lsp.enable('nil_ls')

      -- 4. Set up Keymaps and Capability Overrides on Attach
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          -- Set your keybinds
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
          -- Intercept the client that just attached
          -- local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- If the client exists, surgically remove its ability to send semantic tokens
          -- if client then
          --   client.server_capabilities.semanticTokensProvider = nil
          -- end
        end
      })
    end,
  }
}
