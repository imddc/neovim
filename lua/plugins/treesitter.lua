local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print('treesitter is not working!')
  return
end

treesitter.setup({
  ensure_installed = {
    'javascript',
    'typescript',
    'html',
    'css',
    'json',
    'graphql',
    'regex',
    'rust',
    'prisma',
    'markdown',
    'markdown_inline',
    'tsx',
    "vim",
    'vue',
    "lua",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true
  },
})

-- 用于在字符串中输入${}时自动将''转变为``
require('template-string').setup({})

-- za 折叠
local opt = vim.opt
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
