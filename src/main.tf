resource "azapi_resource" "apim_workspace" {
  type      = "Microsoft.ApiManagement/service/workspaces@2024-06-01-preview"
  name      = var.apim_workspace_name
  parent_id = var.apim_resource_id

  body = {
    properties = {
      description = var.apim_workspace_description
      displayName = var.apim_workspace_name
    }
  }
}

resource "azurerm_role_assignment" "sp_apim_workspace_contributor" {
  depends_on = [azapi_resource.apim_workspace]

  principal_id         = var.service_principal_object_id
  role_definition_name = "API Management Workspace Contributor"
  scope                = azapi_resource.apim_workspace.id
}

resource "azurerm_role_assignment" "owner_group_apim_workspace_contributorr" {
  depends_on = [azapi_resource.apim_workspace]

  principal_id         = var.owner_group_id
  role_definition_name = "API Management Workspace Contributor"
  scope                = azapi_resource.apim_workspace.id
}

resource "azurerm_role_assignment" "contributor_group_apim_workspace_contributor" {
  depends_on = [azapi_resource.apim_workspace]

  principal_id         = var.contributor_group_id
  role_definition_name = "API Management Workspace Contributor"
  scope                = azapi_resource.apim_workspace.id
}

resource "azurerm_role_assignment" "reader_group_apim_workspace_reader" {
  depends_on = [azapi_resource.apim_workspace]

  principal_id         = var.reader_group_id
  role_definition_name = "API Management Workspace Reader"
  scope                = azapi_resource.apim_workspace.id
}
