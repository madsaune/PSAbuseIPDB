---
external help file: PSAbuseIPDB-help.xml
Module Name: PSAbuseIPDB
online version:
schema: 2.0.0
---

# Get-AbuseIPDBIPAddress

## SYNOPSIS
The check endpoint accepts a single IP address (v4 or v6).

## SYNTAX

```
Get-AbuseIPDBIPAddress [-IPAddress] <String> [[-MaxAgeInDays] <Int32>] [-UseVerbose] [<CommonParameters>]
```

## DESCRIPTION
The check endpoint accepts a single IP address (v4 or v6).

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -IPAddress
The IP address should be url-encoded, because IPv6 addresses use colons, which are reserved characters in URIs.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxAgeInDays
You may set the maxAgeInDays parameter to only return reports within the last x amount of days.
Default 30.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseVerbose
The verbose flag will include reports and the country name field.
If you want to keep your response payloads light, omit this.
The reports array is limited to 10,000 elements.
Only reports within the timeframe of maxAgeInDays are considered.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Official documentation: https://docs.abuseipdb.com/#check-endpoint

## RELATED LINKS
