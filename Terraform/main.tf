terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "cloud_native_devops_platform" {
  name     = "cloud-native-devops-platform"
  location = "Brazil South"
}
