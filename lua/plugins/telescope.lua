local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disable netrw add use telescope-file-browser
      ['i'] = {
        ['<C-w>'] = function() vim.cmd('normal vbd') end,
      },
      ['n'] = {
        ['N'] = fb_actions.create,
        ['h'] = fb_actions.goto_parent_dir,
        ['/'] = function()
          vim.cmd('startinsert')
        end
      }
    }
  }
})


vim.keymap.set('n', '<leader>/', builtin.find_files, {})
vim.keymap.set('n', '<leader>.', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

