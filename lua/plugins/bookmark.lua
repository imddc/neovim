vim.cmd([[highlight BookmarkSign ctermbg=NONE ctermfg=160]])
vim.cmd([[highlight BookmarkLine ctermbg=194 ctermfg=NONE]])

local keymap = vim.keymap

keymap.set(
  'n',
  'ma',
  '<cmd>lua require("telescope").extensions.vim_bookmarks.all()<cr>'
)

keymap.set(
  'n',
  'mc',
  '<cmd>lua require("telescope").extensions.vim_bookmarks.current_file()<cr>'
)
