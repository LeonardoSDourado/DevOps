# Create a virtual network in the production-resources resource group
resource "azurerm_virtual_network" "network_name" {
  name                = "production-network"
  resource_group_name = azurerm_resource_group.resource_group_name.name
  location            = azurerm_resource_group.resource_group_name.location
  address_space       = [var.vms["address_space"]]
}

resource "azurerm_subnet" "internal_network_name" {
  name                 = "internal_network"
  resource_group_name  = azurerm_resource_group.resource_group_name.name
  virtual_network_name = azurerm_virtual_network.network_name.name
  address_prefixes     = [var.vms["network_subnet"]]
}

resource "azurerm_public_ip" "public_ip_name" {
  name                = "${var.vms["vm"]}-public-ip"
  location            = azurerm_resource_group.resource_group_name.location
  resource_group_name = azurerm_resource_group.resource_group_name.name
  allocation_method   = "Dynamic"
  #sku                 = "Standard"
}

resource "azurerm_network_interface" "nic_name" {
  name                = "${var.vms["vm"]}-nic"
  resource_group_name = azurerm_resource_group.resource_group_name.name
  location            = azurerm_resource_group.resource_group_name.location

    ip_configuration {
    name                          = "${var.vms["vm"]}-nic"
    subnet_id                     = azurerm_subnet.internal_network_name.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_name.id
  }
}