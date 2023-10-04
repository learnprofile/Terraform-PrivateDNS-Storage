resource "azurerm_resource_group" "acs" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_private_endpoint" "acs" {
  name                = var.private_endpoint_name
  location            = azurerm_resource_group.acs.location
  resource_group_name = azurerm_resource_group.acs.name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "example-connection"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}


output "private_endpoint_id" {
  description = "ID of the created Azure Private Endpoint."
  value       = azurerm_private_endpoint.acs.id
}



output "subnet_id" {
  value = azurerm_private_endpoint.acs.subnet_id
}
