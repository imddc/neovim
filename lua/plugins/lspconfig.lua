local lspconfig = require 'lspconfig'
local on_attach = function(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[augroup! * <buffer>]]
    vim.api.nvim_command [[augroup BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[autogroup END]]
  end
end

return {
  'neovim/nvim-lspconfig',
  config = function()
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
            globals = {
              'vim',
            },
          },
        },
      },
    }

    -- volar
    lspconfig.volar.setup {
      filetypes = {
        'typescript',
        'javascript',
        'vue',
      },
      on_attach = on_attach,
      init_options = {
        typescript = {
          tsdk = '/Users/dccd/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib',
        },
        preferences = {
          disableSuggestions = true,
        },
        languageFeatures = {
          implementation = true,
          references = true,
          definition = true,
          typeDefinition = true,
          callHierarchy = true,
          hover = true,
          rename = true,
          renameFileRefactoring = true,
          signatureHelp = true,
          codeAction = true,
          workspaceSymbol = true,
          diagnostics = true,
          semanticTokens = true,
          completion = {
            defaultTagNameCase = 'both',
            defaultAttrNameCase = 'kebabCase',
            getDocumentNameCasesRequest = false,
            getDocumentSelectionRequest = false,
          },
        },
      },
    }

    -- unocss
    lspconfig.unocss.setup {
      on_attach = on_attach,
    }
    -- tailwindcss
    lspconfig.tailwindcss.setup {
      on_attach = on_attach,
    }
    lspconfig.cssls.setup {
      on_attach = on_attach,
    }
    -- html
    lspconfig.html.setup {
      on_attach = on_attach,
    }
    -- prisma
    lspconfig.prismals.setup {}
  end,
}
