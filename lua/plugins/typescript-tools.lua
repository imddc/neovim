local keymap = vim.keymap
local status, typescript_tools = pcall(require, 'typescript-tools')
if (not status) then
  print('typescript_tools is not working!')
  return
end

keymap.set('n', '<space>m', '<cmd>TSToolsOrganizeImports<cr>')
keymap.set('n', '<space>a', '<cmd>TSToolsAddMissingImports<cr>')

local status_api, api = pcall(require, 'typescript-tools.api')
if (not status_api) then
  print('typescript_tools is not working!')
  return
end

typescript_tools.setup({
  handlers = {
    ['textDocument/publishDiagnostics'] = api.filter_diagnostics(
      { 6133 }
    )
  }
})
