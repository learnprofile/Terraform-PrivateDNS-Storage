#---------------------------------------------------------------
# Locals
#---------------------------------------------------------------
locals {
  shared                           = var.shared
  tenant                           = var.tenant
  tenant_prefix                    = local.shared? "shared" : "tenant"
  environment                      = var.environment
  tenant_name                      = "${local.tenant_prefix}${local.tenant}" 
  tenant_env                       = "${local.tenant_name}${local.environment}"
  tenant_domain                    = "${local.tenant_env}.com"
  tenant_short_name                = "${local.shared? "sh" : "tn"}${local.tenant}"
  dns_record_prefix                = "${local.tenant_name}-${local.environment}"
  name_format_prefix               = "${local.tenant_short_name}${local.environment}"
  primary_resource_name_format     = "${local.name_format_prefix}${var.location}"


  // VM variables to build hostname                                                                            
  tenant_or_shared_letter          = substr(local.tenant_short_name,0,1)                                       
  tenant_label                     = "${local.tenant_or_shared_letter}${substr(local.tenant,1,1)}"             
  
  // exported variables via outputs
  output_variables                 = {
    name_format_prefix             = local.name_format_prefix
    primary_resource_name_format   = local.primary_resource_name_format


    // Tenant
    tenant_env                     = local.tenant_env
    tenant_prefix                  = local.tenant_prefix
    tenant_name                    = local.tenant_name
    tenant_domain                  = local.tenant_domain
    tenant_domain_name             = local.tenant_env
    tenant_short_name              = local.tenant_short_name
  

    // Hostname.
    tenant_label                   = local.tenant_label
    tenant_env_letter              = substr(local.environment,0,1)



	//storage account
	storage_account_name           ="${local.primary_resource_name_format}storage"
	storage_account_resource_group = "${local.primary_resource_name_format}-storage01" 
	
	
	// VNet Primary
    primary_vnet_name              = "${local.primary_resource_name_format}-vnet"
    primary_vnet_resource_group    = "${local.primary_resource_name_format}-spoke" 	


 // private endpoint name
 storage_private_endpoint_name = 	"${local.primary_resource_name_format}storage-ep"
	
  }


}




locals {
  storage_account_name = module.storage_account.storage_account_name
}


