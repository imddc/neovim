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

    -- 状态栏
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 
          'nvim-tree/nvim-web-devicons', 
          opt = true 
      }
    }

    use "nvim-tree/nvim-web-devicons" -- not strictly required, but recommended

    -- 文档树
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        },
    }
    -- neo-tree over

    use 'christoomey/vim-tmux-navigator'  -- 用 ctrl + hjkl 定位窗口
    use 'nvim-treesitter/nvim-treesitter' -- 语法高亮
    use 'p00f/nvim-ts-rainbow' -- 配合treesitter 不同括号颜色区分

    use { 'neovim/nvim-lspconfig' }


    -- 语法补全
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
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

    use 'windwp/nvim-autopairs' -- 自动补全括号
    use 'akinsho/bufferline.nvim' -- buffer 分割线
    use 'lewis6991/gitsigns.nvim' -- 左侧git提示

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end
)
