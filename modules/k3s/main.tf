module "k3s" {
  source                   = "xunleii/k3s/module"
  k3s_version              = "v1.28.15+k3s1"
  cluster_domain = "cluster.local"
  
  generate_ca_certificates = true
  cidr = {
    pods     = "10.42.0.0/16"
    services = "10.43.0.0/16"
  }
  drain_timeout = "30s"
  managed_fields = ["labels", "taint"] //ignore annotations

  k3s_install_env_vars = {}

  servers = {
    "k3s-server" = {
      ip = var.server_ip
      flags = [
          "--tls-san ${var.server_ip}",
           "--write-kubeconfig-mode 644",
           "--disable=traefik",
           "--kube-controller-manager-arg bind-address=0.0.0.0",
           "--kube-proxy-arg metrics-bind-address=0.0.0.0",
           "--kube-scheduler-arg bind-address=0.0.0.0",
        ]
      connection = {
        timeout  = "60s"
        type     = "ssh"
        host     = var.server_ip
        password = var.password
        user     = var.user
      }
    }
  }
  agents = {
    "k3s-agent" = {
      ip = var.agent_ip
      connection = {
        timeout  = "60s"
        type     = "ssh"
        host     = var.agent_ip
        password = var.password
        user     = var.user
      }
    }
  }
}
