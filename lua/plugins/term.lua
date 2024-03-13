local status, term = pcall(require, 'toggleterm')
if (not status) then
  print('toggleterm is not working!')
  return
end

term.setup({
  open_mapping = [[<c-\>]],
})
