output "vnet_id" {
    value = azurerm_virtual_network.terraform.id
}


output "subnet"{
    value = azurerm_virtual_network.terraform.subnet
}

output "subnet_id" {
  value = "${azurerm_virtual_network.terraform.subnet.*.id[1]}"

}
output "vnet_name"{
    value = azurerm_virtual_network.terraform.name
}
output resource_group_name {
  value = azurerm_resource_group.terraform.name
}

output resource_group_location {
   value = azurerm_resource_group.terraform.location
}
