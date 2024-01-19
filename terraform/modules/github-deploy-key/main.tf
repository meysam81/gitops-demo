locals {
  ssm_key = coalesce(var.ssm_key, "/github/deploy-keys/${var.deploy_key_repository}/${lower(replace(var.deploy_key_title, " ", "-"))}")
}

resource "tls_private_key" "this" {
  algorithm = var.tls_private_key_algorithm
}

resource "github_repository_deploy_key" "this" {
  title      = var.deploy_key_title
  repository = var.deploy_key_repository
  key        = tls_private_key.this.public_key_openssh
  read_only  = var.deploy_key_read_only
}

resource "aws_ssm_parameter" "this" {
  name  = local.ssm_key
  type  = "SecureString"
  value = tls_private_key.this.private_key_pem
}
