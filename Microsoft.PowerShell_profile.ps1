# Load posh-git example profile
. C:\tools\poshgit\dahlbyk-posh-git-60e1ed7\profile.example.ps1
. ~/Documents/WindowsPowerShell/ssh-agent-utils.ps1

$env:path += ";C:\program files (x86)\Microsoft Visual Studio 10.0\Common7\IDE"

function GoToProjects() { cd ~/projects }
function TfsStatus() { tf status . /r }
function TfsUpdate() { tf get . /r }


set-alias gop GoToProjects
set-alias ts TfsStatus
set-alias tu TfsUpdate

function cpgitignore() { cp ~/BucketOStuff/.gitignore ./ }
set-alias cpg cpgitignore

function curl($url) {
	return (new-object net.webclient).DownloadString($url)
}

function get-path() { ls ENV: | where {$_.Name -eq "PATH"} | % { $_.Value.Split(';')} }
