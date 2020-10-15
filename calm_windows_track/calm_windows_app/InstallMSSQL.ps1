$DriveLetter = $(Get-Partition -DiskNumber 1 -PartitionNumber 2 | select DriveLetter -ExpandProperty DriveLetter)
$edition = "Standard"
$HOSTNAME=$(hostname)
$PackageName = "MsSqlServer2014Standard"
$Prerequisites = "Net-Framework-Core"
$silentArgs = "/IACCEPTSQLSERVERLICENSETERMS /Q /ACTION=install /FEATURES=SQLENGINE,SSMS,ADV_SSMS,CONN,IS,BC,SDK,BOL /SECURITYMODE=sql /SAPWD=`"@@{SQL_CRED.secret}@@`" /ASSYSADMINACCOUNTS=`"@@{SQL_CRED.username}@@`" /SQLSYSADMINACCOUNTS=`"@@{SQL_CRED.username}@@`" /INSTANCEID=MSSQLSERVER /INSTANCENAME=MSSQLSERVER /UPDATEENABLED=False /INDICATEPROGRESS /TCPENABLED=1 /INSTALLSQLDATADIR=`"${DriveLetter}:\Microsoft SQL Server`""
$setupDriveLetter = "D:"
$setupPath = "$setupDriveLetter\setup.exe"
$validExitCodes = @(0)

if ($Prerequisites){
Install-WindowsFeature -IncludeAllSubFeature -ErrorAction Stop $Prerequisites
}

Write-Output "Installing $PackageName...."

$install = Start-Process -FilePath $setupPath -ArgumentList $silentArgs -Wait -NoNewWindow -PassThru
$install.WaitForExit()

$exitCode = $install.ExitCode
$install.Dispose()

Write-Output "Command [`"$setupPath`" $silentArgs] exited with `'$exitCode`'."
if ($validExitCodes -notcontains $exitCode) {
Write-Output "Running [`"$setupPath`" $silentArgs] was not successful. Exit code was '$exitCode'. See log for possible error messages."
exit 1
}
