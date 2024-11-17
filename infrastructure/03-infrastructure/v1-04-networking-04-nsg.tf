# Network Security Group - Public
resource "azurerm_network_security_group" "codehunters_public_nsg" {
  name                    = "codehunters-public-nsg"
  location                = azurerm_resource_group.codehunters_main_resource_group.location
  resource_group_name     = azurerm_resource_group.codehunters_main_resource_group.name

  security_rule {
    name                          = "sec-rules-01"
    access                        = " TODO "
    direction                     = "Inbound"
    priority                      = 1000
    protocol                      = "Tcp"
    destination_address_prefix    = "*"
    destination_port_ranges       = ["22", "80", "443", "8080"]
    source_port_range             = "*"
    source_address_prefix         = "*"
  }
}

# Public subnet is protected by a NSG
resource "azurerm_subnet_network_security_group_association" "nsg_to_public_subnets" {
  network_security_group_id     = azurerm_network_security_group.codehunters_public_nsg.id
  subnet_id                     = azurerm_subnet.public_subnet.id
}

# Network Security Group - Private
resource "azurerm_network_security_group" "codehunters_private_nsg" {
  name                    = "codehunters-private-nsg"
  location                = azurerm_resource_group.codehunters_main_resource_group.location
  resource_group_name     = azurerm_resource_group.codehunters_main_resource_group.name

  security_rule {
    name                          = "sec-rules-01"
    access                        = "Allow"
    direction                     = "Inbound"
    priority                      = 1000
    protocol                      = "Tcp"
    destination_address_prefix    = "*"
    destination_port_ranges       = [ " TODO " ]
    source_port_range             = "*"
    source_address_prefix         = azurerm_subnet.public_subnet.address_prefixes
  }

}

# Private subnet is protected by a NSG
resource "azurerm_subnet_network_security_group_association" "nsg_to_private_subnets" {
  network_security_group_id     = azurerm_network_security_group.codehunters_private_nsg.id
  subnet_id                     = azurerm_subnet.private_subnet[count.index].id
}