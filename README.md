# Azure Dev Center and Dev Box Management

This repository contains templates and documentation for setting up and managing Azure Dev Center and Dev Box environments. It provides Infrastructure as Code (IaC) templates in various formats (ARM, Bicep, Terraform) to help organizations easily deploy and configure development environments for their teams.

## Overview

Azure Dev Center simplifies the process of setting up and managing development environments by providing tools and configurations for Dev Boxes, network connections, and project-level catalogs. This repository contains everything you need to get started with Azure Dev Center and Dev Box.

### Key Components

- **Dev Center**: A centralized resource that enables management and provisioning of development environments
- **Dev Box**: Cloud-based workstations that can be customized and configured for specific development needs
- **Network**: Configuration for Microsoft-hosted or custom networks
- **Catalogs**: Project-level catalogs for organizing resources and configurations

## Repository Structure

```
DevBox/
├── Docs/                           # Documentation
│   ├── catalog.md                  # Catalog configuration details
│   ├── devcenter_documentation.md  # General Dev Center documentation
│   └── federated_credentials_setup.md # Federated credentials setup guide
├── Scripts/                        # Utility scripts
│   └── get-devbox-iamges-Azure-marketplace.ps1 # Script to list available images
├── Templates/                      # IaC templates
│   ├── ARM/                        # ARM templates
│   │   ├── devbox_definition.json
│   │   ├── ....
│   │   ├── project_catalog.json
│   │   └── *.parameters.json       # Parameter files for each template
│   ├── Bicep/                      # Bicep templates
│   └── Terraform/                  # Terraform templates (to be added)
└── README.md                       # This file
```

## Getting Started

### Prerequisites

1. **Azure Subscription**: An active Azure subscription is required.
2. **Permissions**: Sufficient permissions to create and manage Azure resources, specifically for Dev Center and Dev Box.

#### Available scenarios
- Login to Azure with federated credentials
- Deploy Dev Center + Dev Box setup 
- Deploy Dev Center + Dev Box setup in custom network
- Deploy Dev Center + Dev Box setup with custom Dev Box Definition (WIP)

## Authentication and Security

For information on setting up federated credentials with GitHub or Azure DevOps, refer to `Docs/federated_credentials_setup.md`. This approach enhances security by eliminating the need for traditional credentials like passwords or secrets.

## Authentication and Security

For Dev Center key features and concepts, refer to `Docs/devcenter_documentation.md`

## Catalog Configuration

For information on configuring catalogs and connecting them to your Azure DevOps or GitHub repositories, refer to `Docs/catalog.md`. The document covers:

- Adding catalogs to projects
- Authentication options
- Setting up managed identities or PATs for secure access

## Additional Resources

- [Official Azure Dev Center Documentation](https://learn.microsoft.com/en-us/azure/dev-center/)
- [Azure Dev Box Documentation](https://learn.microsoft.com/en-us/azure/dev-box/)
- [Microsoft Entra Federated Credentials Documentation](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation)

## Contributing

Feel free to submit issues or pull requests to improve the templates or documentation in this repository.
