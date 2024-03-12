local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then
  print('auto-pairs is not working!')
  return
end

autopairs.setup({
  disable_filetype = {
    'TelescopePrompt',
    'vim'
  }
})
