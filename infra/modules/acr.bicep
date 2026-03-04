param location string
param environment string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-07-01' = {
  name: 'acrdemo${environment}${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    adminUserEnabled: false
  }
  tags: {
    environment: environment
  }
}

output loginServer string = containerRegistry.properties.loginServer
