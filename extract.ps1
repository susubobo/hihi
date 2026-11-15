Expand-Archive -Path 'd:\hack\OpCore-Simplify.zip' -DestinationPath 'd:\hack' -Force
# Rename extracted folder
$extracted = Get-ChildItem -Path 'd:\hack' -Directory | Where-Object { $_.Name -like 'OpCore-Simplify*' } | Select-Object -First 1
if ($extracted) {
    $targetPath = 'd:\hack\OpCore-Simplify'
    if (Test-Path $targetPath) { Remove-Item $targetPath -Recurse -Force }
    Rename-Item $extracted.FullName $targetPath
    Write-Host "Extracted to: $targetPath"
}
# List files
Get-ChildItem -Path 'd:\hack\OpCore-Simplify' -Recurse -Depth 2 | Select-Object FullName
