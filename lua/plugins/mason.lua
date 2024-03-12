local status_mason, mason = pcall(require, 'mason')
if (not status_mason) then
  print('mason is not working!')
  return
end

local status_ml, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not status_ml) then
  print('mason-lspconfig is not work!')
  return
end

local status_mti, mti = pcall(require, 'mason-tool-installer')
if (not status_mti) then
  print('mason-tool-installer is not work!')
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lspconfig.setup({})

mti.setup({
  ensure_installed = {
    'lua-language-server',
    'tailwindcss',
    'stylua',
    'eslint_d'
  }
})

require('lspconfig').tailwindcss.setup({})
