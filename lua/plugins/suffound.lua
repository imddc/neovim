local status, surround = pcall(require, 'nvim-surround')
if (not status) then
  print(
    'suffound is not working!'
  )
  return
end

-- cs 修改 ds 删除
-- 作用于成对出现的括号
surround.setup({})
