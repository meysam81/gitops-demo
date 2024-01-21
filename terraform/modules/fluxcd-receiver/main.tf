resource "random_password" "this" {
  length  = var.password_length
  special = true
}

resource "github_repository_webhook" "this" {
  repository = var.repository
  events     = ["push"]
  active     = true

  configuration {
    url          = var.receiver_url
    content_type = "json"
    insecure_ssl = false
    secret       = random_password.this.result
  }
}

resource "kubernetes_secret" "this" {
  metadata {
    name      = var.secret_name
    namespace = var.secret_namespace
  }

  data = {
    token = random_password.this.result
  }
}

resource "kubernetes_manifest" "this" {
  manifest = {
    apiVersion = "notification.toolkit.fluxcd.io/v1"
    kind       = "Receiver"
    metadata = {
      name      = var.receiver_name
      namespace = var.receiver_namespace
    }
    spec = {
      type = "github"
      events = [
        "ping",
        "push",
      ]
      secretRef = {
        name = var.secret_name
      }
      resources = var.receiver_resources
    }
  }
}
