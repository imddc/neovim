local status_mason, mason = pcall(require, 'mason')
if (not status_mason) then
  print('mason is not work!')
  return
end

local status_ml, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not status_ml) then
  print('mason-lspconfig is not work!')
  return
end

local status_lspconfig, lspconfig = pcall(require, 'lspcofig')
if (not status_lspconfig) then
  print('mason-lspconfig is not work!')
  return
end

mason.setup({})
mason_lspconfig.setup({
  ensure_installed = {
    'lua-language-server',
    'tailwindcss',
    'stylua',
    'eslint_d'
  }
})

lspconfig.tailwindcss.setup({})
