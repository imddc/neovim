return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

    -- graphql
    lspconfig.graphql.setup {
      filetypes = {
        'graphql',
        'gql',
      },
    }

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

    -- volar
    lspconfig.volar.setup {}
    -- unocss
    lspconfig.unocss.setup {}
    -- tailwindcss
    lspconfig.tailwindcss.setup {}
    -- prisma
    lspconfig.prismals.setup {}
  end,
}
