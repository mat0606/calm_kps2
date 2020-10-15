Get-Disk -Number 1 | Initialize-Disk -ErrorAction SilentlyContinue
New-Partition -DiskNumber 1 -UseMaximumSize -AssignDriveLetter -ErrorAction SilentlyContinue | Format-Volume -Confirm:$false

# Enable CredSSP
Enable-WSManCredSSP -Role Server -Force
