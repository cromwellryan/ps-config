$scriptRoot = Split-Path (Resolve-Path $myInvocation.MyCommand.Path)

Import-Module Psget
Import-Module PsGist
Import-Module PsFiles


##############################
# Team Founation Server (TFS)
##############################
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
set-alias mkcd CreateDirectoryAndGo

function get-path() { $env:Path.Split(';') }

set-content Function:\pd "pushd ."
set-content Function:\mklink "cmd /c mklink `$args"
set-content Function:\v "vim `$args"

# Allow local unsigned scripts, but remote scripts must be signed
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

##############################
# Git
##############################
. (join-path $scriptRoot "/git.ps1")
set-content Function:\ga "git add `$args"

# Load posh-git example profile
. (join-path $scriptRoot "/Modules/posh-git/profile.example.ps1")
. (join-path $scriptRoot "/screen.ps1")


##############################
# Node
##############################

# Put globally installed npm packages in PATH
$env:Path += ";" + $env:USERPROFILE + "\AppData\Roaming\npm\node_modules\"

function start-host() {
	start 'iisexpress' @('/path:' + (pwd).Path)
}

. (join-path $scriptRoot "/MountISO.ps1")
