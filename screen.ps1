function isinmiddlesomewhere($rui) {
	$x = $rui.WindowPosition.X
	$y = $rui.WindowPosition.Y - $rui.WindowSize.Width

	# Y is all kinds of f'ed up

	($x -ne 0)
}
function fullscreen() {
	$rui = (get-host).UI.RawUI

	if ((isinmiddlesomewhere $rui)) { 
		"Maximize the window first.  (Win+UpArrow)" | out-host
	}
	else {
		$rui.BufferSize = $rui.MaxPhysicalWindowSize
		$rui.WindowSize = $rui.MaxPhysicalWindowSize
	}
}


