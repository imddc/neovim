local keymap = vim.keymap
local status, alternate = pcall(require, 'alternate-toggler')
if (not status) then
  print('alterate is not working!')
  return
end

alternate.setup({
  alternates = {
    ['==='] = '!==',
    ['=='] = '!=',
    ['error'] = 'warn'
  }
})

keymap.set('n', '<leader>i', '<cmd>ToggleAlternate<cr>')

local tsj = require('treesj')
tsj.setup({
  use_default_keymaps = true,
})

keymap.set('n', '<leader>j', require('treesj').toggle)
keymap.set('n', '<leader>J', function()
  require('treesj').toggle({ split = { recursive = true } })
end)
