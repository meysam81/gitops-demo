include "root" {
  path = find_in_parent_folders()
}

include "aws" {
  path = find_in_parent_folders("aws.hcl")
}

include "k8s" {
  path = find_in_parent_folders("k8s.hcl")
}

terraform {
  source = "../../modules/helm-release"
}

inputs = {
  release_name      = "external-secrets"
  chart_name        = "external-secrets"
  release_version   = "0.9.x"
  release_namespace = "flux-system"
  repository        = "https://charts.external-secrets.io"

  helm_timeout       = 300
  helm_wait_for_jobs = true

  helm_wait = false

  helm_create_namespace = true

  values = [
    "${file("values.yml")}",
  ]
}
