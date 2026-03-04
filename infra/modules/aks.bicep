param location string
param environment string

resource aks 'Microsoft.ContainerService/managedClusters@2024-02-01' = {
  name: 'aks-demo-${environment}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: 'aks-demo-${environment}'
    agentPoolProfiles: [
      {
        name: 'system'
        count: 3
        vmSize: 'Standard_D4s_v3'
        osType: 'Linux'
        mode: 'System'
      }
    ]
    networkProfile: {
      networkPlugin: 'azure'
      loadBalancerSku: 'standard'
    }
  }
  tags: {
    environment: environment
  }
}

output aksName string = aks.name
output aksApiServer string = aks.properties.fqdn
