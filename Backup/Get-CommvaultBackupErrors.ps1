<#
.SYNOPSIS
Detects Commvault backup errors.

.DESCRIPTION
Identifies warning and error events related
to Commvault backups for audit and troubleshooting.

.AUTHOR
Nduvho Madzivhandila
#>

Get-EventLog -LogName Application |
Where-Object {
    $_.Source -like "*Commvault*" -and
    $_.EntryType -in @("Error","Warning")
} |
Select-Object TimeGenerated, EntryType, Message
