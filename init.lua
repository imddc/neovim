require('plugins.plugins-setup')

require('core.options')
require('core.keymaps')

require('plugins.lualine')
require('plugins.neotree')
require('plugins.conform')

require('plugins.lspconfig')
require('plugins.cmpconfig')
require('plugins.lspkind')
require('plugins.treesitter')       -- 语法高亮
require('plugins.term')             -- toggleterm
require('plugins.autopaires')       -- 自动括号配对
require('plugins.typescript-tools') -- ts的导入
require('plugins.lint')
require('plugins.indent')           -- 缩进虚线
require('plugins.comment')          -- 注释
require('plugins.alternate')        -- 快速转换
require('plugins.tailwind')

require('plugins.telescope')
-- require('plugins.bookmark')
require('plugins.bufferline')
-- require('plugins.colorizer')
require('plugins.lspsaga')
require('plugins.gitsigns')


-- require('plugins.null-ls')
require('plugins.mason')
