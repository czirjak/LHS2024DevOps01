terraform {
  backend "azurerm" {
    resource_group_name       = "codehunters-storages"
    storage_account_name      = " TODO "
    container_name            = " TODO "
    key                       = "codehunters.training.terraform.tfstate"
  }
}
