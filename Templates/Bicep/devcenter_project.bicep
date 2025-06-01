@description('Name of the project to create.')
param projectName string = 'myProject'

@description('Name of the Dev Center where the project will be created.')
param devCenterName string

@description('Location for the project.')
param location string = 'East US'

resource project 'Microsoft.DevCenter/projects@2024-02-01' = {
  name: projectName
  location: location
  properties: {
    devCenterId: resourceId('Microsoft.DevCenter/devcenters', devCenterName)
    catalogSettings: {
      catalogItemSyncTypes: [
        'EnvironmentDefinition'
        'ImageDefinition'
      ]
    }
  }
}

output projectId string = project.id
