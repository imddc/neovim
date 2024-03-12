local keymap = vim.keymap
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
  print('lsp is not working!')
  return
end

local status_saga, saga = pcall(require, 'lspsaga')
if (not status_saga) then
  print('lspsaga is not working!')
end

local builtin = require('telescope.builtin')

saga.setup({
  ui = {
    border = 'rounded'
  }
})

-- 跳转到错误并显示错误信息
-- keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- keymap.set('n', ']d', vim.diagnostic.goto_next)
-- 替换为saga的
keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

local on_attach = function(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[augroup! * <buffer>]]
    vim.api.nvim_command [[augroup BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[autogroup END]]
  end
end

-- ts-server
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  cmd = { 'typescript-language-server', '--stdio' },
})
-- volar
nvim_lsp.volar.setup({})
-- unocss
nvim_lsp.unocss.setup({})
-- tailwindcss
nvim_lsp.tailwindcss.setup({})

nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostic = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      }
    }
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    -- 替换为saga
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'gd', '<cmd>Lspsaga  goto_definition<cr>', opts)
    -- vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
    keymap.set('n', '<leader>k', '<cmd>Lspsaga hover_doc<cr>', opts)
    -- vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<cr>', opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    keymap.set(
      { 'n', 'v' },
      '<space>ca',
      '<cmd>Lspsaga code_action<cr>',
      opts
    )
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    keymap.set('n', 'gr', builtin.lsp_references, opts)
  end,
})
