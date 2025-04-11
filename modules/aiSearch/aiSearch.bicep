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

@description('Resource definition for Microsoft.Search/searchServices@2021-04-01')
resource aiSearch 'Microsoft.Search/searchServices@2020-08-01' = {
  name: 'aisearch-wegman-chatbot-${environment}'
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
  tags:commonTags
  
}
