#Allow our state to be persisted in blob storage
terraform {
  backend "azurerm" {
    storage_account_name = "statefile01012"
    container_name       = "statefile01012"
    key                  = "prod.terraform.tfstate"
  }
}

#Create a resource group to put our resources into
resource "azurerm_resource_group" "nft_resource_group" {
  name     = "TestWebAppRG"
  location = "West Europe"
}

#Create an App Service Plan
resource "azurerm_app_service_plan" "nft_app_service_plan" {
  name                = "some-app-service-plan"
  location            = "${azurerm_resource_group.nft_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.nft_resource_group.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

#Create an App Service
resource "azurerm_app_service" "nft_app_service" {
  name                = "TestWebApp0101"
  location            = "${azurerm_resource_group.nft_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.nft_resource_group.name}"
  app_service_plan_id = "${azurerm_app_service_plan.nft_app_service_plan.id}"

  site_config {
    default_documents = [
      "index.html",
    ]
  }
}
