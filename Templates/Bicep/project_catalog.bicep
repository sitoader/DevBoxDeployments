@description('Name of the existing project where the catalog will be added.')
param projectName string

@description('Name of the catalog to add to the project.')
param catalogName string

@description('The GitHub repository URI for the catalog. Format: https://github.com/{org}/{repo}')
param gitHubRepoUri string

@description('The branch of the GitHub repository to use.')
param gitHubBranch string = 'main'

@description('The path within the GitHub repository to use.')
param gitHubPath string = '/'

@description('The Key Vault secret identifier for the GitHub Personal Access Token. Required only when authType is PAT.')
@secure()
param gitHubPatSecretIdentifier string = ''

@description('How the catalog should be synchronized with the source repository.')
@allowed(['Scheduled', 'Manual'])
param syncType string = 'Scheduled'

@description('Authentication type to use for the GitHub repository. Use "None" for public repositories.')
@allowed(['None', 'PAT', 'OAuth'])
param authType string = 'None'

resource catalog 'Microsoft.DevCenter/projects/catalogs@2024-02-01' = {
  name: '${projectName}/${catalogName}'
  properties: {
    gitHub: {
      uri: gitHubRepoUri
      branch: gitHubBranch
      path: gitHubPath
      secretIdentifier: authType == 'PAT' ? gitHubPatSecretIdentifier : null
    }
    syncType: syncType
  }
}

output catalogId string = catalog.id
