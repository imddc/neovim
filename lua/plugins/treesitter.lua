local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print('treesitter is not work!')
  return
end

treesitter.setup({
  ensure_installed = {
    "c",
    'css',
    'javascript',
    'json',
    "lua",
    'rust',
    'tsx',
    'typescript',
    "vim",
    "vimdoc",
    'vim',
    'vue',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
})

-- treesitter.setup({
--   ensure_installed = {
--   },
--   highlight = {
--     enable = true,
--     addition_vim_regex_highlight = false,
--   },
--   indent = {
--     enable = true,
--     disable = {},
--   },
--   autotag = {
--     enable = true
--   },
-- })

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99

vim.keymap.set("n", "<leader>i", "gg=G")
