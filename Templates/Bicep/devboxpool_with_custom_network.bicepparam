using './devboxpool_with_custom_network.bicep'

param projectName = 'myProject'
param poolName = 'CustomNetworkPool'
param location = 'swedencentral'
param networkConnectionName = 'aad-vnet-connection'
param tags = {
  environment: 'development'
  purpose: 'devbox-pool'
  createdBy: 'Bicep-Template'
  project: 'DevBox'
  network: 'custom'
}

