local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local file_browser = require('telescope').extensions.file_browser.file_browser

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>', opts)
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

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

