terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.64.0" # or latest stable version
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_oidc = true
  client_id = var.managed_identity_client_id
}

provider "kubernetes" {
  host                   = module.aks.kube_config["host"]
  client_certificate     = base64decode(module.aks.kube_config["client_certificate"])
  client_key             = base64decode(module.aks.kube_config["client_key"])
  cluster_ca_certificate = base64decode(module.aks.kube_config["cluster_ca_certificate"])
}

provider "helm" {
  kubernetes {
    host                   = module.aks.kube_config["host"]
    client_certificate     = base64decode(module.aks.kube_config["client_certificate"])
    client_key             = base64decode(module.aks.kube_config["client_key"])
    cluster_ca_certificate = base64decode(module.aks.kube_config["cluster_ca_certificate"])
  }
}
