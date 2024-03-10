local status, conform = pcall(require, 'conform')
if (not status) then
  print('conform is not work!')
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  }
})
