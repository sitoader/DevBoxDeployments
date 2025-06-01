@description('Name of the DevCenter project')
param projectName string

@description('Name of the DevBox pool')
param poolName string = 'VS2022Pool'

@description('Location for the DevBox pool')
param location string = resourceGroup().location

@description('Name of the DevBox definition to use')
param devBoxDefinitionName string = 'VS2022WIN11'

@allowed([
  'Enabled'
  'Disabled'
])
@description('Whether local administrator access is enabled')
param localAdministrator string = 'Enabled'

@allowed([
  'Enabled'
  'Disabled'
])
@description('Whether to stop the DevBox when disconnected')
param stopOnDisconnectStatus string = 'Enabled'

@description('Grace period in minutes before stopping the DevBox after disconnection')
param stopOnDisconnectGracePeriodMinutes int = 60

@allowed([
  'Enabled'
  'Disabled'
])
@description('Whether single sign-on is enabled')
param singleSignOnStatus string = 'Enabled'

@description('Regions for managed virtual network')
param managedVirtualNetworkRegions array = [
  'swedencentral'
]

@description('Name of the network connection')
param networkConnectionName string

resource devBoxPool 'Microsoft.DevCenter/projects/pools@2024-02-01' = {
  name: '${projectName}/${poolName}'
  location: location
  properties: {
    devBoxDefinitionName: devBoxDefinitionName
    licenseType: 'Windows_Client'
    localAdministrator: localAdministrator
    networkConnectionName: networkConnectionName
    stopOnDisconnect: {
      status: stopOnDisconnectStatus
      gracePeriodMinutes: stopOnDisconnectGracePeriodMinutes
    }
    singleSignOnStatus: singleSignOnStatus
    displayName: poolName
    virtualNetworkType: 'Managed'
    managedVirtualNetworkRegions: managedVirtualNetworkRegions
  }
}
