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
    subscription_id = "36391976-a17c-41d1-bd4f-1661b1ba317c"
    client_id="7a1f2fd6-3069-41a0-acd1-354305761e34"
    tenant_id="e66f54dc-192f-441b-8956-cb18dedc435d"
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
