function Get-Batchfile ($file) {
    $cmd = "`"$file`" & set"
    cmd /c "$cmd" | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}
  
function VsVars32([int]$version = 10)
{
    $versionkey = $version.ToString("00.0")

    $batfilename = "vsvars32.bat" 

    if($version -eq 11) {
      $batfilename = "vsdevcmd.bat"
    }



    $key = "HKLM:SOFTWARE\Microsoft\VisualStudio\" + $versionkey
    $VsKey = get-ItemProperty $key
    $VsInstallPath = [System.IO.Path]::GetDirectoryName($VsKey.InstallDir)
    $VsToolsDir = [System.IO.Path]::GetDirectoryName($VsInstallPath)
    $VsToolsDir = [System.IO.Path]::Combine($VsToolsDir, "Tools")
    $BatchPath = join-path $VsToolsDir $batfilename
    Get-Batchfile $BatchPath
    [System.Console]::Title = "Visual Studio " + $versionkey + " Windows Powershell"
}
