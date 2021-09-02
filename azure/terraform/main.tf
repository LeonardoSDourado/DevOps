# Configure the Microsoft Azure Provider
provider "azurerm" {
    version = "=2.20.0"
    subscription_id = var.providers_["subscription_id"]
    client_id       = var.providers_["client_id"]
    client_secret   = var.providers_["client_secret"]
    tenant_id       = var.providers_["tenant_id"]
    features {}
}

# Create a resource group
resource "azurerm_resource_group" "resource_group_name" {
  name     = var.resource["name"]
  location = var.resource["location"]
}