terraform {
  
  backend "azurerm" {
      resource_group_name  = "vh-core-infra-dev"
      storage_account_name = "vhmanagementdev"
      container_name       = "tfstate"
      key                  = "vh-reporting/dev-terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
