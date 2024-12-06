terraform {
  required_version = "~> 1.1, <= 1.8.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.6.0, < 5.0.0"
    }
  }
}
