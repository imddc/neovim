local status, alternate = pcall(require, 'alternate-toggler')
if (not status) then
  print('alterate is not working!')
  return
end

alternate.setup({
  alternates = {
    ['==='] = '!==',
    ['=='] = '!=',
    ['error'] = 'warn'
  }
})

vim.keymap.set('n', '<leader>i', '<cmd>ToggleAlternate<cr>')
