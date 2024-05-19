local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true

opt.signcolumn = 'yes'
opt.number = true
opt.scrolloff = 10

opt.incsearch = true

opt.mouse:append 'a'
opt.clipboard:append 'unnamedplus'

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

-- opt.cursorline = true
opt.termguicolors = true

opt.ai = true -- auto indent
opt.si = true -- smart indent
opt.wrap = false -- no wrap lines
opt.backspace = 'start,eol,indent'
opt.path:append { '**' } -- finding files -- search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

--默认新窗口右和下
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
-- 终端真颜色
opt.relativenumber = true

-- Undercurl
vim.cmd [[let &t_Cs = '\e[4:3m']]
vim.cmd [[let &t_Ce = '\e[4:0m']]
-- but this doesn't work on iterm2

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste',
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300,
    }
  end,
})
