variable "ChildVNET" {
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
