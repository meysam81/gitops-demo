variable "password_length" {
  type    = number
  default = 32
}

# variable "ssm_key" {
#   type     = string
#   nullable = false
# }

variable "repository" {
  type     = string
  nullable = false
}

variable "secret_name" {
  type    = string
  default = "webhook-token"
}

variable "secret_namespace" {
  type    = string
  default = "flux-system"
}

variable "receiver_name" {
  type    = string
  default = "github-receiver"
}

variable "receiver_namespace" {
  type    = string
  default = "flux-system"
}

variable "receiver_resources" {
  type = list(object({
    apiVersion  = optional(string)
    kind        = string
    name        = optional(string)
    namespace   = string
    matchLabels = optional(map(string))
  }))
  nullable = false
}

variable "receiver_url" {
  type     = string
  nullable = false
}
