# Create the installation configuration file
$configFile = "AppPath[@]Default Web Site/bugnet
DbServer[@]@@{MSSQL.address}@@
DbName[@]@@{DbName}@@
DbUsername[@]@@{DbUsername}@@
Database Password[@]@@{DbPassword}@@
DbAdminUsername[@]sa
DbAdminPassword[@]@@{SQL_CRED.secret}@@"

echo $configFile >> BugNET0.app

# Install the application via Web PI
WebpiCmd-x64.exe /Install /UseRemoteDatabase /Application:BugNET@BugNET0.app /AcceptEula
