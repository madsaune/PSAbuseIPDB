function Invoke-AbuseIPDBRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Path,

        [Parameter()]
        [ValidateSet("get", "post", "delete", "put", "patch")]
        [string]
        $Method = "get",

        [Parameter()]
        [hashtable]
        $QueryParams = @{},

        [Parameter()]
        [hashtable]
        $Body = @{},

        [Parameter()]
        [hashtable]
        $Headers = @{}
    )

    begin {
        $requestParams = @{
            Uri     = "{0}{1}" -f ($script:baseURL, $Path)
            Headers = @{
                Key    = $script:apiKey
                Accept = "application/json"
            }
        }

        if ($PSBoundParameters.ContainsKey('Headers')) {
            foreach ($item in $Headers.GetEnumerator()) {
                $requestParams.Headers.Add($item.Key, $item.Value)
            }
        }


        if ($PSBoundParameters.ContainsKey('QueryParams')) {
            $query = @()
            foreach ($item in $QueryParams.GetEnumerator()) {
                $query += "{0}={1}" -f ($item.Key, [System.Web.HttpUtility]::UrlEncode($item.Value))
            }

            $requestParams.Uri += "?{0}" -f ($query -Join "&")
        }

        if ($PSBoundParameters.ContainsKey('Body')) {
            $query = @()
            foreach ($item in $Body.GetEnumerator()) {
                $query += "{0}={1}" -f ($item.Key, [System.Web.HttpUtility]::UrlEncode($item.Value))
            }

            $encodedBody = $query -join "&"
            $requestParams.Add("ContentType", "application/x-www-form-urlencoded")
            $requestParams.Add("Body", $encodedBody)
        }
    }

    process {
        try {
            Write-Verbose "$($requestParams.Method): $($requestParams.Uri)"
            Invoke-RestMethod @requestParams
        } catch {
            $StatusCode = $_.Exception.Response.StatusCode
            $ErrorMessage = $_.ErrorDetails.Message

            Write-Error "$([int]$StatusCode) $($StatusCode) - $($ErrorMessage)"
        }
    }

    end {}
}
