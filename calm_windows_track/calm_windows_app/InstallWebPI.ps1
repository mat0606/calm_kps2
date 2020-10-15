# Install WPI
New-Item c:/msi -Type Directory
Invoke-WebRequest 'http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_amd64_en-US.msi' -OutFile c:/msi/WebPlatformInstaller_amd64_en-US.msi
Start-Process 'c:/msi/WebPlatformInstaller_amd64_en-US.msi' '/qn' -PassThru | Wait-Process

Invoke-WebRequest 'https://download.microsoft.com/download/4/B/1/4B1E9B0E-A4F3-4715-B417-31C82302A70A/ENU/x86/SQLSysClrTypes.msi' -OutFile c:/msi/SQLSysClrTypes.msi-x86.msi
Start-Process 'c:/msi/SQLSysClrTypes.msi-x86.msi' '/qn' -PassThru | Wait-Process
Invoke-WebRequest 'https://download.microsoft.com/download/4/B/1/4B1E9B0E-A4F3-4715-B417-31C82302A70A/ENU/x64/SQLSysClrTypes.msi' -OutFile c:/msi/SQLSysClrTypes.msi-x64.msi
Start-Process 'c:/msi/SQLSysClrTypes.msi-x64.msi' '/qn' -PassThru | Wait-Process
