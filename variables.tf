variable "shared_resource_group_name" {
  description = "Name of the shared resource group"
}

variable "app_resource_group_name" {
  description = "Name of the application resource group"
}

variable "location" {
  description = "Azure region"
  default     = "YourAzureRegion"
}
