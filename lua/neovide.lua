if vim.g.neovide then
  -- 设置字体
  vim.o.guifont = 'FiraCode Nerd Font Mono:h20:i'
  -- 设置窗口缩放
  vim.g.neovide_scale_factor = 1
  -- 设置窗口透明度
  vim.g.neovide_transparency = 0.9
  -- 设置窗口模糊
  vim.g.neovide_window_blurred = true
  -- 设置字体
  vim.opt.linespace = 4
  -- 设置窗口大小
  vim.g.neovide_remember_window_size = true
  -- 设置光标效果
  vim.g.neovide_cursor_vfx_mode = 'railgun'
  -- 设置光标效果透明度
  vim.g.neovide_cursor_vfx_opacity = 200
  -- 设置光标效果颜色
  vim.g.neovide_cursor_vfx_color = '#ff0000'
  -- 设置光标效果宽度
  vim.g.neovide_cursor_vfx_width = 10
  -- 设置光标效果粒子大小
  vim.g.neovide_cursor_vfx_particle_lifetime = 1
  -- 用于查看渲染性能
  vim.g.neovide_profiler = false
  -- 设置渲染刷新率
  vim.g.neovide_refresh_rate = 60

  -- dynamic scale
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set('n', '<D-=>', function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set('n', '<D-->', function()
    change_scale_factor(1 / 1.25)
  end)

  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap(
    '',
    '<D-v>',
    '+p<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    '!',
    '<D-v>',
    '<C-R>+',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    't',
    '<D-v>',
    '<C-R>+',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    'v',
    '<D-v>',
    '<C-R>+',
    { noremap = true, silent = true }
  )
end
