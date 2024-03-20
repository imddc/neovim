local cmd_string = function(cmd_arg)
  return [[<cmd>]] .. cmd_arg .. [[<cr>]]
end

local str_to_tbl = function(v)
  if type(v) == 'string' then
    v = { v }
  end
  return v
end

local m = function(lhs, rhs, modes)
  if type(rhs) == 'string' then
    rhs = cmd_string(rhs)
  end
  modes = str_to_tbl(modes) or { 'n' }
  return {
    lhs,
    rhs,
    mode = modes,
  }
end

local modes = { 'n', 't' }

return {
  'akinsho/toggleterm.nvim',
  opts = {},
  event = 'VeryLazy',
  version = '*',
  keys = {
    m('[1', 'ToggleTermSpotify', modes),
    m('[2', 'ToggleTermLazyDocker', modes),
    m('[3', 'ToggleTermLazyGit', modes),
    m('[4', 'ToggleTermFish', modes),
    m('[5', 'ToggleTermWeeChat', modes),
    m('[8', 'ToggleTermRepl', modes),
    m('[0', 'ToggleTermPowershell', modes),
  },
  branch = 'main',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = 130,
        height = 30,
      },
    }
  end,
}
