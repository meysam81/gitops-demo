include "root" {
  path = find_in_parent_folders()
}

include "aws" {
  path = find_in_parent_folders("aws.hcl")
}

terraform {
  source = "../../modules/github-deploy-key"
}

inputs = {
  deploy_key_title      = "Local Kind FluxCD"
  deploy_key_repository = "gitops-demo"
  deploy_key_read_only  = false

  ssm_key = "/github/deploy-keys/gitops-demo/local-kind-fluxcd"
}
