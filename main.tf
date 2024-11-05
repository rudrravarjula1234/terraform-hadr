

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.4.0"
    }
  }
  required_version = ">= 1.9.7"
}



locals {
  app_service_ips = flatten([for instance in module.app_service : instance.outbound_ip_address_list])
  public_ips = {
    for ip in module.public_ip : ip.ip_address => {
      target_ip = ip.ip_address
      weight    = 100
    }
  }
}


module "resource_group" {
  source   = "./modules/resourcegroup"
  for_each = var.locations
  name     = "app-rg-${var.resource_group_name}-${each.key}"
  location = each.value.location
}

module "network" {
  source      = "./modules/vnet"
  for_each    = var.locations
  vnet_name   = "app-vnet-${var.vnet_name}-${each.key}"
  subnet_name = "app-subnet-${var.subnet_name}-${each.key}"
  rg_name     = "app-rg-${var.resource_group_name}-${each.key}"
}

module "public_ip" {
  source   = "./modules/public_ip"
  for_each = var.locations
  name     = "app-pip-${var.public_ip_name}-${each.key}"
  rg_name  = "app-rg-${var.resource_group_name}-${each.key}"
}


module "trafic_manager" {
  source    = "./modules/azureTraficManager"
  rg_name   = "app-rg-${var.resource_group_name}-1"
  name      = "app-tm-hadr"
  endpoints = local.public_ips
}

module "app_service_plan" {
  source          = "./modules/appservicePlan"
  for_each        = var.locations
  name            = "app-asp-${var.asp_name}-${each.key}"
  app_service_sku = "S1"
  rg_name         = "app-rg-${var.resource_group_name}-${each.key}"
}

module "app_service" {
  source   = "./modules/appService"
  for_each = var.locations
  name     = "app-as-${var.as_name}-${each.key}"
  asp_name = "app-asp-${var.asp_name}-${each.key}"
  rg_name  = "app-rg-${var.resource_group_name}-${each.key}"
}

module "app_gateway" {
  source            = "./modules/app_gateway"
  for_each          = var.locations
  name              = "app-agw-hadr-${each.key}"
  rg_name           = "app-rg-${var.resource_group_name}-${each.key}"
  vnet_name         = "app-vnet-${var.vnet_name}-${each.key}"
  pip_name          = "app-pip-${var.public_ip_name}-${each.key}"
  backend_ipaddress = local.app_service_ips
}

module "sql_database" {
  source       = "./modules/SqlDatabase"
  server_name  = "app-sqlserver-hadr-1"
  databaseName = "anviandb"
  userName     = "sqlAdmin"
  password     = "strong_password_123"
}

module "sql_database_hadr" {
  source             = "./modules/sql_database_replica"
  for_each           = { for k, v in var.locations : k => v if k > 1 }
  databaseName       = "anviandb"
  source_database_id = "app-sqlserver-hadr-1"
}


module "sql_failover_group" {
  source               = "./modules/sqlFailoverGroup"
  name                 = "app-sql-fog-hadr"
  rg_name              = "app-rg-${var.resource_group_name}-1"
  sql_server_name      = "app-sqlserver-hadr-1"
  partner_server_names = [for key, id in module.sql_database_hadr.sql_server_id : id]
  databases            = [for id in module.sql_database.sql_database_id : id]
}
