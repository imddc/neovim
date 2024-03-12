local status, indent = pcall(require, 'mini.indentscope')
if (not status) then
  print('indentscope is not working!')
end

indent.setup()
