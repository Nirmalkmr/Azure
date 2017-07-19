$serverName = "myclouddbservercmd"
$location = "South Central US"
$resourceGroupName = "mycloudrscgrp"
$admin = "MyCloudDbAdmin"
$adminPassword = "MyCloud@1234"

$securePassword = ConvertTo-SecureString -String $adminPassword -AsPlainText -Force
$serverCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $admin, $securePassword

$myServer = Get-AzureRmSqlServer -ServerName $serverName -ResourceGroupName $resourceGroupName 
if(!$myServer)
{
   Write-Output "Creating SQL server: $serverName"
   $myServer = New-AzureRmSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName -Location $location -SqlAdministratorCredentials $serverCreds
}
else
{
   Write-Output "SQL server $serverName already exists:"
}
$myServer

$databaseName = "MyCloudDbCmd"

New-AzureRmSqlDatabase -DatabaseName $databaseName -ServerName $serverName -ResourceGroupName $resourceGroupName
