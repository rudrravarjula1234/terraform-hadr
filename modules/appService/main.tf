resource "azurerm_linux_web_app" "alwa" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_service_plan.asp.location
  service_plan_id     = data.azurerm_service_plan.asp.id
  site_config {}
}
