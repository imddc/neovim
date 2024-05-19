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

opt.relativenumber = true
opt.signcolumn = 'yes'
opt.number = true
opt.scrolloff = 10

opt.incsearch = true

opt.mouse:append 'a'
opt.clipboard:append 'unnamedplus'

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.incsearch = true

-- opt.cursorline = true
opt.termguicolors = true

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300,
    }
  end,
})

--
