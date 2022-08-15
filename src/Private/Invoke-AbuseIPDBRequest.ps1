function Invoke-AIPDBRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Endpoint,

        [Parameter()]
        [ValidateSet("GET", "POST", "DELETE", "PUT", "PATCH")]
        [string]
        $Method = "GET",

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
        $url = "{0}{1}" -f ($script:baseURL, $Endpoint)
        $Headers.Add("Key", $script:apiKey)
        $Headers.Add("Accept", "application/json")
    }

    process {
        $params = @{
            Uri     = $url
            Method  = $Method
            Headers = $Headers
        }

        if ($QueryParams.Count -gt 0) {
            $query = @()
            foreach ($item in $QueryParams.GetEnumerator()) {
                $query += "{0}={1}" -f ($item.Key, [System.Web.HttpUtility]::UrlEncode($item.Value))
            }

            $params.Uri += "?{0}" -f ($query -Join "&")
        }

        if ($Body.Count -gt 0) {
            $query = @()
            foreach ($item in $QueryParams.GetEnumerator()) {
                $query += "{0}={1}" -f ($item.Key, [System.Web.HttpUtility]::UrlEncode($item.Value))
            }

            $body = $query -join "&"
            $params.ContentType = "application/x-www-form-urlencoded"
            $params.Body = $body
        }

        try {
            Write-Verbose "$($Method) $($params.Uri)"
            $result = Invoke-RestMethod @params
            return $result.data
        } catch {
            $StatusCode = $_.Exception.Response.StatusCode
            $ErrorMessage = $_.ErrorDetails.Message

            Write-Error "$([int]$StatusCode) $($StatusCode) - $($ErrorMessage)"
        }
    }

    end {}
}
