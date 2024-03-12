if (not vim.g.neovide) then
  print('no neovide')
end

if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  vim.o.guifont = 'JetbrainsMono Nerd Font:h10:i'
  vim.g.neovide_scale_factor = 2
end
