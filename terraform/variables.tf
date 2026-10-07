variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-vnet-connectivity"
}
variable "dev_vnet_name" {
  description = "Name of the Dev VNet"
  type        = string
  default     = "vnet-dev"
}

variable "dev_vnet_address_space" {
  description = "Address space for the Dev VNet"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "dev_subnet_name" {
  description = "Name of the Dev subnet"
  type        = string
  default     = "snet-dev"
}

variable "dev_subnet_address_prefix" {
  description = "Address prefix for the Dev subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "prod_vnet_name" {
  description = "Name of the Prod VNet"
  type        = string
  default     = "vnet-prod"
}

variable "prod_vnet_address_space" {
  description = "Address space for the Prod VNet"
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "prod_subnet_name" {
  description = "Name of the Prod subnet"
  type        = string
  default     = "snet-prod"
}

variable "prod_subnet_address_prefix" {
  description = "Address prefix for the Prod subnet"
  type        = string
  default     = "10.20.1.0/24"
}
variable "dev_nsg_name" {
  description = "Name of the Dev subnet NSG"
  type        = string
  default     = "nsg-dev"
}

variable "prod_nsg_name" {
  description = "Name of the Prod subnet NSG"
  type        = string
  default     = "nsg-prod"
}
variable "vm_size" {
  description = "Size of the Linux virtual machines"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Administrator username for the Linux VMs"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Administrator password for the Linux VMs"
  type        = string
  sensitive   = true
}