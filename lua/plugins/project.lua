return {
  'coffebar/neovim-project',
  opts = {
    projects = { -- define project roots
      '~/.config/nvim',
      '~/Desktop/item/monorepo/*',
      '~/Desktop/item/electron/*',
      '~/Desktop/item/front/*',
      '~/Desktop/item/backend/*',
      '~/Desktop/item/test-demo',
      '~/Desktop/item/forks/*',
      '~/Desktop/item/rust/*',
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'Shatur/neovim-session-manager' },
  },
  lazy = false,
  priority = 100,
}
