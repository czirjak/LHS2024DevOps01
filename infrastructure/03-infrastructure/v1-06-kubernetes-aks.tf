resource "azurerm_kubernetes_cluster" "codehunters_aks_cluster" {
  name                = "codehunters-training-aks"
  resource_group_name = azurerm_resource_group.codehunters_main_resource_group.name
  location            = azurerm_resource_group.codehunters_main_resource_group.location
  dns_prefix          = "codehuntersaks"

  # VMSS
  default_node_pool {
    name            = "codehunters"
    vm_size         = "Standard_B2s"
    min_count       = 1
    max_count       = 5
    max_pods        = 30 #30 is the minimum

    auto_scaling_enabled    = TODO
    vnet_subnet_id          = azurerm_subnet.private_subnet.id
    node_public_ip_enabled  = TODO
  }

  identity { # Managed Identity 1
    type = "SystemAssigned"
  }

  network_profile {
    # The Azure Container Networking Interface (CNI) plugin, used for pod networking,
    # benefits from having its own subnet for efficient IP address management
    # PODs have different subnet from NODEs.
    network_plugin    = "azure"
    network_policy    = "azure"
    service_cidr      = "10.1.100.0/24"
    dns_service_ip    = "10.1.100.10"
    load_balancer_sku = "standard"
  }

  key_vault_secrets_provider {
    # Managed Identity 2
    secret_rotation_enabled = true
  }

}