local keymap = vim.keymap
local todoComment = require('todo-comments')

keymap.set('n', ']t',
  function()
    require('todo-comments').jump_next()
  end,
  { desc = 'Next todo comment' }
)

keymap.set(
  'n',
  '[t',
  function()
    require('todo-comments').jump_prev()
  end,
  { desc = 'Previous todo comment' }
)

keymap.set(
  'n',
  '<leader>t',
  '<cmd>TodoTelescope<cr>',
  { desc = 'Previous todo comment' }
)

todoComment.setup({})
