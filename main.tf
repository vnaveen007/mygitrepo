terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = ""
        }
    }
}

provider "azurerm" {
    features {}
}

variable "rgname"{
    type    = string
    default = "aks-test"
}

variable "location"{
    type    = string
    default = "East US"
}


resource "azurerm_resource_group" "aks_test" {
    name     = "${var.rgname}-rg"
    location = var.location
}

resource "azurerm_azure_container_registry" "acr_test" {
    name                = "acrtestregistry"
    resource_group_name = azurerm_resource_group.aks_test.name
    location            = azurerm_resource_group.aks_test.location
    sku                 = "Free"
}

resource "azurerm_kubernetes_cluster" "aks_test" {
    name                = "aks-test-cluster"
    location            = azurerm_resource_group.aks_test.location
    resource_group_name = azurerm_resource_group.aks_test.name

    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_DS2_v2"
    }

    identity {
        type = "Managed"
    }
}

