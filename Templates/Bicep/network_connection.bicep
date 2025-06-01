@description('Name of the DevCenter')
param devCenterName string

@description('Name of the network connection')
param connectionName string = 'aad-vnet-connection'

@description('Name of the virtual network to connect to')
param vnetName string

@description('Name of the subnet to connect to')
param subnetName string

@description('Name of the resource group where VNet is deployed')
param vnetResourceGroup string

@description('Domain join type for DevBoxes')
@allowed(['AzureADJoin', 'HybridAzureADJoin', 'None'])
param domainJoinType string = 'AzureADJoin'

@description('Location for the network connection')
param location string = resourceGroup().location

@description('Tags for the network connection resource')
param tags object = {
  environment: 'development'
  purpose: 'devbox-networking'
  createdBy: 'Bicep-Template'
}

resource networkConnection 'Microsoft.DevCenter/networkConnections@2024-02-01' = {
  name: connectionName
  location: location
  tags: tags
  properties: {
    networkingResourceGroupName: 'MC_${resourceGroup().name}_${connectionName}'
    subnetId: resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
    domainJoinType: domainJoinType
  }
}

resource attachedNetwork 'Microsoft.DevCenter/devcenters/attachednetworks@2024-02-01' = {
  name: '${devCenterName}/${connectionName}'
  properties: {
    networkConnectionId: networkConnection.id
  }
}

output networkConnectionId string = networkConnection.id
output attachedNetworkId string = attachedNetwork.id
