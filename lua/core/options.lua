local opt = vim.opt
opt.clipboard:append('unnamedplus') -- use system clipboard 
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.mouse:append('a')  -- allow the mouse to be used in Nvim

-- Tab
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- UI config
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = false

-- Searching
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = 'yes'

