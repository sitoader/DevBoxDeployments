@description('Name of the Dev Box Definition.')
param devBoxDefinitionName string = 'VS2022WIN11'

@description('Name of the Dev Center.')
param devCenterName string

@description('Location for the Dev Box Definition.')
param location string = 'swedencentral'

@description('Image reference for the Dev Box.')
param imageReferenceName string = 'microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win10-m365-gen2'

@description('SKU name for the Dev Box.')
param skuName string = 'general_i_8c32gb256ssd_v2'

@description('Enable or disable hibernate support.')
@allowed(['Enabled', 'Disabled'])
param hibernateSupport string = 'Enabled'

resource devBoxDefinition 'Microsoft.DevCenter/devcenters/devboxdefinitions@2024-02-01' = {
  name: '${devCenterName}/${devBoxDefinitionName}'
  location: location
  properties: {
    imageReference: {
      id: '${resourceId('Microsoft.DevCenter/devcenters/galleries', devCenterName, 'Default')}/images/${imageReferenceName}'
    }
    sku: {
      name: skuName
    }
    hibernateSupport: hibernateSupport
  }
}
