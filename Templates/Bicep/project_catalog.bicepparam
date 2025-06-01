using './project_catalog.bicep'

param projectName = ''
param catalogName = ''
param gitHubRepoUri = ''
param gitHubBranch = 'main'
param gitHubPath = '/'
param gitHubPatSecretIdentifier = ''
param syncType = 'Scheduled'
param authType = 'None'

