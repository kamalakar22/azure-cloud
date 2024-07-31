variable "resource_group_location" {
  description = "Location of resource group"
  default = "East Us"
  type = string
}


# variable "vnet_adress_space" {
#   description = "vnet range"
#   default = ["10.0.0.0/16"]
#   type = list(string)
# }

# Define the variable for the Virtual Network address space
variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Define variables for the subnet address prefixes
variable "web_subnet_address_prefix" {
  description = "Address prefix for the web subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "app_subnet_address_prefix" {
  description = "Address prefix for the application subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "db_subnet_address_prefix" {
  description = "Address prefix for the database subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "bastion_subnet_address_prefix" {
  description = "Address prefix for the bastion host subnet"
  type        = string
  default     = "10.0.4.0/24"
}
