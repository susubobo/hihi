$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if ($gitCmd) {
    Write-Host "Git found at: $($gitCmd.Source)"
} else {
    Write-Host "Git not in PATH. Searching..."
    $found = $false
    $searchPaths = @(
        "C:\Program Files\Git\bin\git.exe",
        "C:\Program Files (x86)\Git\bin\git.exe",
        "C:\Program Files\Git\cmd\git.exe"
    )
    foreach ($p in $searchPaths) {
        if (Test-Path $p) {
            Write-Host "Found git at: $p"
            $found = $true
            break
        }
    }
    if (-not $found) {
        Write-Host "Searching C:\ for git.exe (depth 4)..."
        Get-ChildItem -Path C:\ -Filter git.exe -Recurse -ErrorAction SilentlyContinue -Depth 4 | Select-Object -First 3 FullName
    }
}
