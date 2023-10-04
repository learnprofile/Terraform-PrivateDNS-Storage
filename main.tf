module "storage_account" {
  source                 = "./modules/storage_account"
  resource_group_name    = local.output_variables.storage_account_resource_group
  location               = var.location
  storage_account_name   = local.output_variables.storage_account_name
  account_tier           = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier            = var.access_tier
  container_name         = "examplecontainer"
}

module "virtual_network" {
  source                  = "./modules/virtual_network"
  resource_group_name     = local.output_variables.storage_account_resource_group
  location                = var.location
  virtual_network_name    = var.virtual_network_name
  address_space           = ["10.0.0.0/16"]
  subnet_names            = ["appsubnet", "endpoint_subnet"]
  subnet_address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "private_endpoint" {
  source                = "./modules/private_endpoint"
  resource_group_name   = local.output_variables.storage_account_resource_group
  location              = var.location
  private_endpoint_name = local.output_variables.storage_private_endpoint_name
  subnet_id             = module.virtual_network.subnet_id
  storage_account_id    = module.storage_account.storage_account_id
  private_dns_zone_id   = "your-private-dns-zone-id"  
  storage_account_name  = "example-storage-account"
}

module "dns" {
  source                = "./modules/dns"
  resource_group_name   = local.output_variables.storage_account_resource_group
  location              = var.location

  storage_account_name     = "local.output_variables.storage_account_name"
  private_dns_zone_name    = "privatelink.blob.core.windows.net"
  virtual_network_name     = "example-vnet"
  subnet_names             = "appsubnet"
  subnet_address_prefixes  = "172.16.200.1"
  vnet_private_endpoint_id = "azurerm_private_endpoint.acs.id"
  record_type              = "A"
  private_dns_zone_group_name = "test"
  record_name              = "test"
  address_space            = "test"
  
}


output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "virtual_network_name" {
  value = module.virtual_network.virtual_network_name
}

output "private_endpoint_id" {
  value = module.private_endpoint.private_endpoint_id
}

output "subnet_id" {
  value = module.private_endpoint.subnet_id
}

