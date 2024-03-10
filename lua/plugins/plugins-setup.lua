local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, 'lazy')
if (not status) then
  print('lazy is not work!')
  return
end

lazy.setup({
  'sainnhe/everforest',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  "kyazdani42/nvim-web-devicons", -- font icon
  {                               -- neotree
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  'christoomey/vim-tmux-navigator', -- hjkl 定位窗口
  'p00f/nvim-ts-rainbow',           -- 配合treesitter 不同括号颜色区分
  'nvimdev/lspsaga.nvim',
  'L3MON4D3/LuaSnip',               -- snippet
  'hoob3rt/lualine.nvim',           --statusline
  'onsails/lspkind-nvim',           --vscode-like pictograms
  'hrsh7th/cmp-buffer',             --nvim-cmp source for buffer words
  'hrsh7th/cmp-nvim-lsp',           --nvim-cmp source for neovim's build
  'hrsh7th/nvim-cmp',               --Completion
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },                                 -- 语法高亮
  'jose-elias-alvarez/null-ls.nvim', -- use neovim as a alanguage server
  'MunifTanjim/prettier.nvim',       -- prettier plugin
  {
    'windwp/nvim-autopairs',         -- 自动补全括号
    event = 'InsertEnter',
    opts = {}
  },
  'windwp/nvim-ts-autotag',        -- ts 自动补全括号
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim', -- 搜索树
  'hrsh7th/cmp-path',              -- cmp 相关
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  'numToStr/Comment.nvim',   -- gcc注释
  'akinsho/bufferline.nvim', -- buffer
  -- 'norcalli/nvim-colorizer',
  'lewis6991/gitsigns.nvim', -- 左侧git提示
})

-- theme
vim.cmd('colorscheme everforest')
