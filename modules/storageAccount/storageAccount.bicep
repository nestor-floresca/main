param environment string

@description('Tags to associate with wegmans')
var commonTags = {
  'wfm-application': 'Commerce 3Cloud Feeds'
  'wfm-data-classification': 'Regulatory'
  'wfm-data-classification-customer': 'true'
  'wfm-data-classification-employee': 'false'
  'wfm-data-classification-ephi': 'false'
  'wfm-data-classification-pci': 'false'
  'wfm-data-classification-pi': 'true'
  'wfm-data-encrypted': 'false'
  'wfm-data-protection': 'Administrative'
  'wfm-data-sharing': 'Internal'
  'wfm-data-usage': 'Permanent'
  'wfm-environment': 'Development'
  'wfm-service': 'eCommerce'
  'wfm-team': 'Digital Commerce'
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: 'stgwegmanchatbot${environment}'
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
  tags: commonTags
}
