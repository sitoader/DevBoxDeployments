@description('Name of the virtual network')
param vnetName string = 'myVNet'

@description('Location for the virtual network')
param location string = resourceGroup().location

@description('Address prefix for the virtual network')
param addressPrefix string = '10.0.0.0/16'

@description('Name of the subnet')
param subnetName string = 'default'

@description('Address prefix for the subnet')
param subnetPrefix string = '10.0.0.0/24'

@description('DNS servers for the virtual network (optional)')
param dnsServers array = []

@description('Enable DDoS Protection for the virtual network')
param enableDdosProtection bool = false

@description('Tags for the virtual network resource')
param tags object = {
  environment: 'development'
  purpose: 'devbox-networking'
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    dhcpOptions: {
      dnsServers: dnsServers
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    enableDdosProtection: enableDdosProtection
  }
}

output vnetId string = vnet.id
output subnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
