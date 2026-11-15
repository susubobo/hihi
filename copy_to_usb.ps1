$srcEFI = "D:\hack\OpCore-Simplify\Results\EFI"
$srcRecovery = "D:\hack\com.apple.recovery.boot"
$targetDrive = "G:\"

Write-Host "Copying EFI folder to $targetDrive..."
Copy-Item -Path $srcEFI -Destination $targetDrive -Recurse -Force

Write-Host "Copying com.apple.recovery.boot to $targetDrive..."
Copy-Item -Path $srcRecovery -Destination $targetDrive -Recurse -Force

Write-Host "`n=== Contents of $targetDrive ==="
Get-ChildItem -Path $targetDrive -Recurse -Depth 2 | Format-Table FullName, Length
