terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "cb-tfstates"
        storage_account_name = "tfstate4kl0e"
        container_name       = "tfstates"
        key                  = "rgandvnet.tfstate"
    }

}

provider "azurerm" {
  features {}
}
