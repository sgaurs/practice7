resource "azurerm_public_ip" "mypip" {
  for_each            = var.ChildPIP
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  zones                = each.value.zones
  ddos_protection_mode = each.value.ddos_protection_mode

  tags = each.value.tags
}


output "public_ip_addresses" {
  value = { for k, v in azurerm_public_ip.mypip : k => v.ip_address }
}