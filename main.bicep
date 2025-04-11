targetScope = 'resourceGroup'

param environment string = 'dev'

// Azure OpenAI Module 
module openAI './modules/openAI/openAI.bicep' = {
  name: 'openAI-wegman-chatbot-${environment}'
  params: {
    environment: environment
  }
}

// Azure AI Search Module
module aiSearch './modules/aiSearch/aiSearch.bicep' = {
  name: 'aiSearch-wegman-chatbot-${environment}'
  params: {
    environment: environment
  }
}

// Azure Storage Account Module
module storageAccount './modules/storageAccount/storageAccount.bicep' = {
  name: 'stgwegmanchatbot${environment}'
  params: {
    environment: environment
  }
}
