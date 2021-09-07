resource "azurerm_virtual_network" "main" {
    name                = "${var.project_name}-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = var.group_name
}

resource "azurerm_subnet" "cluster" {
    name                 = "subnet-cluster"
    resource_group_name  = var.group_name
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_subnet" "jumpbox" {
    name                 = "subnet-jumpbox"
    resource_group_name  = var.group_name
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefixes     = ["10.0.3.0/24"]
}
resource "azurerm_subnet" "jenkins" {
    name                 = "subnet-jenkins"
    resource_group_name  = var.group_name
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_network_interface" "cluster" {
    name                = "cluster-nic"
    location            = var.location
    resource_group_name = var.group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.cluster.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface" "jumpbox" {
    name                = "jumpbox-nic"
    location            = var.location
    resource_group_name = var.group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.jumpbox.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface" "jenkins" {
    name                = "jenkins-nic"
    location            = var.location
    resource_group_name = var.group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.jenkins.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_security_group" "cluster" {
  name                = "cluster-nsg"
  location            = var.location
  resource_group_name = var.group_name

  security_rule {
    name                       = "cluster-rule"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "cluster" {
  subnet_id                 = azurerm_subnet.cluster.id
  network_security_group_id = azurerm_network_security_group.cluster.id
}

resource "azurerm_network_security_group" "jumpbox" {
  name                = "jumpbox-nsg"
  location            = var.location
  resource_group_name = var.group_name

  security_rule {
    name                       = "jumpbox-rule"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "jumpbox" {
  subnet_id                 = azurerm_subnet.jumpbox.id
  network_security_group_id = azurerm_network_security_group.jumpbox.id
}

resource "azurerm_subnet_network_security_group_association" "jenkins" {
  subnet_id                 = azurerm_subnet.jenkins.id
  network_security_group_id = azurerm_network_security_group.jenkins.id
}

resource "azurerm_network_security_group" "jenkins" {
  name                = "jenkins-nsg"
  location            = var.location
  resource_group_name = var.group_name

  security_rule {
    name                       = "jenkins-rule"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
