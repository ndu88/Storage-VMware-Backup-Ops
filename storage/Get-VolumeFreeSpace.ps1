<#
.SYNOPSIS
Reports free space on SAN-backed volumes.

.DESCRIPTION
Retrieves logical disk capacity and free space
to support storage monitoring and capacity planning.

.AUTHOR
Nduvho Madzivhandila
#>

Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
Select-Object DeviceID,
    @{Name="SizeGB";Expression={[math]::Round($_.Size / 1GB,2)}},
    @{Name="FreeSpaceGB";Expression={[math]::Round($_.FreeSpace / 1GB,2)}},
    @{Name="FreePercent";Expression={
        [math]::Round(($_.FreeSpace / $_.Size) * 100,2)
    }} |
Sort-Object FreePercent
