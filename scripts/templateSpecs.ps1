## Define Variables

$tsRgName = 'template_Specs-rg'
$location = 'eastus2'
$templateFile = './templates/storageacct.json'
$parametersFile = './parameters/storageacct-params.json'
$templateSpecName = 'storageSpec'
$demoRG = 'ts_demo-rg'

# Connect to correct subscription
$subId = "subIdValue"
Set-azcontext `
    -SubscriptionId $subId

Get-AzResourceGroup -Name $tsRgName
Get-AzResourceGroup -Name $demoRG
# Create Resource Groups
New-AzResourceGroup `
    -Name $tsRgName  `
    -Location $location `
    -Force
New-AzResourceGroup `
    -Name $demoRG  `
    -Location $location `
    -Force

# Create New Template Spec
New-AzTemplateSpec `
    -Name $templateSpecName `
    -Version '1.0b' `
    -ResourceGroupName $tsRgName `
    -Location $location `
    -TemplateFile $templateFile `
    -Tag @{Dept = "AISU"; Environment = "Demo"; Project = "TemplateSpecs" }

# Get Template SpecsId
$specId = (Get-AzTemplateSpec `
        -ResourceGroupName $tsRgName `
        -Name $templateSpecName `
        -Version '1.0a').Versions.Id

# Deployment using Template SpecsId Reference
New-AzResourceGroupDeployment `
    -ResourceGroupName $demoRG `
    -TemplateSpecId $specId

# Deploy Template SpecsId Reference with Param File
New-AzResourceGroupDeployment `
    -ResourceGroupName $demoRG `
    -TemplateSpecId $specId `
    -TemplateParameterFile $parametersFile `
    -Confirm

# Deploy Main Template that uses a template spec.
New-AzResourceGroupDeployment `
    -ResourceGroupName $tsRgName `
    -TemplateFile .\templates\main.json `
    -Confirm

## Linked Template Deployment using Template Specs
$linkedTemplate = './templates/azuredeploy.json'
$linkedTemplateSpecName = 'linkedTemplateSpec'

# Creating Template Spec with Linked Template
New-AzTemplateSpec `
    -Name $linkedTemplateSpecName `
    -Version "1.0.0.2" `
    -ResourceGroupName $tsRgName `
    -Location $location `
    -TemplateFile $linkedTemplate `
    -Tag @{Dept = "AISU"; Environment = "Demo"; Project = "LinkedTemplateSpecs" }

# Get Id used for deployments
$linkedTsId = (Get-AzTemplateSpec `
        -ResourceGroupName $tsRgName `
        -Name $linkedTemplateSpecName -Version "1.0.0.2").Versions.Id

# Deploy using linked template specs
New-AzResourceGroupDeployment `
    -TemplateSpecId $linkedTsId `
    -ResourceGroupName $demoRG


<#  Remove Resource Groups when done
Remove-AzResourceGroup `
    -Name $tsRgName `
    -Force

Remove-AzResourceGroup `
    -Name $demoRG `
    -Force
#>