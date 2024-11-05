
resource "azurerm_mssql_database" "sql_database" {
  name         = var.databaseName
  server_id    = var.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
  create_mode                 = "Secondary"
  creation_source_database_id = var.source_database_id
}
