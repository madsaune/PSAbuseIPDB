<#
.SYNOPSIS

The check endpoint accepts a single IP address (v4 or v6).

.DESCRIPTION

The check endpoint accepts a single IP address (v4 or v6).

.PARAMETER IPAddress
The IP address should be url-encoded, because IPv6 addresses use colons, which are reserved characters in URIs.

.PARAMETER MaxAgeInDays
You may set the maxAgeInDays parameter to only return reports within the last x amount of days. Default 30.

.PARAMETER UseVerbose
The verbose flag will include reports and the country name field. If you want to keep your response payloads light, omit this.
The reports array is limited to 10,000 elements. Only reports within the timeframe of maxAgeInDays are considered.

.NOTES
Official documentation: https://docs.abuseipdb.com/#check-endpoint

#>
function Get-AIPDBIPAddress {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $IPAddress,

        [Parameter()]
        [ValidateRange(1, 365)]
        [int]
        $MaxAgeInDays = 30,

        [Parameter()]
        [switch]
        $UseVerbose
    )

    begin {}

    process {
        $queryParams = @{
            ipAddress    = $IPAddress
            maxAgeInDays = $MaxAgeInDays
        }

        if ($UseVerbose.IsPresent) {
            $queryParams.Add("verbose", "true")
        }

        $result = Invoke-AIPDBRequest -Endpoint "/check" -QueryParams $queryParams -ErrorAction Stop

        return $result
    }

    end {}
}
