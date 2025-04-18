param projectName string = 'myProject'
param devCenterName string
param location string = 'East US'

resource project 'Microsoft.DevCenter/projects@2022-03-01' = {
  name: projectName
  location: location
  properties: {
    devCenterId: resourceId('Microsoft.DevCenter/devcenters', devCenterName)
  }
}
