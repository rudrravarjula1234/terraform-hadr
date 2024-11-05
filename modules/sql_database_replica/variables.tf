variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}

variable "server_id" {
  type        = string
  description = "server name"
  default     = "sqlServer"
}

variable "databaseName" {
  type    = string
  default = "AnvianDb"
}

variable "source_database_id" {
  type    = string
  default = ""
}
