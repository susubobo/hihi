Get-CimInstance Win32_NetworkAdapter | Where-Object { $_.PhysicalAdapter -eq $true } | Format-List Name, Manufacturer, MACAddress, PNPDeviceID
