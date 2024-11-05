resource "azurerm_mssql_failover_group" "sfg" {
  name      = var.name
  server_id = data.azurerm_mssql_server.mss.id
  databases = var.databases

  dynamic "partner_server" {
    for_each = var.partner_server_names
    content {
      id = partner_server.value
    }
  }

  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 80
  }
}
