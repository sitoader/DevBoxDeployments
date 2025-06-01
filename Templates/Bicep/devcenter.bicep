@description('Name of the Dev Center.')
param devCenterName string = 'myDevCentertest'

@description('Location for the Dev Center.')
param location string = 'swedencentral'

resource devCenter 'Microsoft.DevCenter/devcenters@2024-02-01' = {  name: devCenterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    displayName: devCenterName
  }
}

output devCenterId string = devCenter.id
