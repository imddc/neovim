if (not vim.g.neovide) then
  print('no neovide')
end

if vim.g.neovide then
  vim.o.guifont = 'JetbrainsMono Nerd Font:h10:i'
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true -- 记住窗口尺寸
  vim.g.neovide_cursor_vfx_mode = 'pixiedust'
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_scale_factor = 2
end
