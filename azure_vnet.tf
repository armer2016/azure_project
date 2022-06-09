# Create a resource group
resource "azurerm_resource_group" "vnet" {
  name     = var.rg_name
  location = var.rg_location
}
resource "azurerm_network_security_group" "vnet" {
  name                = "terraform-security-group"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
}
resource "azurerm_network_security_rule" "vnet" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.vnet.name
  network_security_group_name = azurerm_network_security_group.vnet.name
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet_network"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = var.address_space

  subnet {
    name           = var.subnet_names[0]
    address_prefix = var.address_prefix[0]
    security_group = azurerm_network_security_group.vnet.id
  }

  subnet {
    name           = var.subnet_names[1]
    address_prefix = var.address_prefix[1]
    security_group = azurerm_network_security_group.vnet.id
  }
  subnet {
    name           = var.subnet_names[2]
    address_prefix = var.address_prefix[2]
    security_group = azurerm_network_security_group.vnet.id
  }
}
