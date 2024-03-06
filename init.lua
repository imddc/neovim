require('plugins.plugins-setup')

require('core.options')
require('core.colorschema')
require('core.keymaps')

require('plugins.plg-icons')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.plg-neo')
--require('plugins.plg-cmp')
require('plugins.plg-lsp')
require('plugins.bufferline')
require('plugins.gitsigns')
require('plugins.telescope')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has 'macunix'
local is_win = has 'win32'

if is_mac then
  require('macos')
end

if is_win then
  return('windows')
end
