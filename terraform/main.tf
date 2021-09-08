terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 2.46.0"
        }    
    }    
}

provider "azurerm" {
    features {}
    use_msi = true
}


resource "azurerm_resource_group" "main" {
    name     = "devops-final-terraform"
    location = "uksouth"
}

module "vnet" {
    source       = "./network"
    project_name = var.project_name
    group_name   = azurerm_resource_group.main.name
    location     = var.location
}

module "vm" {
    source       = "./vm"
    project_name = var.project_name
    group_name   = azurerm_resource_group.main.name
    location     = var.location
    interface_ids = [module.vnet.interface_id]
}

module "cluster" {
    source       = "./cluster"
    project_name = var.project_name
    group_name   = azurerm_resource_group.main.name
    location     = var.location
}
