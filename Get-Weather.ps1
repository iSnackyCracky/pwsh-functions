<#
.SYNOPSIS
    Get the weather forecast.
.DESCRIPTION
    Uses wttr.in to retrieve the current weather forecast for your IP's or specified location.

.PARAMETER IPv6
    Retrieve the public IPv6 Address.
    Forces the usage of IPv6 (ipify API endpoint: api6.ipify.org).
.EXAMPLE
    Get-Weather

.EXAMPLE
    Get-Weather -Location Berlin

.INPUTS
    None. You cannot pipe objects to Get-Weather.
.LINK
    Website: https://v2.wttr.in/
    GitHub: https://github.com/chubin/wttr.in/
#>


function Get-Weather {
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1',
                   PositionalBinding=$false,
                   ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param (
        [Parameter(Position=0)]
        [Alias("City")] 
        [String]
        $Location
    )
    
    begin {
        $apiUri = "https://v2.wttr.in"
        if ($Location) {
            $apiUri += "/$Location"
        }
    }
    
    process {
        Invoke-RestMethod -Method Get -Uri $apiUri
    }
            
    end {
    }
}