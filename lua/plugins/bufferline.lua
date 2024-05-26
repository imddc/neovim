return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        -- separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_icons = true,
        show_close_icon = false,
        color_icons = true,
      },
    }
  end,
}
