return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  opts = {
    auto_update = true,
    run_on_start = true,
  },
  cmd = 'MasonToolsUpdate',
  event = 'BufReadPre',
  dependencies = 'williamboman/mason.nvim',
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'lua-language-server',
        'stylua',
        'eslint_d',
        'prettierd',
        'rust-analyzer',
        'graphql-language-service-cli',
        'prisma-language-server',
        'vue-language-server',
      },
    }
  end,
}
