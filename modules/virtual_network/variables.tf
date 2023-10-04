variable "resource_group_name" {
  description = "Name of the Azure resource group"
}

variable "location" {
  description = "Location for the Azure resources"
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "subnet_names" {
  description = "Names of the Subnets"
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for Subnets"
  type        = list(string)
}
