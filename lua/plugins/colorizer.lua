local staus, colorizer = pcall(require, 'colorizer')
if (not staus) then return end

colorizer.setup({
  '*';
})
