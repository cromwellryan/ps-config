
function Test-Any { 
    begin { $result = $false }
      process { $result = $true }
        end { $result }
}
set-alias any Test-Any

