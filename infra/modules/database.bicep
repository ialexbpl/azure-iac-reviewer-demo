param location string
param environment string

resource sqlServer 'Microsoft.Sql/servers@2023-05-01-preview' = {
  name: 'sql-demo-${environment}-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'PLACEHOLDER_REPLACE_WITH_KV_REF'
    minimalTlsVersion: '1.2'
  }
  tags: {
    environment: environment
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2023-05-01-preview' = {
  parent: sqlServer
  name: 'db-demo-${environment}'
  location: location
  sku: {
    name: 'GP_Gen5_4'
    tier: 'GeneralPurpose'
  }
  tags: {
    environment: environment
  }
}

output sqlServerFqdn string = sqlServer.properties.fullyQualifiedDomainName
output sqlDatabaseName string = sqlDatabase.name
