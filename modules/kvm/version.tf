#定义依赖和版本
terraform {
  required_version = ">=1.11.2"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc8"
    }
  }
}

