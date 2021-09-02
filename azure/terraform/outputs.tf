output "vm_name" {
    value = azurerm_linux_virtual_machine.vm_name.name
}

output "ip" {
    value = azurerm_network_interface.nic_name.ip_configuration
}