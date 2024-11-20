resource "azurerm_resource_group" "codehunters_main_resource_group" {
  name     = "codehunters-training-components-rg"
  location = var.location
}
