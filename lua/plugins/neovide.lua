if vim.g.neovide then
  vim.g.neovide_transparency = 0.8

  vim.o.guifont = 'JetbrainsMono Nerd Font:h14:i'
  vim.g.neovide_scale_factor = 2
  vim.opt.linespace = 2

  -- padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- window
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 0.5
  vim.g.neovide_floating_blur_amount_y = 0.5
end
