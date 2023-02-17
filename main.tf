data "azurerm_subnet" "example" {
  name                 = "Subnet-1"
  virtual_network_name = "VNET-Prod-192"
  resource_group_name  = "Group-AMS-VNET-190"
}
resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.az_region
  resource_group_name = var.rg_name
  enable_accelerated_networking = var.nic_enable_accelerated_networking
  ip_configuration {
    name                          = "testintip"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = var.az_region
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.main.id]
  size           = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  allow_extension_operations = true
  disable_password_authentication = false
  proximity_placement_group_id = var.ppg_id
  zone = var.zone_id
  custom_data = filebase64("cloud-init.txt")
  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
}
