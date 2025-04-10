Azure Modular Infrastructure Deployment

🔧 Project Overview

This project defines a modular infrastructure setup using Bicep, focused on deploying the following Azure services:

✅ Azure OpenAI (via Cognitive Services)

✅ Azure AI Search (formerly Cognitive Search)

✅ Azure Storage Account (configured for public access in dev)

✅ GitHub Actions for CI/CD deployment across environments

🗂️ Project Structure

├── main.bicep                    # Root orchestrator for all modules
├── .github/
│   └── workflows/
│       └── deploy-stages.yml     # Multi-stage deployment pipeline
└── modules/
    ├── openAI/
    │   └── openAI.bicep
    ├── aiSearch/
    │   └── aiSearch.bicep
    └── storage/
        └── storage.bicep

🚀 Environments

The project supports deployment to:

Dev: Auto-deploys on push to main
Test: Requires manual approval via GitHub Environment
Prod: Requires manual approval via GitHub Environment

Each environment maps to a separate Azure Resource Group:

Environment	Resource Group	Public Blob Access

Dev	    rg-chatbot-dev	✅ Enabled
Test	rg-chatbot-test	❌ Disabled by default
Prod	rg-chatbot-prod	❌ Disabled by default

🔐 Security & GitHub Secrets

Required secrets under GitHub Actions → Secrets:

Name	                Description
AZURE_CREDENTIALS	    Azure service principal in JSON (sdk-auth)
AZURE_SUBSCRIPTION_ID	Azure subscription ID
AZURE_RG_DEV		    Dev Resource Group name
AZURE_RG_TEST		    Test Resource Group name
AZURE_RG_PROD		    Prod Resource Group name
AZURE_LOCATION		    Azure region (e.g., East US)

⚙️ GitHub Actions: CI/CD Deployment
Deployment pipeline: .github/workflows/deploy-stages.yml

How it works:

Dev: Auto-deploy on push to main
Test: Deploy after Dev, manual approval required
Prod: Deploy after Dev, manual approval required

🛠️ Deployment via CLI (optional)

az deployment group create \
  --resource-group rg-chatbot-dev \
  --template-file main.bicep \
  --parameters environment=dev

📌 Next Steps

Add Azure Function and APIM modules
Secure resources with private endpoints or IP restrictions
Add monitoring and tagging for cost and governance
