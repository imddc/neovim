local status, conform = pcall(require, 'conform')
if (not status) then
  print('conform is not work!')
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    css = { 'prettierd' },
    html = { 'prettierd' },
    json = { 'prettierd' },
    yaml = { 'prettierd' },
    markdown = { 'prettierd' },
    graphql = { 'prettierd' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  }
})
