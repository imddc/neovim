local status, typescript_tools = pcall(require, 'typescript-tools')
if (not status) then
  print('typescript_tools is not working!')
  return
end

local keymap = vim.keymap

typescript_tools.setup({

})

keymap.set('n', '<space>m', '<cmd>TSToolsOrganizeImports<cr>')
keymap.set('n', '<space>a', '<cmd>TSToolsAddMissingImports<cr>')
