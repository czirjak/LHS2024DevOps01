resource "azurerm_key_vault" "codehunters_key_vault" {
  name                        = "codehunterskeyvault"
  location                    = azurerm_resource_group.codehunters_main_resource_group.location
  resource_group_name         = azurerm_resource_group.codehunters_main_resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.client.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false # In production this must be true

  sku_name = "standard"

  access_policy {
    object_id = " TODO " #czirjak
    tenant_id = data.azurerm_client_config.client.tenant_id

    secret_permissions = [
      "Get",
      "Delete",
      "List",
      "Set"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.client.tenant_id
    object_id    = azurerm_kubernetes_cluster.codehunters_aks_cluster.key_vault_secrets_provider[0].secret_identity[0].object_id

    secret_permissions = [
      " TODO "
    ]
  }
}