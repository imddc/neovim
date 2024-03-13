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
  'simrat39/rust-tools.nvim', -- rust
  'nvimdev/lspsaga.nvim',
  {
    "folke/flash.nvim", -- 快速跳转
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "coffebar/neovim-project", -- 项目切换
    opts = {
      projects = {             -- define project roots
        "~/workspace/*",
        '~/Desktop/item/front/pc/*'
      },
    },
    init = function()
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
  {
    "folke/todo-comments.nvim", -- todo 注释
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  },
  {
    'Wansmer/treesj', -- 用于切换箭头函数是否简写
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  'gcmt/wildfire.vim', -- 快速选中
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  'rmagatti/alternate-toggler', -- 快速切换
  'echasnovski/mini.nvim',      -- mini.indentscope 缩进线
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  'mfussenegger/nvim-lint',
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig', opts = {} }
  },
  {
    'nvim-telescope/telescope.nvim', -- 搜索树
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'MattesGroeger/vim-bookmarks',               -- vim bookmarks
  'tom-anders/telescope-vim-bookmarks.nvim',   -- telescope bookmarks
  'sainnhe/everforest',                        -- 主题
  'tanvirtin/monokai.nvim',                    -- 主题 monokai
  'glepnir/dashboard-nvim',                    -- dashboard
  -- 'nvimdev/dashboard-nvim',
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
  'L3MON4D3/LuaSnip',                       -- snippet
  'hoob3rt/lualine.nvim',                   -- statusline
  'onsails/lspkind-nvim',                   -- vscode-like pictograms
  'hrsh7th/cmp-buffer',                     -- nvim-cmp source for buffer words
  'hrsh7th/cmp-nvim-lsp',                   -- nvim-cmp source for neovim's build
  'hrsh7th/nvim-cmp',                       -- Completion
  'nvim-treesitter/nvim-treesitter',        -- treesitter
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
-- vim.cmd('colorscheme monokai_pro')
