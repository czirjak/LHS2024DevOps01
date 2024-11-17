resource "azurerm_subnet" "public_subnet" {
  virtual_network_name    = azurerm_virtual_network.codehunters_vnet.name
  name                    = "codehunters-public-subnet"
  resource_group_name     = azurerm_resource_group.codehunters_main_resource_group.name
  address_prefixes        = [var.public_subnet]
}

resource "azurerm_subnet" "private_subnet" {
  virtual_network_name    = azurerm_virtual_network.codehunters_vnet.name
  name                    = "codehunters-private-subnet"
  resource_group_name     = azurerm_resource_group.codehunters_main_resource_group.name
  address_prefixes        = [var.private_subnet]

  service_endpoints = [
    "Microsoft.AzureCosmosDB",
    "Microsoft.ContainerRegistry",
    "Microsoft.KeyVault",
    "Microsoft.Storage"
  ]
}