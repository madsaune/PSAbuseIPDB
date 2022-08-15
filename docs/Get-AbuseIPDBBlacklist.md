---
external help file: PSAbuseIPDB-help.xml
Module Name: PSAbuseIPDB
online version:
schema: 2.0.0
---

# Get-AbuseIPDBBlacklist

## SYNOPSIS
The blacklist is the culmination of all of the valiant reporting by AbuseIPDB users.
It's a list of the most reported IP addresses.

## SYNTAX

```
Get-AbuseIPDBBlacklist [[-ConfidenceMinimum] <Int32>] [[-Limit] <Int32>] [-PlainText]
 [[-OnlyCountries] <String[]>] [[-ExceptCountries] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
The blacklist is the culmination of all of the valiant reporting by AbuseIPDB users.
It's a list of the most reported IP addresses.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ConfidenceMinimum
Minimum confidence level.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExceptCountries
A comma seperated list of ISO 3166 alpha-2 codes.
Retrieves all IPs except those that originate in the given country or countries.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
The number of IP addresses included in the list is capped to a hard limit, depending on your subscription.

Standard: 10,000
Basic Subscription: 100,000
Premium Subscription: 500,000

If you set the limit to a value higher than your subscription allows for, the list will simply be truncated to your subscription's hard limit.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -OnlyCountries
A comma seperated list of ISO 3166 alpha-2 codes.
Retrieves IPs that only originate in the given country or countries.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PlainText
If you prefer a simple newline-separated plaintext response.

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
Official documentation: https://docs.abuseipdb.com/#blacklist-endpoint

## RELATED LINKS
