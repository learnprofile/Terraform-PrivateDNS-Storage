variable "resource_group_name" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "eastus"
}

variable "location" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "eastus"
}

variable "location_secondary" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "westus"
}

variable "storage_account" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "prademostg1332"
}

variable "account_tier" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "LRS"
}


variable "access_tier" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "Hot"
}


variable "shared" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "false"
}


variable "tenant" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "0e"
}

variable "environment" {
  type        = string
  description = "This is a Primary Azure region for A360"
  default     = "sbx"
}


# -------------added new values from line 74-85----------

variable "iac_subscription_id" {
  type        = string
  description = "Specify the azure subscription id for where resources for IAC deployment exist"
  default = "XXXXXXXXXX-XXXXXXXXXXXXX"
}


variable "deployment_subscription_id" {
  type        = string
  description = "Specify the azure subscription id for where resources for IAC deployment exist"
  default = "XXXXXXXXXX-XXXXXXXXXXXXX"
}



#--------------added new vnet info -----------

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network. You can supply more than one address space."
  default     = ["10.0.0.0/16"]
}



variable "subnet_address_prefix" {
  type        = string
  description = "The address space that is used the virtual network. You can supply more than one address space."
  default     = "10.1.0.0/24"
}

variable "subnet_name" {
  type        = string
  description = "The address space that is used the virtual network. You can supply more than one address space."
  default     = "appsubnet"
}


variable "subnet_id" {
  description = "ID of the subnet to associate with the Storage Account"
  type        = string
  default     = "appsubnet"
}


variable "remote_subnet_name" {
  description = "Name of the remote subnet in the remote Virtual Network"
  default     = "appsubnet"
}

variable "virtual_network_name" {
  description = "Name of the remote subnet in the remote Virtual Network"
  default     = "prademovnet"
}