variable "resource_group_name" {
  description = "Name of the Azure resource group"
}

variable "location" {
  description = "Location for the Azure resources"
}



variable "private_dns_zone_name" {
  description = "The name of the Private DNS Zone."
}

variable "record_name" {
  description = "The name of the DNS record to create."
}

variable "record_type" {
  description = "The type of DNS record to create (e.g., A, CNAME)."
}



variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space of the virtual network."

}

variable "subnet_names" {
  description = "The names of the subnets in the virtual network."

}

variable "subnet_address_prefixes" {
  description = "The address prefixes of the subnets in the virtual network."

}


variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "vnet_private_endpoint_id" {
  description = "The ID of the Virtual Network Private Endpoint."

}


variable "private_dns_zone_group_name" {
  description = "Name of the Private DNS Zone Group for Private Endpoint"
}
