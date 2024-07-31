terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "csg10032003a5188a1c"
    container_name = "terraform"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
}