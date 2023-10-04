resource "azurerm_resource_group" "acs" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "acs" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.acs.name
  location                 = azurerm_resource_group.acs.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
}

output "storage_account_id" {
  description = "ID of the created Azure Storage Account."
  value       = azurerm_storage_account.acs.id
}



resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.acs.name
}

output "storage_account_name" {
  value = azurerm_storage_account.acs.name
}

output "resource_group_name" {
  value = azurerm_resource_group.acs.name
}