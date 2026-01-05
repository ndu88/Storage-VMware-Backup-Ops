<#
.SYNOPSIS
Reports VMware snapshots older than a defined threshold.

.DESCRIPTION
Identifies snapshots older than 7 days to reduce performance
and backup risks.

.AUTHOR
Nduvho Madzivhandila
#>

$DaysOld = 7

try {
    Get-VM | Get-Snapshot |
    Where-Object { $_.Created -lt (Get-Date).AddDays(-$DaysOld) } |
    Select-Object VM, Name, Created, SizeGB |
    Format-Table -AutoSize
}
catch {
    Write-Error "Failed to retrieve snapshot information."
}
