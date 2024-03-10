local opt = vim.opt

vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'fish'
opt.backupskip = '/tmp/*, /private/tmp/*'
opt.inccommand = 'split'
opt.ignorecase = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ai = true    -- auto indent
opt.si = true    -- smart indent
opt.wrap = false -- no wrap lines
opt.smartcase = true
opt.backspace = 'start,eol,indent'
opt.path:append { '**' } -- finding files -- search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = '\e[4:3m']])
vim.cmd([[let &t_Ce = '\e[4:0m']])
-- but this doesn't work on iterm2

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

-- Add asterisks
opt.formatoptions:append { 'r' }

-- highlight
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'


opt.clipboard:append('unnamedplus') -- use system clipboard
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.mouse:append('a')               -- allow the mouse to be used in Nvim

--默认新窗口右和下
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
-- 终端真颜色
opt.relativenumber = true
opt.signcolumn = 'yes'

-- Searching
opt.incsearch = true

opt.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300
    })
  end
})
