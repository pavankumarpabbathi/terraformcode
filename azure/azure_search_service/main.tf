resource "azurerm_search_service" "search_service" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.sku
  local_authentication_enabled = true ## Specifies whether the Search Service allows authenticating using API Keys?
  dynamic "identity" {
    for_each = var.sku != "free" ? ["identity"] : []
    content {
      type = "SystemAssigned"
    }
  }
  tags = var.tags
}