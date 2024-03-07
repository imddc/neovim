vim.g.mapleader = ' '

-- define common options
local keymap = vim.keymap

keymap.set('n', 'x', '"_x')
keymap.set('n', 'dw', 'vb"_d')

keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'kk', '<ESC>')

keymap.set('n', '<S-h>', '0' )
keymap.set('n', '<S-l>', '$' )
keymap.set('n', '<leader>sv', "<C-w>v")
keymap.set('n', '<leader>sh', "<C-w>s")
keymap.set('n', '<leader>nh', ":nohl<CR>")
keymap.set('n', '<leader>;', ':Neotree toggle<cr>')
keymap.set('n', '<Tab>', ':BufferLineCycleNext<cr>')
keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<cr>')

keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
