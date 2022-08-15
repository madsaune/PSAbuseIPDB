function Initialize-AbuseIPDB {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ApiKey
    )

    begin {}

    process {
        $script:apiKey = $ApiKey
    }

    end {}
}
