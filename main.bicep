targetScope = 'resourceGroup'

param environment string = 'dev'

// Azure OpenAI Module 
module openAI './modules/openAI/openAI.bicep' = {
  name: 'openAI-chatbot-${environment}'
  params: {
    environment: environment
  }
}

// Azure AI Search Module
module aiSearch './modules/aiSearch/aiSearch.bicep' = {
  name: 'aiSearch-chatbot-${environment}'
  params: {
    environment: environment
  }
}

// Azure Storage Account Module
module storageAccount './modules/storageAccount/storageAccount.bicep' = {
  name: 'storagechatbot${environment}'
  params: {
    environment: environment
  }
}
