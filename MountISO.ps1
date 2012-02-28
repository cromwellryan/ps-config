function is64bit() {
  return ([IntPtr]::Size -eq 8)
}

function get-programfilesdir() {
  if (is64bit -eq $true) {
    (Get-Item "Env:ProgramFiles(x86)").Value
  }
  else {
    (Get-Item "Env:ProgramFiles").Value
  }
}

# Mounts the specified ISO, and returns the Drive letter assigned to it
function MountISO([string] $fileNamePath)
{
	$vcdmountexe = ((get-programfilesdir) + "\Elaborate Bytes\VirtualCloneDrive" + "\vcdmount.exe")

	if( !(test-path $vcdmountexe) ) {
		write-error "Unable to locate vcdmount at " + $vcdmountexe
		return 
	}
	
	write-host "Mounting" $fileNamePath
	
	start-process -FilePath $vcdmountexe -ArgumentList $fileNamePath -wait
	
	# take pause to allow the mounting command to complete
	start-sleep -s 10

	# The newly mounted ISO is the last logical disk in the list.
	$psDrives = Get-WmiObject -Class Win32_LogicalDisk

	# The deviceID property represents the drive letter (i.e. "E:")    
	$psDrives[$psDrives.Count - 1].DeviceID
}

# Unmounts any ISOs still mounted.
function UnmountISO
{
	$vcdmountexe = ((get-programfilesdir) + "\Elaborate Bytes\VirtualCloneDrive" + "\vcdmount.exe")
        
	$vcdmountexe += " /u /h /p"
					
	invoke-expression $vcdmountexe
}    

