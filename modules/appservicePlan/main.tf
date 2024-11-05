
resource "azurerm_service_plan" "asp" {
  name                   = var.name
  location               = data.azurerm_resource_group.rg.location
  resource_group_name    = data.azurerm_resource_group.rg.name
  os_type                = "Linux"
  sku_name               = var.app_service_sku
  zone_balancing_enabled = true

  tags = var.tags
}
