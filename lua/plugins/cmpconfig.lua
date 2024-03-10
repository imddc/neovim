local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    -- Use <C-b/f> to scroll the docs
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- Use <C-k/j> to switch in items
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behaviior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- For nvim-lsp
    { name = 'buffer' },   -- For buffer word completion
    { name = 'luasnip' },  -- For luasnip user
    { name = 'path' },     -- For path completion
  }),
  formatting = {
    format = lspkind.cmp_format({ wirth_text = false, maxwidth = 50 })
  },
})

vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
