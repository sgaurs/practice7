variable "ChildNIC" {
  type = map(object({
    subnetname           = string
    virtual_network_name = string
    resource_group_name  = string
    nicname              = string
    location             = string

    vmname                          = string
    size                            = string
    username                        = string
    admin_password                  = string
    disable_password_authentication = bool

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    ip_configuration = list(object({
      ipconfigname                  = string
      private_ip_address_allocation = string
    }))
  }))
}
