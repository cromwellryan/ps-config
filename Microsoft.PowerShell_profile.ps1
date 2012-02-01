# Load posh-git example profile
. C:\tools\poshgit\dahlbyk-posh-git-60e1ed7\profile.example.ps1
. ~/Documents/WindowsPowerShell/ssh-agent-utils.ps1
. ~/Documents/WindowsPowerShell/screen.ps1

$env:path += ";C:\program files (x86)\Microsoft Visual Studio 10.0\Common7\IDE"

function GoToProjects() { cd ~/projects }
function TfsStatus() { tf status . /r }
function TfsUpdate() { tf get . /r }
function New-PSWindow { Invoke-item "$pshome\powershell.exe" }

set-alias nw new-pswindow
set-alias gop GoToProjects
set-alias ts TfsStatus
set-alias tu TfsUpdate

function cpgitignore() { cp ~/BucketOStuff/.gitignore ./ }
set-alias cpg cpgitignore

function curl($url) {
	return (new-object net.webclient).DownloadString($url)
}

function curlex($url, $filename) {
	$path = [io.path]::gettemppath() + "\" + $filename

	if( test-path $path ) { rm -force $path }

	(new-object net.webclient).DownloadFile($url, $path)

	return new-object io.fileinfo $path
}

function mkcd( $name ) {
	$dirinfo = mkdir $name
	cd $name 
}

function get-path() { ls ENV: | where {$_.Name -eq "PATH"} | % { $_.Value.Split(';')} }

set-content Function:\mklink "cmd /c mklink `$args"


$host.UI.RawUI.ForegroundColor="White"
$host.UI.RawUI.BackgroundColor="Black"
