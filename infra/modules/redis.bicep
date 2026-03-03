param location string
param environment string

resource redis 'Microsoft.Cache/redis@2023-08-01' = {
  name: 'redis-demo-${environment}-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    sku: {
      name: 'Standard'
      family: 'C'
      capacity: 2
    }
    minimumTlsVersion: '1.2'
  }
  tags: {
    environment: environment
  }
}

output redisHostName string = redis.properties.hostName
