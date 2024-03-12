local keymap = vim.keymap
local status, typescript_tools = pcall(require, 'typescript-tools')
if (not status) then
  print('typescript_tools is not working!')
  return
end

keymap.set('n', '<space>m', '<cmd>TSToolsOrganizeImports<cr>')
keymap.set('n', '<space>a', '<cmd>TSToolsAddMissingImports<cr>')

local api = require('typescript-tools.api')

typescript_tools.setup({
  handlers = {
    ['textDocument/publishDiagnostics'] = api.filter_diagnostics(
      { 6133 }
    )
  }
})
