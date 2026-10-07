output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Azure region of the resource group"
  value       = azurerm_resource_group.main.location
}
output "dev_vm_private_ip" {
  description = "Private IP address of the Dev VM"
  value       = azurerm_network_interface.dev.private_ip_address
}

output "prod_vm_private_ip" {
  description = "Private IP address of the Prod VM"
  value       = azurerm_network_interface.prod.private_ip_address
}