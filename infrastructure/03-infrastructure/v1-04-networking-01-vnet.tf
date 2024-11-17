resource "azurerm_virtual_network" "codehunters_vnet" {
  name                = "codehunters-vnet"
  address_space       = ["10.0.0.0/16"]

  location            = azurerm_resource_group.codehunters_main_resource_group.location
  resource_group_name = azurerm_resource_group.codehunters_main_resource_group.name
}