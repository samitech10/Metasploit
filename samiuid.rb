# Finding the  Current User
print_status("getting the current user id")
currentuid = session.sys.config.getuid
print_good("current process id is #{currentuid}")
#Checking if UAC is enabled
uac_check = is_uac_enabled?
if(uac_check)
print_error("UAC is enabled")
uac_level = get_uac_level
if(uac_level = 5)
print_status("UAC level is #{uac_level.to_s} which is Default")
elsif (uac_level = 2)
print_status("UAC level is #{uac_level.to_s} which is always notify")
else
print_error("some error occured")
end
else
print_good("UAC IS disabled")
end


