local source_mapping = {
  nvim_lsp = '[LSP]',
  nvim_lua = '[LUA]',
  luasnip = '[SNIP]',
  buffer = '[BUF]',
  path = '[PATH]',
  treesitter = '[TREE]',
  cmp_ai = '[AI]',
  ['vim-dadbod-completion'] = '[DB]',
}

local config = function()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  local lspkind = require 'lspkind'
  local cmp_tailwind = require 'tailwindcss-colorizer-cmp'

  cmp.setup {
    completion = {
      completeopt = 'menu,menuone,preview,noselect',
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    view = {
      entries = { name = 'custom', selection_order = 'near_cursor' },
    },
    formatting = {
      format = lspkind.cmp_format {
        mode = 'symbol_text',
        ellipsis_char = '...',
        before = function(entry, vim_item)
          cmp_tailwind.formatter(entry, vim_item)
          return vim_item
        end,
        menu = source_mapping,
      },
    },
    snippet = { -- configure how nvim-cmp interacts with snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources {
      {
        name = 'luasnip',
        group_index = 1,
        option = { use_show_condition = true },
        entry_filter = function()
          local context = require 'cmp.config.context'
          return not context.in_treesitter_capture 'string'
            and not context.in_syntax_group 'String'
        end,
      },
      { name = 'nvim_lsp', group_index = 2 },
      {
        name = 'copilot',
        group_index = 2,
        option = { use_show_condition = true },
        entry_filter = function()
          return not vim.g.leetcode
        end,
      },
      { name = 'nvim_lua', group_index = 3 },
      { name = 'crates', group_index = 3 },
      { name = 'treesitter', keyword_length = 4, group_index = 4 },
      { name = 'path', keyword_length = 4, group_index = 4 },
      {
        name = 'buffer',
        keyword_length = 3,
        group_index = 5,
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      },
      { name = 'emoji', keyword_length = 2, group_index = 6 },
      { name = 'nerdfont', keyword_length = 2, group_index = 6 },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        -- require 'cmp_ai.compare',
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
    experimental = {
      native_menu = false,
      ghost_text = false,
    },
  }

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    }),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })

  -- snippets
  require('luasnip.loaders.from_vscode').load {
    paths = { '~/.config/nvim/snippets' },
  }
end

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',

    -- v-snip
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',

    -- lspkind
    'onsails/lspkind.nvim', -- vs-code like pictograms

    -- tailwind
    'roobert/tailwindcss-colorizer-cmp.nvim',
  },
  config = config,
}
