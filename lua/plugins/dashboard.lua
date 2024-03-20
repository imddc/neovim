local header = {
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[╔══╗ ╔╗   ╔═══╗╔═══╗╔╗╔═╗    ╔═══╗╔═══╗╔═══╗╔═══╗╔═══╗╔═╗ ╔╗    ╔═══╗╔════╗╔╗ ╔╗ ╔═══╗ ╔═══╗]],
  [[║╔╗║ ║║   ║╔═╗║║╔═╗║║║║╔╝    ║╔═╗║║╔═╗║║╔═╗║║╔══╝║╔══╝║║╚╗║║    ║╔═╗║║╔╗╔╗║║║ ║║ ║╔══╝ ║╔══╝]],
  [[║╚╝╚╗║║   ║║ ║║║║ ╚╝║╚╝╝     ║╚══╗║║ ╚╝║╚═╝║║╚══╗║╚══╗║╔╗╚╝║    ║╚══╗╚╝║║╚╝║║ ║║ ║╚══╗ ║╚══╗]],
  [[║╔═╗║║║ ╔╗║╚═╝║║║ ╔╗║╔╗║     ╚══╗║║║ ╔╗║╔╗╔╝║╔══╝║╔══╝║║╚╗║║    ╚══╗║  ║║  ║║ ║║ ║╔══╝ ║╔══╝]],
  [[║╚═╝║║╚═╝║║╔═╗║║╚═╝║║║║╚╗    ║╚═╝║║╚═╝║║║║╚╗║╚══╗║╚══╗║║ ║║║    ║╚═╝║ ╔╝╚╗ ║╚═╝║╔╝╚╗  ╔╝╚╗  ]],
  [[╚═══╝╚═══╝╚╝ ╚╝╚═══╝╚╝╚═╝    ╚═══╝╚═══╝╚╝╚═╝╚═══╝╚═══╝╚╝ ╚═╝    ╚═══╝ ╚══╝ ╚═══╝╚══╝  ╚══╝  ]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
}

local opts = {
  theme = 'doom',
  hide = {
    statusline = true,
    tabline = true,
    winbar = true,
  },
  config = {
    header = header,
    center = {
      {
        icon = '',
        desc = 'Lazy sync / TSUpdate / MasonToolsUpdate',
        key = 'u',
        -- action = '<cmd>TSUpdate<cr> <cmd>MasonToolsUpdate<cr>',
        action = 'TSUpdate',
      },
      {
        icon = '',
        desc = 'Lazy sync',
        key = 'l',
        action = 'Lazy sync',
      },
      {
        icon = '',
        desc = 'Find files',
        key = 'f',
        action = 'Telescope',
      },
      {
        icon = '',
        desc = 'Open Term',
        key = 'g',
        action = 'ToggleTerm',
      },
      {
        icon = '',
        desc = 'Todo List',
        key = 't',
        action = 'TodoTelescope',
      },
      {
        icon = '',
        desc = 'Mason',
        key = 'm',
        action = 'Mason',
      },
      {
        icon = '',
        desc = 'Project',
        key = 'p',
        action = 'Telescope neovim-project history',
      },
      -- {
      --   icon = '',
      --   desc = 'Oil',
      --   key = 'o',
      --   action = 'Oil',
      -- },
      {
        icon = '',
        desc = 'Empty buffer',
        key = 'e',
        action = 'BufferLineCloseOthers',
      },
      {
        icon = '',
        desc = 'Quit',
        key = 'q',
        action = 'q',
      },
    },
  },
}

local padding = {
  left = 3,
  right = 3,
}
for _, i in ipairs(opts.config.center) do
  i.desc = string.rep(' ', padding.left)
    .. i.desc
    .. string.rep(' ', padding.right)
end

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = opts,
  dependencies = 'nvim-tree/nvim-web-devicons',
}
