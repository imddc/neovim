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
  'mfussenegger/nvim-lint',
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      opts = {}
    }
  },
  { -- 搜索树
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'MattesGroeger/vim-bookmarks',               -- vim bookmarks
  'tom-anders/telescope-vim-bookmarks.nvim',   -- telescope bookmarks
  'sainnhe/everforest',                        -- 主题
  'williamboman/mason.nvim',                   -- mason
  'williamboman/mason-lspconfig.nvim',         -- mason lspconfig
  'neovim/nvim-lspconfig',                     -- lspconfig
  'WhoIsSethDaniel/mason-tool-installer.nvim', -- mason tools
  'stevearc/conform.nvim',                     -- 格式化
  "kyazdani42/nvim-web-devicons",              -- font icon
  {                                            -- neotree
    "nvim-neo-tree/neo-tree.nvim",             -- neo tree
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  'nvimdev/lspsaga.nvim',
  'L3MON4D3/LuaSnip',     -- snippet
  'hoob3rt/lualine.nvim', --statusline
  'onsails/lspkind-nvim', --vscode-like pictograms
  'hrsh7th/cmp-buffer',   --nvim-cmp source for buffer words
  'hrsh7th/cmp-nvim-lsp', --nvim-cmp source for neovim's build
  'hrsh7th/nvim-cmp',     --Completion
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  'p00f/nvim-ts-rainbow',                   -- 配合treesitter 不同括号颜色区分
  'windwp/nvim-autopairs',                  -- 自动补全括号
  'windwp/nvim-ts-autotag',                 -- ts 自动补全括号
  'axelvc/template-string.nvim',
  "roobert/tailwindcss-colorizer-cmp.nvim", -- tailwind自动补全
  'mg979/vim-visual-multi',                 -- 多光标
  'hrsh7th/cmp-path',                       -- cmp 相关
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  'numToStr/Comment.nvim',   -- gcc注释
  'akinsho/bufferline.nvim', -- buffer
  -- 'norcalli/nvim-colorizer',
  'lewis6991/gitsigns.nvim', -- 左侧git提示
})

-- theme
vim.cmd('colorscheme everforest')
