$script:apiKey = ""
$script:baseURL = "https://api.abuseipdb.com/api/v2"

$privateFunctions = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )
$publicFunctions = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )

# Dot source the functions
foreach ($file in @($publicFunctions + $privateFunctions)) {
    try {
        . $file.FullName
    } catch {
        Write-Error "Failed to import function $($file.BaseName)"
    }
}
