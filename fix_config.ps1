$targets = @("G:\EFI\OC\config.plist", "D:\hack\OpCore-Simplify\Results\EFI\OC\config.plist")

foreach ($file in $targets) {
    if (Test-Path $file) {
        $content = Get-Content -Path $file -Raw
        
        # Replace HideAuxiliary <true/> with <false/>
        $content = $content -replace '(<key>HideAuxiliary</key>\s*)<true/>', '$1<false/>'
        
        # Replace SecureBootModel <string>Default</string> with <string>Disabled</string>
        $content = $content -replace '(<key>SecureBootModel</key>\s*)<string>Default</string>', '$1<string>Disabled</string>'
        
        Set-Content -Path $file -Value $content -Encoding UTF8
        Write-Host "Updated $file successfully."
    }
}
