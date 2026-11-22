Create a new virtual machine in Azure using PowerShell with the specified resource group name ($RGName) and virtual machine name ($VMName).
To create a new virtual machine in Azure using PowerShell with the specified resource group name ($RGName) and virtual machine name ($VMName), you can use the following script:
```powershell
# Define variables  
$RGName = Read-Host "Enter the Resource Group Name"
$VMName = Read-Host "Enter the Virtual Machine Name"
$vmConfig
# Create a new resource group if it doesn't exist

if (-not (Get-AzResourceGroup -Name $RGName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $RGName -Location "East US"
}
# Define the virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $VMName -VMSize "Standard_DS1_v2" | `
    Set-AzVMOperatingSystem -Windows -ComputerName $VMName -Credential (Get-Credential) | `
    Set-AzVMSourceImage -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest" | `
    Add-AzVMNetworkInterface -Id (New-AzNetworkInterface -ResourceGroupName $RGName -Name "$VMName-NIC" -Location "East US" -SubnetId (New-AzVirtualNetworkSubnetConfig -Name "default" -AddressPrefix "10.0.0.0/24") )