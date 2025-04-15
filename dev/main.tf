module "kvm" {
  source     = "../modules/kvm"
}

module "k3s" {
  source     = "../modules/k3s"
  depends_on = [ module.kvm ]
}

resource "local_sensitive_file" "kubeconfig" {
  content  = module.k3s.kube_config
  filename = "${path.module}/config.yaml"
}
