resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name = random_id.server.hex
  resource_group_name = azurerm_resource_group.terraform1.name

  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "traffic_manager"
    ttl = 100
  }

  monitor_config {
    protocol = "HTTP"
    port = 80
    path = "/"
    interval_in_seconds = 30
    timeout_in_seconds = 9
    tolerated_number_of_failures = 3
  }

}
