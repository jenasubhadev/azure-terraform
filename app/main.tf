resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  kind                = "App"
  reserved            = true
  sku {
    tier = "YourAppServicePlanTier"
    size = var.app_service_plan_sku
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    # Define app settings, etc.
  }
}

output "app_service_url" {
  value = azurerm_app_service.app_service.default_site_hostname
}
