local status, toggleTerm = pcall(require, 'toggleterm')
if (not status) then
  print('toggleterm is not working!')
  return
end

toggleTerm.setup({
  open_mapping = [[<c-\>]],
  direction = 'float',
  auto_scroll = true,
  float_opts = {
    border = 'curved',
    width = 130,
    height = 30,
  },
})
