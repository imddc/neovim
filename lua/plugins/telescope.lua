local status, telescope = pcall(require, 'telescope')
if (not status) then
  print('telescope is not working!')
  return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set('n', '<leader>/', builtin.find_files, {})
keymap.set('n', '<leader>.', builtin.live_grep, {})

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    },
    file_ignore_patterns = {
      'lazy-lock.json',
      'node_modules',
      'yarn.lock',
      'pnpm.locl',
      'npm.lock',
      'schema.gql',
    },
    dynamic_preview_title = true,
    path_display = { 'smart' },
  },
  picker = {
    find_files = {
      hidden = true,
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.5
    }
  },
})
