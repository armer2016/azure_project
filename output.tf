output "vnet_id" {
  value = azurerm_virtual_network.azure_project.id
}

output "subnet" {
  value = azurerm_virtual_network.azure_project.subnet
}

output "subnet_id" {
  value = azurerm_virtual_network.azure_project.subnet.*.id[1]

}
output "vnet_name" {
  value = azurerm_virtual_network.azure_project.name
}
output "resource_group_name" {
  value = azurerm_resource_group.azure_project.name
}

output "resource_group_location" {
  value = azurerm_resource_group.azure_project.location
}  