## Deployment Steps

#### Using ARM Templates

1. **Deploy the Dev Center**:

```powershell
$resourceGroupName = "your-resource-group"
$location = "swedencentral"  # Or your preferred region

# Create a resource group if it doesn't exist
New-AzResourceGroup -Name $resourceGroupName -Location $location -Force

# Deploy the Dev Center
New-AzResourceGroupDeployment `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile "./Templates/ARM/devcenter.json" `
  -TemplateParameterFile "./Templates/ARM/devcenter.parameters.json"
```

2. **Deploy a Dev Center Project**:

```powershell
New-AzResourceGroupDeployment `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile "./Templates/ARM/devcenter_project.json" `
  -TemplateParameterFile "./Templates/ARM/devcenter_project.parameters.json"
```

3. **Create a Dev Box Definition and Pool**:

```powershell
# Deploy Dev Box Definition
New-AzResourceGroupDeployment `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile "./Templates/ARM/devbox_definition.json" `
  -TemplateParameterFile "./Templates/ARM/devbox_definition.parameters.json"

# Deploy Dev Box Pool
New-AzResourceGroupDeployment `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile "./Templates/ARM/devboxpool.json" `
  -TemplateParameterFile "./Templates/ARM/devboxpool.parameters.json"
```

### Configuration Options

Refer to the parameter files in the Templates directory for configurable options. Key configuration options include:

- **Dev Center Settings**: Network configuration, Azure Monitor integration
- **Dev Box Pool Settings**: VM images, network types, auto-shutdown rules
- **Project Settings**: Catalog configuration, permissions