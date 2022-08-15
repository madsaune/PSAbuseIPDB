function Get-AbuseIPDBIPBlock {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [string]
        $Network,

        # Parameter help description
        [Parameter()]
        [ValidateRange(1, 365)]
        [int]
        $MaxAgeInDays = 30
    )

    begin {}

    process {
        $requestParams = @{
            Path        = "/check-block"
            QueryParams = @{ network = $Network }
            Body        = @{ maxAgeInDays = $MaxAgeInDays }
        }

        Invoke-AbuseIPDBRequest @requestParams
    }

    end {}
}
