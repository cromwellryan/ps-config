function Select-First() {
  begin { $result = $null }
  process { 
    if( $result -eq $null ) {
      $result = $_ 
    }
  }
  end { return $result }
}
set-alias first Select-First

function Test-Any { 
  begin { $result = $false }
  process { $result = $true }
  end { $result }
}
set-alias any Test-Any

