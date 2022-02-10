function Submit-AIPDBReport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $IPAddress,

        [Parameter(Mandatory)]
        [ValidateSet(
            "DNSCompromise",
            "DNSPoisoning",
            "FraudOrders",
            "DDoSAttack",
            "FTPBrute-Force",
            "PingOfDeath",
            "Phishing",
            "FraudVoIP",
            "OpenProxy",
            "WebSpam",
            "EmailSpam",
            "BlogSpam",
            "VPNIP",
            "PortScan",
            "Hacking",
            "SQLInjection",
            "Spoofing",
            "Brute-Force",
            "BadWebBot",
            "ExploitedHost",
            "WebAppAttack",
            "SSH",
            "IoTTargeted"
        )]
        [string[]]
        $Category,

        [Parameter()]
        [string]
        $Comment
    )

    begin {
        $categoryMap = @{
            "DNSCompromise"  = 1
            "DNSPoisoning"   = 2
            "FraudOrders"    = 3
            "DDoSAttack"     = 4
            "FTPBrute-Force" = 5
            "PingOfDeath"    = 6
            "Phishing"       = 7
            "FraudVoIP"      = 8
            "OpenProxy"      = 9
            "WebSpam"        = 10
            "EmailSpam"      = 11
            "BlogSpam"       = 12
            "VPNIP"          = 13
            "PortScan"       = 14
            "Hacking"        = 15
            "SQLInjection"   = 16
            "Spoofing"       = 17
            "Brute-Force"    = 18
            "BadWebBot"      = 19
            "ExploitedHost"  = 20
            "WebAppAttack"   = 21
            "SSH"            = 22
            "IoTTargeted"    = 23
        }

        $categories = @()
        foreach ($entry in $Category) {
            $categories += $categoryMap[$entry]
        }
    }

    process {
        $body = @{
            ip         = $IPAddress
            categories = ($categories -join ",")
        }

        if (-not ([string]::IsNullOrEmpty($Comment))) {
            $body.Add("comment", $Comment)
        }

        $result = Invoke-AIPDBRequest -Endpoint "/report" -Body $body -ErrorAction Stop
        return $result
    }

    end {

    }
}
