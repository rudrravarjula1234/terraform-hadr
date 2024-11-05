resource "azurerm_traffic_manager_profile" "tmp" {
  name                   = var.name
  resource_group_name    = data.azurerm_resource_group.rg.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = var.name
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = var.tags
}


resource "azurerm_traffic_manager_azure_endpoint" "tmpe" {
  for_each             = var.endpoints
  name                 = each.key
  profile_id           = azurerm_traffic_manager_profile.tmp.id
  always_serve_enabled = true
  weight               = each.value.weight
  target_resource_id   = each.value.target_ip
}
