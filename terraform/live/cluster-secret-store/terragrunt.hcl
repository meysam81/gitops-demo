include "root" {
  path = find_in_parent_folders()
}

include "k8s" {
  path = find_in_parent_folders("k8s.hcl")
}

terraform {
  source = "../../modules/cluster-secret-store"
}

inputs = {
  aws_region             = dependency.iam.outputs.aws_region
  kubernetes_secret_name = dependency.iam.outputs.kubernetes_secret_name
  kubernetes_namespace   = dependency.es.outputs.namespace
  aws_role_arn           = dependency.iam.outputs.aws_role_arn
}

dependency "es" {
  config_path = "../external-secrets"
}

dependency "iam" {
  config_path = "../cd-user"
}
