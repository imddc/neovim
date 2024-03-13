local status, dashboard = pcall(require, 'dashboard')
if (not status) then
  print('dashboard is not working!')
  return
end

dashboard.setup({})
