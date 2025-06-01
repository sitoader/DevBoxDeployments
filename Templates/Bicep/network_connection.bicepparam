using './network_connection.bicep'

param devCenterName = 'myDevCenter'
param connectionName = 'aad-vnet-connection'
param vnetName = 'DevBoxVNet'
param subnetName = 'DevBoxSubnet'
param vnetResourceGroup = 'mydemorg'
param domainJoinType = 'AzureADJoin'
param location = 'swedencentral'
param tags = {
  environment: 'development'
  purpose: 'devbox-networking'
  createdBy: 'Bicep-Template'
  project: 'DevBox'
}

