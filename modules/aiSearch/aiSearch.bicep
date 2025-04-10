param environment string

@description('Resource definition for Microsoft.Search/searchServices@2021-04-01')
resource aiSearch 'Microsoft.Search/searchServices@2020-08-01' = {
  name: 'aisearch-chatbot-${environment}'
  location: resourceGroup().location
  sku: {
    name: 'standard'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
    publicNetworkAccess: 'enabled'
  }
}
