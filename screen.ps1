function isinmiddlesomewhere($rui) {
	(($rui.WindowPosition.X -ne 0) -or ($rui.WindowPosition.Y -ne 0))
}
function fullscreen() {
	$rui = (get-host).UI.RawUI

	$is = 

	if ((isinmiddlesomewhere $rui)) { 
		"Maximize the window first.  (Win+UpArrow)" | out-host
	}
	else {
		$rui.BufferSize = $rui.MaxPhysicalWindowSize
		$rui.WindowSize = $rui.MaxPhysicalWindowSize
	}
}


