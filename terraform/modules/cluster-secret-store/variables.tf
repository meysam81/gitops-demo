variable "aws_region" {
  type     = string
  nullable = false
}

variable "kubernetes_secret_name" {
  type     = string
  nullable = false
}

variable "kubernetes_namespace" {
  type     = string
  nullable = false
}

variable "aws_role_arn" {
  type     = string
  nullable = false
}
