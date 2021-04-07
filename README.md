# Template Specs

## Definition

- Azure Resource Type for Storing Azure Resource Manager (ARM) template for later deployment.
- These template specs can be deployed using standard tools like PowerShell, Azure CLI, Azure portal, Azure DevOps, REST, and other SDKs and clients.

## Benefits

- Store and share ARM templates in Azure for deployment.
- Removes need for template to be local or publicly accessibly.
- Supports flexible versioning and updating.
- Provide access via Azure RBAC.
  - Read access is all that is needed to deploy.
- Can be incorporated into existing deployment processes.
-Avoids some of the problems with using a Github repo or a storage account.
  - No need to manage SAS tokens
  - No need to make the templates public
- Stand-alone or linked templates.

## Helpful Links
Based on information gathered from the following resources:

- [ARM Template Specs (microsoft.com)](https://techcommunity.microsoft.com/t5/azure-governance-and-management/arm-template-specs-is-now-public-preview/ba-p/2103322)
- [Create & deploy template specs - Azure Resource Manager | Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-specs?tabs=azure-powershell)
- [Create a template spec with linked templates - Azure Resource Manager | Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-specs-create-linked?tabs=azure-powershell)
- [Deploy a template spec as a linked template - Azure Resource Manager | Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-specs-deploy-linked-template?tabs=azure-powershell)
- [Link templates for deployment - Azure Resource Manager | Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/linked-templates?tabs=azure-powershell#use-relative-path-for-linked-templates)
- [ARM Template Specs deep dive – YouTube](https://www.youtube.com/watch?app=desktop&v=l-MtfehL80k)
- [Introduction To Azure Template Specs - YouTube](https://www.youtube.com/watch?app=desktop&v=Edvp_eX_48Y)
- [Simplify Template Deployment with new Template Specs! - YouTube](https://www.youtube.com/watch?app=desktop&v=8MmWTjxT68o&t=82s)
