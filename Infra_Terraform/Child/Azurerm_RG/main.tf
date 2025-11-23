resource "azurerm_resource_group" "myrg" {
  for_each   = var.ChildRG
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
  tags       = each.value.tags
}
