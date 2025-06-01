using './vnet_deployment.bicep'

param vnetName = 'myVNet'
param location = 'swedencentral'
param addressPrefix = '10.0.0.0/16'
param subnetName = 'default'
param subnetPrefix = '10.0.0.0/24'
param dnsServers = []
param enableDdosProtection = false
param tags = {
  environment: 'development'
  purpose: 'devbox-networking'
}

