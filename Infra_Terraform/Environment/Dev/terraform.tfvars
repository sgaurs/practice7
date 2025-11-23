ParentRG = {
  rg1 = {
    name       = "sumit-test-rg1"
    location   = "West Europe"
    managed_by = "Terraform"
    tags = {
      Cost-Centre = "devOps-India"
      Created-By  = "Sumit-Vats"
    }
  }
}


ParentVNET = {
  vnet1 = {
    name                = "myvnet"
    location            = "West Europe"
    resource_group_name = "sumit-test-rg1"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]

    subnet = [{
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
    }]

    encryption = [{
      enforcement = "AllowUnencrypted"
    }]

    tags = {
      Cost-Centre = "devOps-India"
      Created-By  = "Sumit-Vats"
    }
  }
}

ParentPIP = {
  pip1 = {
    name                = "mypip1"
    resource_group_name = "sumit-test-rg1"
    location            = "West Europe"
    allocation_method   = "Static"

    zones                = ["1"]
    ddos_protection_mode = "VirtualNetworkInherited"

    tags = {
      Cost-Centre = "devOps-India"
      Created-By  = "Sumit-Vats"
    }
  }
}


ParentNIC = {
  VM1 = {
    subnetname           = "subnet1"
    virtual_network_name = "myvnet"
    resource_group_name  = "sumit-test-rg1"
    nicname              = "mynic"
    location             = "West Europe"

    vmname                          = "myvm"
    size                            = "Standard_B1s"
    username                        = "devopsadmin"
    admin_password                  = "devopsadmin@123"
    disable_password_authentication = false

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Premium_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }


    ip_configuration = [{
      ipconfigname                  = "Internal"
      private_ip_address_allocation = "Dynamic"
    }]
  }
}
