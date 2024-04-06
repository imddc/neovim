return {
  'sainnhe/everforest',
  priority = 1000,
  config = function()
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.cmd [[colorscheme everforest]]
    -- vim.cmd [[colorscheme monokai_pro]]
  end,
}

-- return {
--   'loctvl842/monokai-pro.nvim',
--   config = function()
--     vim.cmd [[colorscheme monokai-pro]]
--     -- require('monokai-pro').setup()
--   end,
-- }
-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd [[colorscheme tokyonight-night]]
--     -- vim.cmd [[colorscheme tokyonight-storm]]
--     -- vim.cmd [[colorscheme tokyonight-day]]
--     -- vim.cmd [[colorscheme tokyonight-moon]]
--   end,
-- }
