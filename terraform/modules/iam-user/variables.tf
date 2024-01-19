variable "username" {
  type    = string
  default = "cd-user"
}

variable "kubernetes_secret_name" {
  type     = string
  nullable = false
}

variable "kubernetes_secret_namespace" {
  type     = string
  nullable = false
}
