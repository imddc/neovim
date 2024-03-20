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
        key = 's',
        action = 'UpdateAndSyncAll',
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
        action = 'TelescopeFindFiles',
      },
      {
        icon = '',
        desc = 'Neogit',
        key = 'g',
        action = 'Neogit',
      },
      {
        icon = '',
        desc = 'DiffView main',
        key = 'd',
        action = 'DiffviewOpen origin/main...HEAD',
      },
      {
        icon = '',
        desc = 'Mason',
        key = 'm',
        action = 'Mason',
      },
      {
        icon = '',
        desc = 'Restore session',
        key = 'r',
        action = 'SessionRestore',
      },
      {
        icon = '',
        desc = 'Oil',
        key = 'o',
        action = 'Oil',
      },
      {
        icon = '',
        desc = 'Empty buffer',
        key = 'e',
        action = 'enew',
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
