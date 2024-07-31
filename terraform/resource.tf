resource "azurerm_resource_group" "dev-rg" {
  name = "${local.resource_name_prefix}-dev-rg"
  location = var.resource_group_location
}