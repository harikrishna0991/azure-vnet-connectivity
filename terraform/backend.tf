terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstatevnet001"
    container_name       = "tfstate"
    key                  = "azure-vnet-connectivity.tfstate"
  }
}