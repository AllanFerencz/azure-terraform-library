
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Root module should specify the maximum provider version
      # The ~> operator is a convenient shorthand for allowing only patch releases within a specific minor release.
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.application_name}-${var.environment_name}-${random_string.name.result}"
  location = var.location
  tags = {
    environment = "dev"
  }
}

resource "random_string" "name" {
  length  = 8
  special = false
  upper   = false
}

data "azurerm_client_config" "current" {}