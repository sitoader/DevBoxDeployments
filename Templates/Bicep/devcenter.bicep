param devCenterName string = 'myDevCenter'
param location string = 'East US'

resource devCenter 'Microsoft.DevCenter/devcenters@2022-03-01' = {
  name: devCenterName
  location: location
  properties: {}
}