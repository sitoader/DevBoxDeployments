
# Custom Dev Box VM Image and Catalog Configuration

## Custom Dev Box VM Image

### Overview
A custom Dev Box VM image allows you to create development environments tailored to your team's specific requirements. These images can include pre-installed tools, configurations, and settings.

### Steps to Create a Custom VM Image
1. **Prepare the Base VM**:
   - Create a virtual machine in Azure.
   - Install the required software and tools.
   - Configure the VM as needed.

2. **Generalize the VM**:
   - Run the `sysprep` tool to generalize the VM.
   - Shut down the VM after generalization.

3. **Create an Image**:
   - Capture the VM as an image in Azure.
   - Store the image in an Azure Compute Gallery.

4. **Attach the Image to a Dev Center**:
   - Use the ARM template to attach the Azure Compute Gallery to your Dev Center.
   - Reference the custom image in your Dev Box definition.

For more details, refer to the [Dev Box Image Documentation](https://learn.microsoft.com/en-us/azure/dev-box/how-to-manage-dev-box-definitions).

---

## Adding a Catalog to a Project

### Overview
A catalog in a Dev Center project provides a centralized repository for environment definitions and configurations. Catalogs can be sourced from Azure DevOps or GitHub.

### Catalog Locations and Authentication Options

#### 1. Azure DevOps

**Authentication Types:**

- **Managed Identity:**
  - The managed identity attached to the project must be added to the Azure DevOps organization as a user.
  - Grant the managed identity read access to the Azure DevOps project.
  - [Learn more](https://learn.microsoft.com/en-us/azure/deployment-environments/how-to-configure-catalog?tabs=DevOpsRepoMSI#add-a-catalog).

- **Personal Access Token (PAT):**
  - Store the PAT as a secret in Azure Key Vault.
  - Provide the Key Vault secret identifier in the catalog configuration.
  - Assign the managed identity the appropriate role on the Key Vault.
  - [Learn more](https://learn.microsoft.com/en-us/azure/deployment-environments/how-to-configure-catalog?tabs=DevOpsRepoPAT#add-a-catalog).

#### 2. GitHub

**Authentication Types:**

- **GitHub App:**
  - Authenticate catalogs using a GitHub App.
  - Configure your repositories for a successful connection.
  - [Learn more](https://learn.microsoft.com/en-us/azure/deployment-environments/how-to-configure-catalog?tabs=GitHubRepoApp#add-a-catalog).

- **Personal Access Token (PAT):**
  - Store the PAT as a secret in Azure Key Vault.
  - Provide the Key Vault secret identifier in the catalog configuration.
  - Assign the managed identity the appropriate role on the Key Vault.
  - [Learn more](https://learn.microsoft.com/en-us/azure/deployment-environments/how-to-configure-catalog?tabs=GitHubRepoPAT#add-a-catalog).

### Steps to Add a Catalog
1. **Define the Catalog Source:**
   - Specify the repository URI, branch, and path.
   - Choose the authentication type (Managed Identity, PAT, or GitHub App).

2. **Configure Authentication:**
   - For Managed Identity, ensure the identity has the required permissions.
   - For PAT, store the token in Azure Key Vault and provide the secret identifier.

3. **Deploy the Catalog:**
   - Use the provided ARM template (`project_catalog.json`) to deploy the catalog.
   - Update the parameters file (`project_catalog.parameters.json`) with the catalog details.

4. **Verify the Catalog:**
   - Check the catalog in the Azure portal under the project settings.

For more details, refer to the [Catalog Configuration Documentation](https://learn.microsoft.com/en-us/azure/deployment-environments/how-to-configure-catalog).