param environment string

resource OpenAI 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'openai-chatbot-${environment}'
  location: resourceGroup().location
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
  kind: 'OpenAI'
  properties: {
    customSubDomainName: 'openai-chatbot-sub-${environment}'
    publicNetworkAccess: 'Enabled'
  }
}
