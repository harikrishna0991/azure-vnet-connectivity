resource "azurerm_virtual_network" "dev" {
  name                = var.dev_vnet_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.dev_vnet_address_space
}

resource "azurerm_subnet" "dev" {
  name                 = var.dev_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.dev.name
  address_prefixes     = [var.dev_subnet_address_prefix]
}

resource "azurerm_virtual_network" "prod" {
  name                = var.prod_vnet_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.prod_vnet_address_space
}

resource "azurerm_subnet" "prod" {
  name                 = var.prod_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.prod.name
  address_prefixes     = [var.prod_subnet_address_prefix]
}

resource "azurerm_virtual_network_peering" "dev_to_prod" {
  name                      = "peer-dev-to-prod"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.dev.name
  remote_virtual_network_id = azurerm_virtual_network.prod.id

  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "prod_to_dev" {
  name                      = "peer-prod-to-dev"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.prod.name
  remote_virtual_network_id = azurerm_virtual_network.dev.id

  allow_virtual_network_access = true
}
resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.dev.name
  address_prefixes     = ["10.10.10.0/26"]
}