resource "azurerm_linux_virtual_machine_scale_set" "ss" {
  name                = var.ss_name
  resource_group_name = azurerm_resource_group.terraform1.name
  location            = azurerm_resource_group.terraform1.location
  sku                 = var.vm_sku
  instances           = var.instance_number
  admin_username      = var.admin_user_name


  admin_ssh_key {
    username   = var.admin_user_name
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = var.canonical_name
    offer     = var.UbuntuServer_name
    sku       = var.image_sku_name
    version   = "latest"
  }

  os_disk {
    storage_account_type = var.Standard_LRS_name
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = var.subnet1_name
      primary   = true
      subnet_id = azurerm_subnet.subnet1.id
    }
  }
}
