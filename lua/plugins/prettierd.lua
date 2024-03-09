local status, prettierd = pcall(require, 'prettierd')
if (not status) then return end

prettierd.setup({
  bin = 'prettier',
  filetype = {
    'css',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
    'scss',
    'less',
  }
})

