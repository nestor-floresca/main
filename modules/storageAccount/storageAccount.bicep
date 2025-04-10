param environment string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: 'storagechatbot${environment}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
