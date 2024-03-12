local status, icons = pcall(require, 'nvim-web-devicons')
if (not status) then
  print('nvim-web-devicons is not working!')
  return
end

icons.setup({
  default = true,
})
