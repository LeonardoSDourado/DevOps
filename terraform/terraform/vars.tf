variable "providers_" {
  type = map
  default = {
    "subscription_id" = "XX"
    "client_id" = "XX"
    "client_secret" = "XX"
    "tenant_id" = "XX"
  }
}

variable "resource" {
  type = map
  default = {
    "name" = "production-resources"
    "location" = "Central US"
  }
}

variable "vms" {
  type = map
  default = {
    "vm" = "vm01"
    "size" = "Standard_D1_v2"
    "username" = "adminuser"
    "address_space" = "10.0.0.0/16"
    "network_subnet" = "10.0.3.0/24"
    "publisher_os" = "Canonical"
    "linux_os" = "UbuntuServer"
    "linux_version" = "18.04-LTS"
    "ssh_key" = "~/.ssh/id_rsa.pub"
  }
}

variable "source_acesso_remoto" {
  type = string
  default = "186.235.82.148/32"
}