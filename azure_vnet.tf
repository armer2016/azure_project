# Create a resource group
resource "azurerm_resource_group" "vnet_rg" {
  name     = var.rg_name
  location = var.rg_location
}
resource "azurerm_network_security_group" "vnet_sg" {
  name                = "terraform-security-group"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
}
resource "azurerm_network_security_rule" "vnet_sr" {
  name                        = "outbound_sr"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.vnet_rg.name
  network_security_group_name = azurerm_network_security_group.vnet_sg.name
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = var.address_space

  subnet {
    name           = var.subnet_names1
    address_prefix = var.address_prefix1
    security_group = azurerm_network_security_group.vnet_sg.id
  }

  subnet {
    name           = var.subnet_names2
    address_prefix = var.address_prefix2
    security_group = azurerm_network_security_group.vnet_sg.id
  }
  subnet {
    name           = var.subnet_names3
    address_prefix = var.address_prefix3
    security_group = azurerm_network_security_group.vnet_sg.id
  }
}
