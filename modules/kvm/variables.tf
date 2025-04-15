# 定义变量参数
variable "pm_api_url" {
  type = string
  description = "Proxmox API URL"
  default = "https://192.168.174.91:8006/api2/json"
  validation {
    condition = length(var.pm_api_url) > 0
    error_message = "Proxmox API URL must be specified"
  }
}
variable "pm_user" {
  type = string
  description = "Proxmox API user"
  default = "root@pam"
  validation {
    condition = length(var.pm_user) > 0
    error_message = "Proxmox API user must be specified"
  }
}
variable "pm_password" {
  type = string
  description = "Proxmox API password"
  default = "1234.com"
  validation {
    condition = length(var.pm_password) > 0
    error_message = "Proxmox API password must be specified"
  }
}
variable "pm_tls_insecure" {
  type = bool
  description = "Proxmox API TLS insecure"
  default = true
}

variable "pm_timeout" {
  type = number
  description = "Proxmox API timeout"
  default = 300
}

variable "ciuser" {
  type = string
  description = "Cloud-Init user"
  default = "root"
  
}
variable "cipassword" {
  type = string
  description = "Cloud-Init password"
  default = "Enter123!"
}

variable "sshkeys" {
  type = string
  description = "SSH keys"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgFyjwAziWUYAWFiLDMTmrpAM3zt/2df8vIsJuFjqyjsPHSPlZ1+h72acX9iamoyVwt3Nyp/eLoFMEhMEAN246Is2fJ0uxJtpSJ+lr4pWRN8PLR+1qNJMdd1MhfR8+FHnWpeIhAG00JuAgr9EijqDO3OswQZerlXKYEm95cvE6oy3MvdN2gzMWo9egsYNoTwVOccksPe7SR6IAWn2Uw0wfMp5eE7jkxkbABbrguXlHQyZNxSDZp7+JUbxXGJwd8XAJrsiuomtrAXvrsydk2LFqYrVArlZKN/kp4ChKwmxpn23nEsFBsAsVfYMvYLAEf2zZCB0EyrdMjICv5eBK53mikbJ09y6NAif+hhvl+oyUXjCR123s12uXiz0LBgyzbXSjzg2WYs4Bc57IXQjATMh6T2CTR7xUaWlRsZeieZ/VUHuWWofIDBI0pfCrZwUpThX4t0T/JnzhdctrXdgAAMQZPyOM8n98i6Bh/ccTFXAvmKseaqBEWaEv67BK8H5B/00= root@tfmynode1"
  }
