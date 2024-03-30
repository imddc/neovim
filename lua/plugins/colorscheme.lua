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
--     require('monokai-pro').setup()
--   end,
-- }
