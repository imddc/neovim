require('plugins.plugins-setup')

require('core.options')
require('core.keymaps')

require('plugins.lualine')
require('plugins.neotree')
require('plugins.conform')

require('plugins.lspconfig')
require('plugins.cmpconfig')
require('plugins.lspkind')
-- require('plugins.treesitter')
require('plugins.autopaires')
require("plugins.ts-autotag")

require('plugins.telescope')
require('plugins.bufferline')
-- require('plugins.colorizer')
require('plugins.lspsaga')
require('plugins.gitsigns')

require('plugins.null-ls')
require('plugins.mason')

-- local has = function(x)
--   return vim.fn.has(x) == 1
-- end
--
-- local is_mac = has 'macunix'
-- local is_win = has 'win32'
--
-- if is_mac then
--   require('macos')
-- end
--
-- if is_win then
--   require('windows')
-- end
