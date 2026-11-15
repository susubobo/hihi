# Clean and setup USB installer
$diskNum = 4

# Safety check
$disk = Get-Disk -Number $diskNum
if ($disk.FriendlyName -notlike "*SD Card Reader*" -and $disk.BusType -ne "USB") {
    Write-Error "Safety check failed! Disk $diskNum is not the USB SD Card Reader."
    exit 1
}

Write-Host "Cleaning Disk $diskNum ($($disk.FriendlyName))..."
Clear-Disk -Number $diskNum -RemoveData -RemoveOEM -Confirm:$false

Write-Host "Initializing Disk $diskNum as GPT..."
Initialize-Disk -Number $diskNum -PartitionStyle GPT

Write-Host "Creating 16GB FAT32 partition for OpenCore..."
$bootPart = New-Partition -DiskNumber $diskNum -Size 16GB -AssignDriveLetter
Format-Volume -Partition $bootPart -FileSystem FAT32 -NewFileSystemLabel "OPENCORE" -Confirm:$false

Write-Host "Creating remaining partition as exFAT for storage..."
$dataPart = New-Partition -DiskNumber $diskNum -UseMaximumSize -AssignDriveLetter
Format-Volume -Partition $dataPart -FileSystem exFAT -NewFileSystemLabel "DATA" -Confirm:$false

Write-Host "Done partitioning!"
Get-Partition -DiskNumber $diskNum | Format-Table DiskNumber, PartitionNumber, DriveLetter, Size, Type
