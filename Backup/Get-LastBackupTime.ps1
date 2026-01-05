<#
.SYNOPSIS
Retrieves last Commvault backup activity.

.DESCRIPTION
Queries Windows Event Logs for recent Commvault
backup activity to verify backup execution.

.AUTHOR
Nduvho Madzivhandila
#>

Get-EventLog -LogName Application |
Where-Object { $_.Source -like "*Commvault*" } |
Sort-Object TimeGenerated -Descending |
Select-Object -First 10 TimeGenerated, EntryType, Message
