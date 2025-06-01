using './devboxpool.bicep'

param projectName = 'myProject'
param poolName = 'VS2022Pool'
param location = 'swedencentral'
param managedVirtualNetworkRegions = [
  'swedencentral'
]


