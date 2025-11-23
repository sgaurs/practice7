data "azurerm_subnet" "subnetID" {
  for_each             = var.ChildNIC
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pipID" {
  name                = "mypip1"
  resource_group_name = "sumit-test-rg1"
}

resource "azurerm_network_interface" "mynic" {
  for_each            = var.ChildNIC
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name      = ip_configuration.value.ipconfigname
      subnet_id = data.azurerm_subnet.subnetID[each.key].id

      public_ip_address_id          = data.azurerm_public_ip.pipID.id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
}

resource "azurerm_linux_virtual_machine" "myvm" {
  for_each = var.ChildNIC
  name                            = each.value.vmname
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    azurerm_network_interface.mynic[each.key].id,
  ]

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}
