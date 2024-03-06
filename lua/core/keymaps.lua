vim.g.mapleader = ' '

-- define common options
local keymap = vim.keymap

-----------------
-- Normal mode --
-----------------
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'kk', '<ESC>')

-- Hint: see `:h vim.map.set()`
-- Better window navigation
keymap.set('n', '<C-h>', '<C-w>h' )
keymap.set('n', '<C-j>', '<C-w>j' )
keymap.set('n', '<C-k>', '<C-w>k' )
keymap.set('n', '<C-l>', '<C-w>l' )
keymap.set('n', '<S-h>', '0' )
keymap.set('n', '<S-l>', '$' )

-- Resize with arrows
-- delta: 2 lines
keymap.set('n', '<C-Up>', ':resize -2<CR>' )
keymap.set('n', '<C-Down>', ':resize +2<CR>')
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- 窗口
keymap.set('n', '<leader>sv', "<C-w>v")
keymap.set('n', '<leader>sh', "<C-w>s")

-- 取消高亮
keymap.set('n', '<leader>nh', ":nohl<CR>")

-- nvim-tree
keymap.set('n', '<leader>;', ':Neotree<CR>')


-- 切换buffer
keymap.set('n', '<C-L>', ':bnext<CR>')
keymap.set('n', '<C-H>', ':bprevious<CR>')

-----------------
-- Visual mode --
-----------------

keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
