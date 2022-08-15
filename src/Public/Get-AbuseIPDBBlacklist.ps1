<#
.SYNOPSIS

The blacklist is the culmination of all of the valiant reporting by AbuseIPDB users. It's a list of the most reported IP addresses.

.DESCRIPTION

The blacklist is the culmination of all of the valiant reporting by AbuseIPDB users. It's a list of the most reported IP addresses.

.PARAMETER ConfidenceMinimum
Minimum confidence level.

.PARAMETER Limit
The number of IP addresses included in the list is capped to a hard limit, depending on your subscription.

Standard: 10,000
Basic Subscription: 100,000
Premium Subscription: 500,000

If you set the limit to a value higher than your subscription allows for, the list will simply be truncated to your subscription's hard limit.

.PARAMETER PlainText
If you prefer a simple newline-separated plaintext response.

.PARAMETER OnlyCountries
A comma seperated list of ISO 3166 alpha-2 codes. Retrieves IPs that only originate in the given country or countries.

.PARAMETER ExceptCountries
A comma seperated list of ISO 3166 alpha-2 codes. Retrieves all IPs except those that originate in the given country or countries.

.NOTES
Official documentation: https://docs.abuseipdb.com/#blacklist-endpoint

#>
function Get-AIPDBBlacklist {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateRange(25, 100)]
        [int]
        $ConfidenceMinimum,

        [Parameter()]
        [int]
        $Limit,

        [Parameter()]
        [switch]
        $PlainText,

        [Parameter()]
        [string[]]
        $OnlyCountries,

        [Parameter()]
        [string[]]
        $ExceptCountries
    )

    begin {
        $queryParams = @{}

        if ($null -ne $ConfidenceMinimum) {
            $queryParams.Add("confidenceMinimum", $ConfidenceMinimum)
        }

        if ($null -ne $Limit) {
            $queryParams.Add("limit", $Limit)
        }

        if ($PlainText.IsPresent) {
            $queryParams.Add("plaintext", "")
        }

        if ($null -ne $OnlyCountries) {
            $queryParams.Add("onlyCountries", $OnlyCountries -Join ",")
        }

        if ($null -ne $ExceptCountries) {
            $queryParams.Add("exceptCountries", $ExceptCountries -Join ",")
        }
    }

    process {
        $result = Invoke-AIPDBRequest -Endpoint "/blacklist" -QueryParams $queryParams -ErrorAction Stop
        return $result
    }

    end {}
}
