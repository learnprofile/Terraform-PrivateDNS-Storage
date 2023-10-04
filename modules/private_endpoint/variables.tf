variable "resource_group_name" {
  description = "Name of the Azure resource group"
}

variable "location" {
  description = "Location for the Azure resources"
}

variable "private_endpoint_name" {
  description = "Name of the Azure Private Endpoint"
}

variable "subnet_id" {
  description = "ID of the subnet where the Private Endpoint will be deployed"
}

variable "private_dns_zone_id" {
  description = "ID of the Private DNS zone associated with the Private Endpoint"
}

variable "storage_account_name" {
  description = "Name for the Azure Storage Account."
  type        = string
}

variable "storage_account_id" {
  description = "ID of the Azure Storage Account to which the private endpoint will be connected."
}