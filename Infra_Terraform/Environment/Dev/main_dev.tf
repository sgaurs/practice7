module "rg_call" {
  source  = "../../Child/Azurerm_RG"
  ChildRG = var.ParentRG
}

module "vnet-snet_call" {
  depends_on = [module.rg_call]
  source     = "../../Child/Azurerm_VNET+SNET"
  ChildVNET  = var.ParentVNET
}

module "pip_call" {
  depends_on = [module.rg_call]
  source = "../../Child/Azurerm_PIP"
  ChildPIP = var.ParentPIP
}

module "nic-vm_call" {
  depends_on = [module.rg_call, module.vnet-snet_call, module.pip_call]
  source = "../../Child/Azurerm_NIC+VM"
  ChildNIC = var.ParentNIC
}


output "public_ip_addresses" {
  value = module.pip_call.public_ip_addresses
}

#