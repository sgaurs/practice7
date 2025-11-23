variable "ParentRG" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "ParentVNET" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))

    subnet = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))

    encryption = optional(list(object({
      enforcement = string
    })))

    tags = optional(map(string))
  }))
}


variable "ParentPIP" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    allocation_method    = string
    zones                = optional(list(string))
    ddos_protection_mode = optional(string)
    tags                 = optional(map(string))
  }))
}


variable "ParentNIC" {
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
