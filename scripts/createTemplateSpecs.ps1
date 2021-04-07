$subId = "4611ca1e-866d-48a2-9c61-bb92d9be1fe9"
$tsRgName = 'template_Specs-rg'
$location = 'eastus2'
$templateFile = './templates/storageacct.json'
$parametersFile = './parameters/storageacct-params.json'
$templateSpecName = 'storageSpec'
$demoRG = 'ts_demo-rg'

Set-azcontext `
    -SubscriptionId $subId

#Create RGs
New-AzResourceGroup `
    -Name $tsRgName  `
    -Location $location `
    -Force

New-AzResourceGroup `
    -Name $demoRG  `
    -Location $location `
    -Force

#Create New Template Spec
New-AzTemplateSpec `
    -Name $templateSpecName `
    -Version '1.0b' `
    -ResourceGroupName $tsRgName `
    -Location $location `
    -TemplateFile $templateFile `
    -Tag @{Dept = "AISU"; Environment = "Demo"; Project = "TemplateSpecs" }

#Get Template SpecsId
$specId = (Get-AzTemplateSpec `
        -ResourceGroupName $tsRgName `
        -Name $templateSpecName `
        -Version '1.0b').Versions.Id

#Deployment using Template Specs
New-AzResourceGroupDeployment `
    -ResourceGroupName $demoRG `
    -TemplateSpecId $specId

#Deploy with Param File
New-AzResourceGroupDeployment `
    -ResourceGroupName $demoRG `
    -TemplateSpecId $specId `
    -TemplateParameterFile $parametersFile



#Linked Template Deployment
$linkedTemplate = './templates/azuredeploy.json'
$linkedTemplateSpecName = 'linkedTemplateSpec'

#Creating Template Spec with Linked Template
New-AzTemplateSpec `
    -Name $linkedTemplateSpecName `
    -Version "1.0.0.2" `
    -ResourceGroupName $tsRgName `
    -Location $location `
    -TemplateFile $linkedTemplate `
    -Tag @{Dept = "AISU"; Environment = "Demo"; Project = "LinkedTemplateSpecs" }

#Get Id used for deployments
$linkedTsId = (Get-AzTemplateSpec `
        -ResourceGroupName $tsRgName `
        -Name $linkedTemplateSpecName -Version "1.0.0.2").Versions.Id

#Deploy using linked template specs
New-AzResourceGroupDeployment `
    -TemplateSpecId $linkedTsId `
    -ResourceGroupName $demoRG

#Remove Resource Group when done
Remove-AzResourceGroup `
    -Name $tsRgName `
    -Force

Remove-AzResourceGroup `
    -Name $demoRG `
    -Force