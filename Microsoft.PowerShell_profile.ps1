$scriptRoot = Split-Path (Resolve-Path $myInvocation.MyCommand.Path)

Import-Module Psget
Import-Module PsGist

# TFS Helpers
function GoToProjects() { cd ~/projects }
function TfsStatus() { tf status . /r }
function TfsUpdate() { tf get . /r }
function New-PSWindow { Invoke-item "$pshome\powershell.exe" }

set-alias nw new-pswindow
set-alias gop GoToProjects
set-alias ts TfsStatus
set-alias tu TfsUpdate

# Git helpers
set-content Function:\ga "git add `$args"

set-content Function:\pd "pushd ."

$env:Path += ";" + $env:USERPROFILE + "\AppData\Roaming\npm\node_modules\"

function curlex($url, $filename) {
	$path = [io.path]::gettemppath() + "\" + $filename

	if( test-path $path ) { rm -force $path }

	(new-object net.webclient).DownloadFile($url, $path)

	return new-object io.fileinfo $path
}

function CreateDirectoryAndGo( $name ) {
	$dirinfo = mkdir $name
	cd $name 
}
set-alias mkcd CreateDirectoryAndGo

function start-host() {
	start 'iisexpress' @('/path:' + (pwd).Path)
}

function get-path() { ls ENV: | where {$_.Name -eq "PATH"} | % { $_.Value.Split(';')} }

set-content Function:\mklink "cmd /c mklink `$args"
set-content Function:\v "vim `$args"

# Allow local unsigned scripts, but remote scripts must be signed
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Load posh-git example profile
. (join-path $scriptRoot "/Modules/posh-git/profile.example.ps1")
. (join-path $scriptRoot "/screen.ps1")

# Visual Studio VsVars include (run vsvars32
. (join-path $scriptRoot "/vsvars.ps1")

. (join-path $scriptRoot "/MountISO.ps1")
. (join-path $scriptRoot "/git.ps1")
