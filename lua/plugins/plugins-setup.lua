local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- 主题
  use 'tanvirtin/monokai.nvim'
  use 'folke/tokyonight.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = {
      'tjdevries/colorbuddy.nvim'
    }
  }

  -- font
  use "kyazdani42/nvim-web-devicons"

  -- 文档树
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
  }

  use 'christoomey/vim-tmux-navigator'  -- 用 ctrl + hjkl 定位窗口
  use 'p00f/nvim-ts-rainbow' -- 配合treesitter 不同括号颜色区分

  -- 语法补全
  use 'nvimdev/lspsaga.nvim' --LSP UI
  use 'L3MON4D3/LuaSnip' -- snippet
  use 'hoob3rt/lualine.nvim' --statusline
  use 'onsails/lspkind-nvim' --vscode-like pictograms
  use 'hrsh7th/cmp-buffer' --nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' --nvim-cmp source for neovim's build
  use 'hrsh7th/nvim-cmp' --Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- 语法高亮
  use 'jose-elias-alvarez/null-ls.nvim' -- use neovim as a alanguage server
  use 'MunifTanjim/prettier.nvim' -- prettier plugin

  use 'windwp/nvim-autopairs' -- 自动补全括号
  use 'windwp/nvim-ts-autotag' -- ts 自动补全括号

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  -- lsp
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }

  -- gcc 和gc 注释
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'akinsho/bufferline.nvim' -- buffer 分割线
  use 'norcalli/nvim-colorizer'
  use 'lewis6991/gitsigns.nvim' -- 左侧git提示

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end
)
