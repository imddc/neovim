local status, bufferline = pcall(require, 'bufferline')
if (not status) then
  error('bufferline is not working!')
  return
end

bufferline.setup({
  options = {
      -- mode = 'tabs',
      separator_style = 'slant',
      always_show_bufferline = true,
      show_buffer_icons = true,
      show_close_icon = false,
      color_icons = true
  },
  highlights = {
    separator = {
      guifg = '#073642',
      guibg = '#002b36'
    },
    separator_selected = {
      guifg = '#073642'
    },
    background = {
      guifg = '#657b83',
      guibg = '#ff0000'
    },
    buffer_selected = {
      guifg = '#fdf6e3',
      gui = 'bold'
    },
    fill = {
      guibg = '#073642'
    }
  }
})

-- vim.api.nvim_set_keymap('n', '<C-H>', '<cmd>BufferLineCyclePrev<cr>', {})
-- vim.api.nvim_set_keymap('n', '<C-L>', '<cmd>BufferLineCycleNext<cr>', {})
