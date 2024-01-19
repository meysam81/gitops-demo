locals {
  tfc_hostname     = "app.terraform.io"
  tfc_organization = "meysam"
  workspace = format("gitops-demo-%s", replace(path_relative_to_include(), "/", "-"))
}

generate "remote_state" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "remote" {
        hostname = "${local.tfc_hostname}"
        organization = "${local.tfc_organization}"
        workspaces {
          name = "${local.workspace}"
        }
      }
    }
  EOF
}

terraform_version_constraint = "~> 1.5"
