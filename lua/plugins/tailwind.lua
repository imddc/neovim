local status, tailwind = pcall(require, 'tailwindcss-colorizer-cmp')
if (not status) then
  print('tailwindcss is not working!')
  return
end

tailwind.setup({
  color_square_width = 2
})
