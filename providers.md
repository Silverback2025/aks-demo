$ terraform providers

Providers required by configuration:
.
├── provider[registry.terraform.io/hashicorp/kubernetes]
├── provider[registry.terraform.io/hashicorp/helm]
├── provider[registry.terraform.io/hashicorp/azurerm] >= 3.64.0
├── module.aks
│   └── provider[registry.terraform.io/hashicorp/azurerm]
├── module.aks_rbac
│   └── provider[registry.terraform.io/hashicorp/azurerm]
├── module.backend_storage
│   └── provider[registry.terraform.io/hashicorp/azurerm]
├── module.bootstrap
│   └── provider[registry.terraform.io/hashicorp/null]
└── module.monitoring
    └── provider[registry.terraform.io/hashicorp/azurerm]
