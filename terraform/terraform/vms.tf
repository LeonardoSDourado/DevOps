resource "azurerm_linux_virtual_machine" "vm_name" {
  name                  = var.vms["vm"]
  resource_group_name = azurerm_resource_group.resource_group_name.name
  location            = azurerm_resource_group.resource_group_name.location
  size                = var.vms["size"]
  admin_username      = var.vms["username"]
  network_interface_ids = [
    azurerm_network_interface.nic_name.id,
  ]

  admin_ssh_key {
    username   = var.vms["username"]
    public_key = file(var.vms["ssh_key"])
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vms["publisher_os"]
    offer     = var.vms["linux_os"]
    sku       = var.vms["linux_version"]
    version   = "latest"
  }
}