# 主要的业务逻辑
provider "proxmox" {
  # Configuration options
  pm_api_url       = var.pm_api_url
  pm_user          = var.pm_user
  pm_password      = var.pm_password
  pm_tls_insecure  = var.pm_tls_insecure
  pm_timeout       = var.pm_timeout
}


resource "proxmox_vm_qemu" "mynode1" {
  vmid        = 100
  name        = "tfmynode1"
  target_node = "pve"
  agent       = 1
  cores       = 2
  memory      = 4096
  boot        = "order=scsi0" # has to be the same as the OS disk of the template
  clone       = "debian12-cloudinit" # The name of the template
  scsihw      = "virtio-scsi-single"
  vm_state    = "running"
  automatic_reboot = true

  # Cloud-Init configuration
  cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade  = true
  nameserver = "114.114.114.114"
  ipconfig0  = "ip=192.168.174.99/24,gw=192.168.174.2"
  skip_ipv6  = true
  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.sshkeys

  # Most cloud-init images require a serial device for their display
  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "local-lvm"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "40G" 
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}

resource "proxmox_vm_qemu" "mynode2" {
    vmid        = 101
    name        = "tfmynode2"
  target_node = "pvenode2"
  agent       = 1
  cores       = 2
  memory      = 4096
  boot        = "order=scsi0" # has to be the same as the OS disk of the template
  clone       = "debian12-cloudinit" # The name of the template
  scsihw      = "virtio-scsi-single"
  vm_state    = "running"
  automatic_reboot = true

  # Cloud-Init configuration
  cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade  = true
  nameserver = "114.114.114.114"
  ipconfig0  = "ip=192.168.174.100/24,gw=192.168.174.2"
  skip_ipv6  = true
  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.sshkeys

  # Most cloud-init images require a serial device for their display
  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "local-lvm"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "40G" 
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}
