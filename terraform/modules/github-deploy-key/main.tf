resource "tls_private_key" "this" {
  algorithm = var.tls_private_key_algorithm
}

resource "github_repository_deploy_key" "this" {
  title      = var.deploy_key_title
  repository = var.deploy_key_repository
  key        = tls_private_key.this.public_key_openssh
  read_only  = var.deploy_key_read_only
}
