local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
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
  autotag = {
    enable = true
  }
}
