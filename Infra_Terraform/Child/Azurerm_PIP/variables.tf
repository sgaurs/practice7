variable "ChildPIP" {
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
