-- define common options
local keymap = vim.keymap

vim.g.mapleader = ' '

-- 删除不会加入到寄存器中
keymap.set('n', 'x', '"_x')
keymap.set('n', 'dw', 'vb"_d')

-- esc
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'kk', '<ESC>')

-- 行首行尾
keymap.set('n', '<S-h>', '0' )
keymap.set('n', '<S-l>', '$' )

-- split screen
keymap.set('n', '<leader>sv', "<C-w>v")
keymap.set('n', '<leader>sh', "<C-w>s")

-- 取消高亮
keymap.set('n', '<leader>nh', ":nohl<CR>")
keymap.set('n', '<leader>;', ':Neotree toggle<cr>')

-- toggle buffer
keymap.set('n', '<Tab>', ':BufferLineCycleNext<cr>')
keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<cr>')

-- 缩进
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- 选中条件下上下移动行
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
