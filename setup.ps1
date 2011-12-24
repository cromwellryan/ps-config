cmd /c mklink . %HOMEPATH%\Documents\WindowsPowerShell

vsixinstaller /q (curlex http://visualstudiogallery.msdn.microsoft.com/b31916b0-c026-4c27-9d6b-ba831093f6b2/file/62080/1/Gister.vsix gister.vsix).FullName
vsixinstaller /q (curlex http://visualstudiogallery.msdn.microsoft.com/27077b70-9dad-4c64-adcf-c7cf6bc9970c/file/37502/19/NuGet.Tools.vsix nuget.tools.vsix).FullName
vsixinstaller /q (curlex http://visualstudiogallery.msdn.microsoft.com/d0d33361-18e2-46c0-8ff2-4adea1e34fef/file/29666/12/ProPowerTools.vsix ProPowerTools.vsix).FullName
