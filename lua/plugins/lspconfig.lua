local lspconfig = require 'lspconfig'
local on_attach = function(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[augroup! * <buffer>]]
    vim.api.nvim_command [[augroup BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[autogroup END]]
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
      on_attach = on_attach,
      capabilities = capabilities,
    }

    lspconfig.tsserver.setup {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            -- location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
            -- volar2 不会管理 .vue的 <script> 块中的 TypeScript
            -- 因此tsserver需要调用volar插件以认出 '.vue'
            location = '/opt/homebrew/lib/node_modules/@vue/typescript-plugin',
            languages = { 'javascript', 'typescript', 'vue' },
          },
        },
      },

      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
      },
    }

    -- unocss
    -- lspconfig.unocss.setup {
    --   on_attach = on_attach,
    --   cmd = {
    --     'unocss-langurage-server',
    --     '--stdio',
    --   },
    --   filetypes = {
    --     'html',
    --     'vue',
    --     'javascriptreact',
    --     'typescriptreact',
    --   },
    -- }
    -- tailwindcss
    lspconfig.tailwindcss.setup {
      on_attach = on_attach,
    }
    -- css
    lspconfig.cssls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    -- html
    lspconfig.html.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.marksman.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    lspconfig.jsonls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    -- prisma
    lspconfig.prismals.setup {}
  end,
}
