# Declare the resource group
resource "azurerm_resource_group" "dev_rg" {
  name     = "${local.resource_name_prefix}-rg"
  location = var.resource_group_location
  tags     = local.common_tags
}


# Define the Virtual Network
resource "azurerm_virtual_network" "dev_vnet" {
  name                = "${local.resource_name_prefix}-dev-vnet"
  resource_group_name = azurerm_resource_group.dev_rg.name
  location            = var.resource_group_location
  address_space       = var.vnet_address_space
  tags                = local.common_tags
}

# Define the Web Subnet
resource "azurerm_subnet" "web_subnet" {
  name                 = "${local.resource_name_prefix}-web_subnet"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Define the App Subnet
resource "azurerm_subnet" "app_subnet" {
  name                 = "${local.resource_name_prefix}-app_subnet"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Define the Database Subnet
resource "azurerm_subnet" "db_subnet" {
  name                 = "${local.resource_name_prefix}-db_subnet"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

# Define the Bastion Host Subnet
resource "azurerm_subnet" "bastion_subnet" {
  name                 = "${local.resource_name_prefix}-bastion_subnet"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

# Define the Network Security Group for Web
resource "azurerm_network_security_group" "web_nsg" {
  name                = "${local.resource_name_prefix}-web-nsg"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.dev_rg.name
  tags                = local.common_tags
}

# Define the Network Security Group for App
resource "azurerm_network_security_group" "app_nsg" {
  name                = "${local.resource_name_prefix}-app-nsg"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.dev_rg.name
  tags                = local.common_tags
}

# Define the Network Security Group for Database
resource "azurerm_network_security_group" "db_nsg" {
  name                = "${local.resource_name_prefix}-db-nsg"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.dev_rg.name
  tags                = local.common_tags
}

# Define the Network Security Group for Bastion Host
resource "azurerm_network_security_group" "bastion_nsg" {
  name                = "${local.resource_name_prefix}-bastion-nsg"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.dev_rg.name
  tags                = local.common_tags
}

# Associate NSG with Web Subnet
resource "azurerm_subnet_network_security_group_association" "web_assoc" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}

# Associate NSG with App Subnet
resource "azurerm_subnet_network_security_group_association" "app_assoc" {
  subnet_id                 = azurerm_subnet.app_subnet.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

# Associate NSG with Database Subnet
resource "azurerm_subnet_network_security_group_association" "db_assoc" {
  subnet_id                 = azurerm_subnet.db_subnet.id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
}

# Associate NSG with Bastion Host Subnet
resource "azurerm_subnet_network_security_group_association" "bastion_assoc" {
  subnet_id                 = azurerm_subnet.bastion_subnet.id
  network_security_group_id = azurerm_network_security_group.bastion_nsg.id
}
