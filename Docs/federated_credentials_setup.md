# Setting Up Federated Credentials in Azure

Federated credentials allow external identity providers to authenticate and authorize access to Azure resources without requiring traditional credentials like passwords or secrets. This is particularly useful for enabling secure and seamless integration with GitHub Actions, Azure DevOps etc

## Prerequisites
1. **Azure Subscription**: Ensure you have a Azure subscription.
2. **Permissions**: Ensure you have sufficient permissions to create app registrations and assign roles in Microsoft Entra.

---

## Steps to Set Up Federated Credentials

### 1. Create a Microsoft Entra Application
1. Navigate to the [Azure Portal](https://portal.azure.com/).
2. Go to **Microsoft Entra ID** > **App registrations**.
3. Click **New registration**.
4. Provide the following details:
   - **Name**: Enter a name for the app (e.g., `GitHubFederatedApp`).
   - **Supported account types**: Choose the appropriate option (e.g., Single tenant).
   - **Redirect URI**: Leave this blank for now.
5. Click **Register**.
6. Copy the values for **Client ID**, **Subscription ID**, and **Directory (tenant) ID**. These will be used later in your GitHub Actions workflow.

### 2. Configure Federated Credentials
1. In the app registration, go to **Certificates & secrets** > **Federated credentials**.
2. Click **Add credential**.
3. Provide the following details:
   - **Federated credential scenario**: Select **GitHub Actions deploying Azure resources**.
   - **Organization and Repository**: Specify the GitHub organization and repository for your workflow.
   - **Entity type**: Select **Environment**, **Branch**, **Pull request**, or **Tag** and specify the value. The values must exactly match the configuration in the GitHub workflow. For more info, read the [examples](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation-create-trust?pivots=identity-wif-apps-methods-azp#entity-type-examples).
   - **Name**: Add a name for the federated credential.
4. The **Issuer**, **Audiences**, and **Subject identifier** fields will autopopulate based on the values you entered.
5. Click **Add**.

### 3. Assign Roles to the App Registration
1. Go to the **Azure Portal** > **Subscriptions**.
2. Select the subscription where you want to grant access.
3. Go to **Access control (IAM)** > **Add role assignment**.
4. Select the appropriate role (e.g., `Contributor` or `Reader`).
5. Assign the role to the app registration.

### 4. Configure the GitHub Actions Workflow
1. In your GitHub repository, go to **Settings** > **Secrets and variables** > **Actions**.
2. Add the following environment variables:
   - `AZURE_CLIENT_ID`: The client ID of the app registration.
   - `AZURE_TENANT_ID`: The tenant ID of your Microsoft Entra ID.
   - `AZURE_SUBSCRIPTION_ID`: The subscription ID of your Azure account.
3. Update your GitHub Actions workflow to use the federated credentials.


### 5. Considerations
 - The entity type configured in the federated credentials is a critical aspect of the setup process.

For instance, if the entity type is set to **Environment**, you must create the corresponding environment in your GitHub repository by navigating to **Settings** -> **Environments**. Ensure that the environment name exactly matches the one specified in your federated credential configuration.

Additionally, secrets such as **tenant ID**, **subscription ID**, and other required values must be added to the environment's configuration as secrets. 

- To fetch an OIDC token for a workflow, set the following permissions at the workflow level:

```yaml
actions:
  permissions:
    id-token: write # This is required for requesting the JWT
    contents: read  # This is required for actions/checkout
```

---

## Best Practices
- Use least privilege: Assign only the roles and permissions required for the app.
- Monitor access: Regularly review and audit the federated credentials.
- Rotate credentials: Periodically update the federated credentials to enhance security.

For more details, refer to the [Microsoft Entra Federated Credentials Documentation](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation).

## Workflow example

```yaml
name: Run Azure Login with OIDC
on: [push]

permissions:
  id-token: write
  contents: read
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    environment: test
    steps:
      - name: Azure login
        uses: azure/login@v2
        with:
          client-id: ${{ vars.AZURE_CLIENT_ID }}
          tenant-id: ${{ secrets.AZURE_TENANT_ID }}
          subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
```