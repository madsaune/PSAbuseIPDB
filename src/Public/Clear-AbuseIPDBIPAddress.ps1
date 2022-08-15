function Clear-AbuseIPDBIPAddress {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [string]
        $IPAddress
    )

    begin {}

    process {
        Invoke-AbuseIPDBRequest -Path "/clear-address" -Method "delete" -QueryParams @{ipAddress = $IPAddress }
    }

    end {}
}
