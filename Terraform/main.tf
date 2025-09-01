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


resource "azurerm_resource_group" "rg" {
  name     = "cloud-native-devops-platform"
  location = "Brazil South"
}
resource "azurerm_container_group" "aci_group" {
  name                = "live-prometheus-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "liveprometheusplatform"

  container {
    name   = "api"
    image  = "arthurfll/dotnet-api:1.0"
    cpu    = "0.5"
    memory = "1.0"
    ports {
      port = 5000
    }
  }

  container {
    name   = "prometheus"
    image  = "arthurfll/prometheus:1.0"
    cpu    = "0.5"
    memory = "1.0"
    ports {
      port = 9090
    }
  }

  container {
    name   = "grafana"
    image  = "grafana/grafana:10.2.2"
    cpu    = "0.5"
    memory = "0.5"
    ports {
      port = 3000
    }
  }
}