# Create public IP
resource "azurerm_public_ip" "codehunters_nat_gateway_public_ip" {
  name                = "codehunters-ngw-public-ip"
  location            = azurerm_resource_group.codehunters_main_resource_group.location
  resource_group_name = azurerm_resource_group.codehunters_main_resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = [1]
}

#Nat Gateway
resource "azurerm_nat_gateway" "codehunters_nat_gateway" {
  name                    = "codehunters-nat-gateway"
  location                = azurerm_resource_group.codehunters_main_resource_group.location
  resource_group_name     = azurerm_resource_group.codehunters_main_resource_group.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = [1] # The resource type 'natGateways' does not support multiple availability zones.
}

# Nat - Public IP Association
resource "azurerm_nat_gateway_public_ip_association" "public_ip_to_natgw" {
  nat_gateway_id       = azurerm_nat_gateway.codehunters_nat_gateway.id
  public_ip_address_id = azurerm_public_ip.codehunters_nat_gateway_public_ip.id
}

# NAT - Subnets association
resource "azurerm_subnet_nat_gateway_association" "private_subnets_to_natgw" {
  subnet_id      = azurerm_subnet.private_subnet.id
  nat_gateway_id = azurerm_nat_gateway.codehunters_nat_gateway.id
}