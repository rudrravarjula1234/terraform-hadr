data "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.vnet_name
}
