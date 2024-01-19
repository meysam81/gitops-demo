include "root" {
  path = find_in_parent_folders()
}

include "aws" {
  path = find_in_parent_folders("aws.hcl")
}

include "k8s" {
  path = find_in_parent_folders("k8s.hcl")
}

locals {
  secret_name = "cd-user-credentials"
}

terraform {
  source = "../../modules/iam-user"
}

inputs = {
  username = "local-kind"

  kubernetes_secret_name      = "cd-user-credentials"
  kubernetes_secret_namespace = dependency.es.outputs.namespace
}

dependency "es" {
  config_path = "../external-secrets"
}
