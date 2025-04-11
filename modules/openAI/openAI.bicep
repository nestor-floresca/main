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

resource OpenAI 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'openai-wegman-chatbot-${environment}'
  location: resourceGroup().location
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
  kind: 'OpenAI'
  properties: {
    //customSubDomainName: 'openai-wegman-chatbot-sub-${environment}'
    publicNetworkAccess: 'Enabled'
  }
  tags:commonTags
}
