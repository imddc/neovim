return {
  'akinsho/bufferline.nvim',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_icons = true,
        show_close_icon = false,
        color_icons = true,
      },
      highlights = {
        separator = {
          guifg = '#073642',
          guibg = '#002b3620',
        },
        separator_selected = {
          guifg = '#073642',
        },
        background = {
          guifg = '#657b83',
          guibg = '#ff000020',
        },
        buffer_selected = {
          guifg = '#fdf6e3',
          gui = 'bold',
        },
        fill = {
          guibg = '#07364220',
        },
      },
    }
  end,
}
