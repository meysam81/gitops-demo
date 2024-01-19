variable "tls_private_key_algorithm" {
  type    = string
  default = "ED25519"
}

variable "deploy_key_title" {
  type     = string
  nullable = false
}

variable "deploy_key_repository" {
  type     = string
  nullable = false
}

variable "deploy_key_read_only" {
  type    = bool
  default = true
}

variable "ssm_key" {
  type     = string
  nullable = true
}
