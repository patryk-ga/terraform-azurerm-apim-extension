resource "azurerm_resource_group" "this" {
  count    = var.create_resource_group ? 1 : 0
  location = var.module_location
  name     = var.resource_group_name

  tags = merge(
    var.module_tags,
    var.resource_group_tags
  )
}

