vsvars32 11

function last { process { $last = $_ } end { $last } }
function installsilently($url) {
  $uri = new-object system.uri $url
  $name = $uri.segments | last 
	vsixinstaller /q (curlex $url $name).FullName
}

@("http://visualstudiogallery.msdn.microsoft.com/f8741f04-bae4-4900-81c7-7c9bfb9ed1fe/file/66979/12/Chutzpah.VS2012.vsix",
  "http://visualstudiogallery.msdn.microsoft.com/b31916b0-c026-4c27-9d6b-ba831093f6b2/file/62080/3/Gister.vsix",
  "http://visualstudiogallery.msdn.microsoft.com/59ca71b3-a4a3-46ca-8fe1-0e90e3f79329/file/6390/41/VsVim.vsix",
  "http://visualstudiogallery.msdn.microsoft.com/6ed4c78f-a23e-49ad-b5fd-369af0c2107f/file/50769/32/WebEssentials.vsix",
  "http://visualstudiogallery.msdn.microsoft.com/a83505c6-77b3-44a6-b53b-73d77cba84c8/file/74740/26/SquaredInfinity.VSCommands.VS11.vsix", 
  "http://visualstudiogallery.msdn.microsoft.com/6ab922d0-21c0-4f06-ab5f-4ecd1fe7175d/file/66177/7/NUnitTestAdapter.vsix") | `
  % { 
    write-host "Installing $_"
    installsilently $_ 
  }

