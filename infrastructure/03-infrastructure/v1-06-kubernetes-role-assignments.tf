resource "azurerm_role_assignment" "aks_to_acr" {
  principal_id                     = azurerm_kubernetes_cluster.codehunters_aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.codehunters_standard_acr.id
  skip_service_principal_aad_check = true # FALSE for Users
}

resource "azurerm_role_assignment" "students_to_aks_as_user" {
  principal_id                     = var.training_group_id
  role_definition_name             = "Azure Kubernetes Service Cluster User Role"
  scope                            = azurerm_kubernetes_cluster.codehunters_aks_cluster.id
}