Add-AzureRmAccount;

$ResourceGroup = @{
Name = 'mycloudrscgrp';
Location = 'South Central US';
Force = $true;
}

New-AzureRmResourceGroup @ResourceGroup;

Get-AzureRmStorageAccount;

$ResourceGroupName = 'mycloudrscgrp';
$StorageAccountName = 'mycloudtechstorage';
$Type = 'Standard_LRS';
$Location = 'South Central US';

$StorageAccountNameExists = Get-AzureRmStorageAccountNameAvailability -Name $StorageAccountName

If (-Not $StorageAccountNameExists.NameAvailable) {
    Write-Host "Storage account name already taken."
    } 
Else{
    New-AzureRmStorageAccount -ResourceGroupName $ResourceGroupName -Name    
    $StorageAccountName -Type $Type -Location $Location

    $StorageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName  
    -StorageAccountKey $Keys[0].Value;

    New-AzureStorageContainer -Context $StorageContext -Name mct100;
    }
