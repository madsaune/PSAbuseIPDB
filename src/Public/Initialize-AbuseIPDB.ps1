function Initialize-AIPDB {
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
