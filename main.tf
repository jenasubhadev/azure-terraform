# Shared resources
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "shared_rg" {
  name     = var.shared_resource_group_name
  location = var.location
}

resource "azurerm_resource_group" "app_rg" {
  name     = var.app_resource_group_name
  location = var.location
}

module "app" {
  source = "./app"
}

module "gateway" {
  source = "./gateway"
}

output "app_service_url" {
  value = module.app.app_service_url
}

output "gateway_url" {
  value = module.gateway.gateway_url
}
