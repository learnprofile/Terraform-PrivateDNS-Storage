resource "azurerm_resource_group" "acs" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "acs" {
  name                     = var.virtual_network_name
  resource_group_name      = azurerm_resource_group.acs.name
  location                 = azurerm_resource_group.acs.location
  address_space            = var.address_space
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.acs.name
  virtual_network_name = azurerm_virtual_network.acs.name
  address_prefixes     = [var.subnet_address_prefixes[count.index]]
}

resource "azurerm_subnet" "endpoint_subnet" {
  name                 = "endpoint_subnet"
  resource_group_name  = azurerm_resource_group.acs.name
  virtual_network_name = azurerm_virtual_network.acs.name
  address_prefixes     = ["10.0.2.0/24"]
}


output "virtual_network_name" {
  value = azurerm_virtual_network.acs.name
}

output "resource_group_name" {
  value = azurerm_resource_group.acs.name
}

output "subnet_id" {
  description = "ID of the endpoint subnet"
  value       = azurerm_subnet.endpoint_subnet.id
}
