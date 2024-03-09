local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print('treesitter is not work!')
  return
end

treesitter.setup({
  ensure_installed = {
    'vim',
    'rust',
    'lua',
    'javascript',
    'typescript',
    'tsx',
    'vue',
    'css',
    'json'
  },
  highlight = {
    enable = true,
    addition_vim_regex_highlight = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true
  },
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99

vim.keymap.set("n", "<leader>i", "gg=G")
