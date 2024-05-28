return {
  'neovim/nvim-lspconfig',
  -- 'b0o/schemastore.nvim',
  config = function()
    local lspconfig = require 'lspconfig'
    -- local schemastore = require 'schemastore'

    -- graphql
    lspconfig.graphql.setup {
      filetypes = {
        'graphql',
        'gql',
      },
    }

    -- json
    -- lspconfig.jsonls.setup {
    --   settings = {
    --     json = {
    --       -- schemas = schemastore.json.schemas(),
    --       validate = { enable = true },
    --     },
    --   },
    -- }

    -- lua
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    lspconfig.html.setup {}
    lspconfig.cssls.setup {}

    -- tailwind
    lspconfig.tailwindcss.setup {
      color_square_width = 2,
    }

    -- If you are using mason.nvim, you can get the ts_plugin_path like this
    -- local mason_registry = require('mason-registry')
    -- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'
    lspconfig.tsserver.setup {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = '/path/to/@vue/language-server',
            languages = { 'vue', 'json' },
          },
        },
      },
    }

    lspconfig.volar.setup {
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
    }

    -- prisma
    lspconfig.prismals.setup {}
  end,
}
