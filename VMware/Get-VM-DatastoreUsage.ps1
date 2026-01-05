<#
.SYNOPSIS
Reports VMware datastore capacity usage.

.DESCRIPTION
Retrieves datastore capacity and free space information
to support capacity planning and risk identification.

.AUTHOR
Nduvho Madzivhandila
#>

try {
    Get-Datastore |
    Select-Object Name,
        @{Name="CapacityGB";Expression={[math]::Round($_.CapacityGB,2)}},
        @{Name="FreeSpaceGB";Expression={[math]::Round($_.FreeSpaceGB,2)}},
        @{Name="UsedPercent";Expression={
            [math]::Round((($_.CapacityGB - $_.FreeSpaceGB)/$_.CapacityGB)*100,2)
        }} |
    Sort-Object UsedPercent -Descending |
    Format-Table -AutoSize
}
catch {
    Write-Error "Failed to retrieve datastore usage. Ensure VMware PowerCLI is installed and connected."
}
