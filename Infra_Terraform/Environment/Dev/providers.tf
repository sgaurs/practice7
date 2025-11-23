terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "Sumit_Test_RG"
  #   storage_account_name = "mystate"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  #   subscription_id      = "6e65d60a-bc12-4f70-8dcd-6cdb4da48e3e"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "6e65d60a-bc12-4f70-8dcd-6cdb4da48e3e"
}
