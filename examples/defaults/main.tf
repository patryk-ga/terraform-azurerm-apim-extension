resource "random_string" "this" {
  length    = 4
  lower     = true
  min_lower = 4
  special   = false
}

module "defaults" {
  source = "../../src"

  # global
  module_location = "westeurope"
  module_tags = {
    creator    = "Example Creator"
    department = "Core Infrastructure"
  }

  # azurerm_resource_group
  create_resource_group = true
  resource_group_name   = "rg-example-ipgroup-${random_string.this.result}"

}
