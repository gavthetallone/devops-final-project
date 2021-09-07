resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "cluster-aks1"
  location            = "West Europe"
  resource_group_name = var.group_name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}