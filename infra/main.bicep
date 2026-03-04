param location string = resourceGroup().location
param environment string = 'dev'

module storage 'modules/storage.bicep' = {
  name: 'storage'
  params: {
    location: location
    environment: environment
  }
}

module appservice 'modules/appservice.bicep' = {
  name: 'appservice'
  params: {
    location: location
    environment: environment
  }
}

module keyvault 'modules/keyvault.bicep' = {
  name: 'keyvault'
  params: {
    location: location
    environment: environment
  }
}

module vm 'modules/vm.bicep' = {
  name: 'vm'
  params: {
    location: location
    environment: environment
  }
}

module database 'modules/database.bicep' = {
  name: 'database'
  params: {
    location: location
    environment: environment
  }
}

module redis 'modules/redis.bicep' = {
  name: 'redis'
  params: {
    location: location
    environment: environment
  }
}

module postgres 'modules/postgres.bicep' = {
  name: 'postgres'
  params: {
    location: location
    environment: environment
  }
}

module servicebus 'modules/servicebus.bicep' = {
  name: 'servicebus'
  params: {
    location: location
    environment: environment
  }
}

module acr 'modules/acr.bicep' = {
  name: 'acr'
  params: {
    location: location
    environment: environment
  }
}

module worker 'modules/worker.bicep' = {
  name: 'worker'
  params: {
    location: location
    environment: environment
  }
}

output storageAccountName string = storage.outputs.storageAccountName
output webAppUrl string = appservice.outputs.webAppUrl
output keyVaultName string = keyvault.outputs.keyVaultName
output sqlServerFqdn string = database.outputs.sqlServerFqdn
output redisHostName string = redis.outputs.redisHostName
output vmName string = vm.outputs.vmName
output postgresHost string = postgres.outputs.postgresHost
output serviceBusEndpoint string = servicebus.outputs.serviceBusEndpoint
output acrLoginServer string = acr.outputs.loginServer
output workerVmName string = worker.outputs.workerVmName
