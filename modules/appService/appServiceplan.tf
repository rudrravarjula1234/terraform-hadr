data "azurerm_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = var.rg_name
}
