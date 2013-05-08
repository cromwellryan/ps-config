$scriptRoot = Split-Path (Resolve-Path $myInvocation.MyCommand.Path)

Import-Module PsGist
Import-Module PsFiles

. (join-path $scriptRoot "/utils.ps1")

##############################
# Tools
##############################
$env:Path += ";$($env:userprofile)\DropBox\Tools\Vim"

##############################
# Team Founation Server (TFS)
##############################
$env:Path += ";" + "C:\git-tf\git-tf-1.0.1.20120827"
function GoToProjects() { cd ~/projects }
set-alias gop GoToProjects

set-content Function:\ts "tf status . /r"
set-content Function:\tu "tf get . /r"

# Visual Studio VsVars include (run vsvars32
. (join-path $scriptRoot "/vsvars.ps1")

##############################
# Powershell
##############################
function New-PSWindow { Invoke-item "$pshome\powershell.exe" }
set-alias nw new-pswindow

function CreateDirectoryAndGo( $name ) {
	$dirinfo = mkdir $name
	cd $name 
}
set-alias mcd CreateDirectoryAndGo

function get-path() { $env:Path.Split(';') }

set-content Function:\pd "pushd ."
set-content Function:\mklink "cmd /c mklink `$args"
set-content Function:\v "vim `$args"
set-content Function:\rmf "rm `$args -force -recurse"

# Allow local unsigned scripts, but remote scripts must be signed
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force


function curlex($url, $filename) {
  $path = [io.path]::gettemppath() + "\" + $filename

  if( test-path $path ) { rm -force $path }

  (new-object net.webclient).DownloadFile($url, $path)

  return new-object io.fileinfo $path
}

$a = (Get-Host).UI.RawUI
$a.ForegroundColor = "White"

##############################
# Git
##############################
. (join-path $scriptRoot "/git.ps1")
set-content Function:\ga "git add -p . `$args"
set-content Function:\gf "git fetch `$args"
set-content Function:\gh "git hist"
set-content Function:\gb "git co -b `$args"

# Load posh-git profile
. (join-path $scriptRoot "/posh-git-profile.ps1")
. (join-path $scriptRoot "/screen.ps1")


##############################
# Node
##############################

# Put globally installed npm packages in PATH
$env:Path += ";" + $env:USERPROFILE + "\AppData\Roaming\npm\node_modules\"

##############################
# Servers 
##############################

function start-host() {
  $iisexpress = "$env:ProgramFiles\IIS Express\iisexpress.exe"
  if (!(test-path $iisexpress)) {
    write-error "Unable to local IIS Express at $iisexpress"
    return 
  }

	start $iisexpress @("/path:$((pwd).Path)")
}

function servepy() {
  start 'python' @('-m', 'http.server')
}

. (join-path $scriptRoot "/MountISO.ps1")
. (join-path $scriptRoot "/account.ps1")
