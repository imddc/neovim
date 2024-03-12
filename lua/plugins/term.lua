local status, term = pcall(require, 'toggleterm')
if (not status) then
  print('toggleterm is not working!')
  return
end

term.setup({
  open_mapping = [[<c-\>]],
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = 130,
    height = 30,
  },
})
