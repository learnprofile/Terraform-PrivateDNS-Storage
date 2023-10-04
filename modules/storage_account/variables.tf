variable "resource_group_name" {
  description = "Name of the Azure resource group"
}

variable "location" {
  description = "Location for the Azure resources"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
}

variable "account_tier" {
  description = "Storage Account Tier (e.g., Standard)"
}

variable "account_replication_type" {
  description = "Storage Account Replication Type (e.g., LRS)"
}

variable "access_tier" {
  description = "Access Tier for Blob Storage (e.g., Hot)"
}

variable "container_name" {
  description = "Name of the Storage Container"
}
