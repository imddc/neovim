local status, comment = pcall(require, 'Comment')
if (not status) then
  print('Comment is not work!')
end

comment.setup({})
