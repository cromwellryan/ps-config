vsvars32

function installsilently($url, $name) {
	vsixinstaller /q (curlex $url $name).FullName
}

installsilently http://visualstudiogallery.msdn.microsoft.com/b31916b0-c026-4c27-9d6b-ba831093f6b2/file/62080/1/Gister.vsix gister.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/27077b70-9dad-4c64-adcf-c7cf6bc9970c/file/37502/19/NuGet.Tools.vsix nuget.tools.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/d0d33361-18e2-46c0-8ff2-4adea1e34fef/file/29666/12/ProPowerTools.vsix ProPowerTools.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/59ca71b3-a4a3-46ca-8fe1-0e90e3f79329/file/6390/26/VsVim.vsix VsVim.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/2b96d16a-c986-4501-8f97-8008f9db141a/file/53962/24/Mindscape.WebWorkbench.Integration.10.vsix Mindscape.WebWorkbench.Integration.10.vsix 
installsilently http://visualstudiogallery.msdn.microsoft.com/6ed4c78f-a23e-49ad-b5fd-369af0c2107f/file/50769/31/WebEssentials.vsix WebEssentials.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/fa85b17d-3df2-49b1-bee6-71527ffef441/file/49766/1/PerfWatsonExtension-Signed.vsix PerfWatson.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/961e6734-cd3a-4afb-a121-4541742b912e/file/36823/21/JSLint.VS2010.vsix JSLint.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/35daa606-4917-43c4-98ab-38632d9dbd45/file/48456/6/Inmeta.VisualStudio.TeamExplorer.BuildFolders.Extension.vsix Inmeta.BuildFolders.vsix
installsilently http://visualstudiogallery.msdn.microsoft.com/bce6cbf1-fb55-4a7d-b39b-8589634d846f/file/72361/3/VersionInfo.vsix VersionInfo.vsix
