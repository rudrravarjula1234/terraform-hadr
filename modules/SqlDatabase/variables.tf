variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}

variable "server_name" {
  type        = string
  description = "server name"
  default     = "sqlServer"
}

variable "userName" {
  type    = string
  default = ""
}
variable "password" {
  type    = string
  default = ""
}
variable "databaseName" {
  type    = string
  default = "AnvianDb"
}
