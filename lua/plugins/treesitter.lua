local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print('treesitter is not working!')
  return
end

treesitter.setup({
  ensure_installed = {
    'javascript',
    'typescript',
    'javascript',
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
    "lua",
    'vue',
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

require('template-string').setup({
  filetypes = {
    'html',
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
    'svelte',
    'python'
  },                              -- filetypes where the plugin is active
  jsx_brackets = true,            -- must add brackets to JSX attributes
  remove_template_string = false, -- remove backticks when there are no template strings
  restore_quotes = {
    normal = [[']],
    jsx = [["]],
  },
})
