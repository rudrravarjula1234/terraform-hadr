data "azurerm_subnet" "subnet" {
  name                 = var.name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}
