variable "password" {
    default = "Enter123!"
}

variable "user" {
    default = "root"
}

variable "server_ip" {
  description = "K3s server node IP address"
  default = "192.168.174.99"
}

variable "agent_ip" {
  description = "K3s agent node IP address"
  default = "192.168.174.100"
  
}

