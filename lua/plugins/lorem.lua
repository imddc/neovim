return {
  'derektata/lorem.nvim',
  config = function()
    require('lorem').setup {
      sentenceLength = 'mixedShort',
      comma = 0.1,
    }
  end,
}
