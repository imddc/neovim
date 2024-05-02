return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require 'telescope.builtin'
    local keymap = vim.keymap
    keymap.set('n', '<leader>/', builtin.find_files, {})
    keymap.set('n', '<leader>.', builtin.live_grep, {})

    local actions = require 'telescope.actions'
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['esc'] = actions.close,
          },
          n = {
            ['q'] = actions.close,
          },
        },
        file_ignore_patterns = {
          'codegen.ts',
          '.git',
          'lazy-lock.json',
          '*-lock.yaml',
          'node_modules',
          '%.lock',
        },
        dynamic_preview_title = true,
        path_display = { 'smart' },

        -- layout
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            preview_cutoff = 50,
            preview_width = 0.5,
          },
          vertical = {
            preview_cutoff = 20,
            preview_width = 0.5,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }
  end,
}
