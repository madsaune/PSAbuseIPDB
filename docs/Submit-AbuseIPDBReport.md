---
external help file: PSAbuseIPDB-help.xml
Module Name: PSAbuseIPDB
online version:
schema: 2.0.0
---

# Submit-AbuseIPDBReport

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
Submit-AbuseIPDBReport [-IPAddress] <String> [-Category] <String[]> [[-Comment] <String>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Category
{{ Fill Category Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: DNSCompromise, DNSPoisoning, FraudOrders, DDoSAttack, FTPBrute-Force, PingOfDeath, Phishing, FraudVoIP, OpenProxy, WebSpam, EmailSpam, BlogSpam, VPNIP, PortScan, Hacking, SQLInjection, Spoofing, Brute-Force, BadWebBot, ExploitedHost, WebAppAttack, SSH, IoTTargeted

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Comment
{{ Fill Comment Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPAddress
{{ Fill IPAddress Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
