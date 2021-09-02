resource "azurerm_network_security_group" "security_group_name" {
    name                = "security_group_name"
    location            = azurerm_resource_group.resource_group_name.location
    resource_group_name = azurerm_resource_group.resource_group_name.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = var.source_acesso_remoto
        destination_address_prefix = "*"
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
    network_interface_id      = azurerm_network_interface.nic_name.id
    network_security_group_id = azurerm_network_security_group.security_group_name.id
}