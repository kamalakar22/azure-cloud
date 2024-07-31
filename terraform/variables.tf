variable "resource_group_location" {
  description = "Location of resource group"
  default = "East Us"
  type = string
}


variable "vnet_adress_space" {
  description = "vnet range"
  default = ["10.0.0.0/16"]
  type = list(string)
}