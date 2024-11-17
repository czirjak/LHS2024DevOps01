resource "azurerm_container_registry" "codehunters_standard_acr" {
  name                = "codehunterstrainingacr"
  resource_group_name = azurerm_resource_group.codehunters_main_resource_group.name
  location            = azurerm_resource_group.codehunters_main_resource_group.location
  sku                 = "Basic"
  admin_enabled       = false
}

resource "azurerm_role_assignment" "acr_role_assignment_to_standard_acr" {
  principal_id                     = var.training_group_id
  role_definition_name             = "Contributor"
  scope                            = azurerm_container_registry.codehunters_standard_acr.id
  skip_service_principal_aad_check = false # FALSE for Users and Groups
}