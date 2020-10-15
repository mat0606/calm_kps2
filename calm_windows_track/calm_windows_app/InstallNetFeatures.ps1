# Enable Repair via Windows Update
$servicing = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Servicing"
New-Item -Path $servicing -Force
Set-ItemProperty -Path $servicing -Name RepairContentServerSource -Value 2

# Install Features
Install-WindowsFeature -Name NET-Framework-Core
Install-WindowsFeature -Name NET-WCF-Services45 -IncludeAllSubFeature
