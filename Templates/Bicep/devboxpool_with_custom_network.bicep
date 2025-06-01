@description('Name of the DevCenter project')
param projectName string

@description('Name of the DevBox pool')
param poolName string = 'CustomNetworkPool'

@description('Location for the DevBox pool')
param location string = resourceGroup().location

@description('Name of the network connection')
param networkConnectionName string

@description('Tags for the DevBox pool resource')
param tags object = {
  environment: 'development'
  purpose: 'devbox-pool'
  createdBy: 'Bicep-Template'
  project: 'DevBox'
  network: 'custom'
}

resource devBoxPool 'Microsoft.DevCenter/projects/pools@2024-02-01' = {  name: '${projectName}/${poolName}'
  location: location
  tags: tags
  properties: {
    networkConnectionName: networkConnectionName
    virtualNetworkType: 'Custom'
  }
}

output poolId string = devBoxPool.id
output poolName string = poolName
output networkConnectionName string = networkConnectionName
