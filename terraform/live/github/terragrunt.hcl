include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/github-deploy-key"
}

inputs = {
  deploy_key_title      = "Local Kind FluxCD"
  deploy_key_repository = "gitops-demo"
  deploy_key_read_only  = false
}
