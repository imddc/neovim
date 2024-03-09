local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local mason = require('mason')
local mason_lspconfig = require('mason')

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
mason_lspconfig.setup({
    ensure_installed = { 'pylsp', 'lua_ls', 'rust_analyzer' },
})

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[augroup! * <buffer>]]
        vim.api.nvim_command [[augroup BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[autogroup END]]
    end
end

nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
    cmd = { 'typescript-language-server', '--stdio' },
})

nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostic = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            }
        }
    }
})

nvim_lsp.pylsp.setup({
	on_attach = on_attach,
})
