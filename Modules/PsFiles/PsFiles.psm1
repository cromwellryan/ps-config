##############################################################################
##
## Get-FileEncoding
##
## From Windows PowerShell Cookbook (O'Reilly)
## by Lee Holmes (http://www.leeholmes.com/guide)
##
##############################################################################

function Get-FileEncoding {
<#
.SYNOPSIS
Gets the encoding of a file

.EXAMPLE
Get-FileEncoding .\UnicodeScript.ps1

BodyName          : unicodeFFFE
EncodingName      : Unicode (Big-Endian)
HeaderName        : unicodeFFFE
WebName           : unicodeFFFE
WindowsCodePage   : 1200
IsBrowserDisplay  : False
IsBrowserSave     : False
IsMailNewsDisplay : False
IsMailNewsSave    : False
IsSingleByte      : False
EncoderFallback   : System.Text.EncoderReplacementFallback
DecoderFallback   : System.Text.DecoderReplacementFallback
IsReadOnly        : True
CodePage          : 1201

#>

  param(
    [Parameter(Position=0, ValueFromPipeline=$true)]
    [PSObject]$InputObject = $null,
    [string]$FilePath = $null
  )
  PROCESS {
# We need to determine if this thing is coming from a pipeline (ie ls | Get-FileEncoding) or invoked with -FilePath
		if( $InputObject -ne $null ) {
			if( $InputObject.GetType() -eq [System.IO.FileInfo] ) {
				$fileinfo = [System.IO.FileInfo]$InputObject
			} 
			else { # Ignore Directories
				return 
			}
		}
		elseif( $FilePath -ne $null -and (Test-Path $FilePath) ){
			$fileinfo = Get-Item $FilePath
		}
		else {
			return
		}

    $path = $fileinfo.FullName

    Set-StrictMode -Version Latest

## The hashtable used to store our mapping of encoding bytes to their
## name. For example, "255-254 = Unicode"
    $encodings = @{}

## Find all of the encodings understood by the .NET Framework. For each,
## determine the bytes at the start of the file (the preamble) that the .NET
## Framework uses to identify that encoding.
    $encodingMembers = [System.Text.Encoding] |
        Get-Member -Static -MemberType Property

        $encodingMembers | Foreach-Object {
              $encodingBytes = [System.Text.Encoding]::($_.Name).GetPreamble() -join '-'
                  $encodings[$encodingBytes] = $_.Name
        }

## Find out the lengths of all of the preambles.
    $encodingLengths = $encodings.Keys | Where-Object { $_ } |
        Foreach-Object { ($_ -split "-").Count }

## Assume the encoding is UTF7 by default
    $result = "UTF7"

## Go through each of the possible preamble lengths, read that many
## bytes from the file, and then see if it matches one of the encodings
## we know about.
    foreach($encodingLength in $encodingLengths | Sort -Descending)
    {
          $bytes = (Get-Content -encoding byte -readcount $encodingLength $path)[0]
              $encoding = $encodings[$bytes -join '-']

                  ## If we found an encoding that had the same preamble bytes,
                      ## save that output and break.
                          if($encoding)
                                {
                                          $result = $encoding
                                                  break
                                                      }
    }

## Finally, output the encoding.
    New-Object PSObject -Property @{
      File = $fileinfo
      Encoding = [System.Text.Encoding]::$result
    }
  }
}

new-alias encoding Get-FileEncoding

export-modulemember -alias * -function Get-FileEncoding
