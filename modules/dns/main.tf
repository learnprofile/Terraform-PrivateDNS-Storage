resource "azurerm_resource_group" "acs" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_private_dns_zone" "acs" {
  name                = "privatelink.blob.core.windows.net"
   resource_group_name = azurerm_resource_group.acs.name
}



resource "azurerm_private_dns_a_record" "acs" {
    name                  = var.storage_account_name
    zone_name             = azurerm_private_dns_zone.acs.name
    resource_group_name   = azurerm_resource_group.acs.name 
    ttl                   = 300
    records               = ["172.16.200.1"] 
  }





