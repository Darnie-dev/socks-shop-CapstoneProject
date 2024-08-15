terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.115.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "azure-storage"  
    storage_account_name = "ayterraformstate"                      
    container_name       = "ayterraformstate"                       
    key                  = "capstone.terraform.tfstate"     
  }
}

provider "azurerm" {
  features {}
}
