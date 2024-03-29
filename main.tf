# Define provider
provider "azurerm" {
  features {}
  region = "East US"
}

# Create Shared Resource Group
resource "azurerm_resource_group" "shared_rg" {
  name     = "Shared-Resource-Group"
  location = "East US"
}

# Create Application Resource Group
resource "azurerm_resource_group" "app_rg" {
  name     = "Application-Resource-Group"
  location = "East US"
}

module "app" {
  source = "./app"
}

module "gateway" {
  source = "./gateway"
}

# Create SQL Database
resource "azurerm_sql_server" "sql_server" {
  name                         = "munirdotnetdb"
  resource_group_name          = azurerm_resource_group.shared_rg.name
  location                     = azurerm_resource_group.shared_rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_sql_database" "sql_database" {
  name                = "munirdotnetdb"
  resource_group_name = azurerm_resource_group.shared_rg.name
  location            = azurerm_resource_group.shared_rg.location
  server_name         = azurerm_sql_server.sql_server.name
  edition             = "Standard"
  sku_name            = "S0"
  auto_grow_enabled   = true
}
