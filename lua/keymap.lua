vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<c-a>', 'ggVG')

keymap.set({ 'n', 'x' }, '<leader>p', '"0p')

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- esc
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'kk', '<ESC>')

-- 行首行尾
keymap.set('n', '<S-h>', '^')
keymap.set('n', '<S-l>', '$')

-- 选中条件下上下移动行
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- 切换buffer
keymap.set('n', '<c-h>', ':BufferLineCyclePrev<cr>')
keymap.set('n', '<c-l>', ':BufferLineCycleNext<cr>')

-- prjject
keymap.set('n', '<leader>d', '<CMD>Telescope neovim-project discover<CR>', {})
keymap.set('n', '<leader>h', '<CMD>Telescope neovim-project history<CR>', {})
