terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = " TODO "
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "=3.0.2"
    }
  }
}

provider "azurerm" {
  subscription_id = " TODO "

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy    = TODO
      recover_soft_deleted_key_vaults = TODO
    }
  }
}

provider "azuread" {

}

provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.codehunters_aks_cluster.kube_config[0].host
    client_key             = base64decode(azurerm_kubernetes_cluster.codehunters_aks_cluster.kube_config[0].client_key)
    client_certificate     = base64decode(azurerm_kubernetes_cluster.codehunters_aks_cluster.kube_config[0].client_certificate)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.codehunters_aks_cluster.kube_config[0].cluster_ca_certificate)
  }
}