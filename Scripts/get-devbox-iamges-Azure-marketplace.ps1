
# Get the current subscription ID
$subscriptionId = (Get-AzContext).Subscription.Id

# Define variables
$resourceGroupName = "test_rg"
$devCenterName ="test"   

$galleryName = "default"
$apiVersion = "2024-02-01"

# Construct the endpoint dynamically
$endpoint = "https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.DevCenter/devcenters/$devCenterName/galleries/$galleryName/images?api-version=$apiVersion"

$token = (Get-AzAccessToken -ResourceUrl "https://management.azure.com").Token

# Make the GET request
$response = Invoke-RestMethod -Uri $endpoint -Method Get -Headers @{
    Authorization = "Bearer $token"
}