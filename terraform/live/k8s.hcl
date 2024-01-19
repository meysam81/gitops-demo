locals {
  kube_context = "kind-kind"
  kube_config_path = pathexpand("~/.kube/config")
}

generate "k8s" {
  path      = "provider_k8s.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "helm" {
      kubernetes {
        config_context = "${local.kube_context}"
        config_path    = "${local.kube_config_path}"
      }
    }

    provider "kubernetes" {
      config_context = "${local.kube_context}"
      config_path    = "${local.kube_config_path}"
    }
  EOF
}
